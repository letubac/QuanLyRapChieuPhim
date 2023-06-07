package admin.controller;

import java.text.DecimalFormat;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ptithcm.entity.PhongChieu;


@Transactional
@Controller
@RequestMapping("/admin/")
public class RoomController {
	@Autowired
	SessionFactory factory;

	public List<PhongChieu> getRooms() {
			Session session = factory.getCurrentSession();
			String hql = "FROM PhongChieu";
			Query query = session.createQuery(hql);
			List<PhongChieu> list = query.list();
			return list;
	}

	public PhongChieu getSingleRooms(String maPhong) {
		Session session = factory.getCurrentSession();
		String hql = "FROM PhongChieu where maPhong=:maPhong";
		Query query = session.createQuery(hql);
		query.setParameter("maPhong", maPhong);
		PhongChieu n = (PhongChieu) query.list().get(0);

		return n;
	}
	public String generatorId(String refix, String table, String columnId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM " + table;
		Query query = session.createQuery(hql);
		int number = query.list().size() + 1;
		boolean isInValid = true;
		String id = refix;
		DecimalFormat df = new DecimalFormat("00");
		while (isInValid) {
			String pkTemp = id + df.format(number);
			System.out.println(pkTemp);
			String hqlwhere = hql + " WHERE " + columnId + " = '" + pkTemp + "'";
			query = session.createQuery(hqlwhere);
			if (query.list().size() > 0)
				number++;
			else {
				id = pkTemp;
				isInValid = false;
			}
		}
		return id;
	}
	@RequestMapping(value = "room/add.htm", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("room") PhongChieu room, BindingResult result,
			BindingResult errors, RedirectAttributes redirectAttributes) {


		try {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				room.setMaPhong(generatorId("P", "PhongChieu", "maPhong"));
				room.setTongSoGhe(48);
				room.setTrangThai(false);
				session.save(room);
				redirectAttributes.addFlashAttribute("message",
						new Message("success","Thêm Phòng thành công"));
				t.commit();

				return "redirect:/admin/room.htm";

			} catch (Exception e) {
				t.rollback();
				System.out.println("error catch " + e.getCause());
			} finally {
				session.close();
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		List<PhongChieu> pc = getRooms();
		model.addAttribute("pc", pc);
		redirectAttributes.addFlashAttribute("message",
				new Message("error","Thêm Phòng thất bại"));
		return "redirect:/admin/room.htm";
	}

	@RequestMapping(value = "room/delete/{id}.htm")
	public String Delete(ModelMap model,@ModelAttribute("room") PhongChieu room, @PathVariable("id") String id,RedirectAttributes redirectAttributes) {
		try {
			PhongChieu t = this.getSingleRooms(id);
			System.out.println(id);
			Integer temp =this.deleteRooms(t);
			if(temp!=0) {
				redirectAttributes.addFlashAttribute("message",
						new Message("success","xóa thành bại"));
				model.addAttribute("message","Xóa thành công!");
			}
			else {
				model.addAttribute("message","Xóa thất bại!");
			}
			
			return "redirect:/admin/room.htm";
		} catch(Exception e){
			System.out.println(e);
			redirectAttributes.addFlashAttribute("message",
					new Message("error","xóa thất bại"));
			return "redirect:/admin/room.htm";
		}
	}

	public Integer deleteRooms(PhongChieu rooms) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(rooms);
			t.commit();
			System.out.println("success");
		}
		catch(Exception e) {
			System.out.println(e);
			t.rollback();
			return 0;
		}
		finally {
			session.close();
		}
		return 1;
	}
	
	@RequestMapping(value = "room/update/{id}.htm",  method=RequestMethod.POST)
	public String updateRoom(ModelMap model,@ModelAttribute("room") PhongChieu room, @PathVariable("id") String id,RedirectAttributes redirectAttributes) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			PhongChieu idnews = this.getSingleRooms(id);
			if(idnews.getTrangThai()) {
				idnews.setTrangThai(false);
			} else {
				idnews.setTrangThai(true);
			}
			session.merge(idnews);
			t.commit();
			redirectAttributes.addFlashAttribute("message",
					new Message("success","sửa thành công"));
			return "redirect:/admin/room.htm";
		}
		catch(Exception e) {
			System.out.println(e);
			t.rollback();
		}
		finally {
			session.close();
		}

		redirectAttributes.addFlashAttribute("message",
				new Message("error","sửa thất bại"));
		return "redirect:/admin/room.htm";
	}
}

