package admin.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ptithcm.entity.GiaVeConfig;
import ptithcm.entity.KhuyenMai;
import ptithcm.entity.LichChieu;
import ptithcm.entity.Phim;
import ptithcm.entity.TheLoai;

@Transactional
@Controller
@RequestMapping("admin")
public class TicketConfigController {

	@Autowired
	SessionFactory factory;
	
	public List<GiaVeConfig> getDsGiaVe(){
		Session session = factory.getCurrentSession();
		String hql = "FROM GiaVeConfig order by id desc";
		Query query = session.createQuery(hql);
		List<GiaVeConfig> list = query.list();
		
		return list;
	}
	
	public Integer getLichChieusByIdPhim(Integer id){
		Session session = factory.getCurrentSession();
		String hql = "FROM LichChieu";
		Query query = session.createQuery(hql);
		List<LichChieu> list = query.list();
		
		for(LichChieu l : list) {
			if(l.getDsPhim().getMaPhim()==id) {
				return 1;
			}
		}
		
		
		return 0;
	}
	
	public GiaVeConfig getSingleGiaVeConfig(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM GiaVeConfig where ID=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		GiaVeConfig n = (GiaVeConfig) query.list().get(0);

		return n;
	}
	
	@RequestMapping(value = "ticket-config/add.htm", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("ticketConfig") GiaVeConfig ticketConfig, BindingResult result,
			BindingResult errors, @RequestParam("maPhim") Integer maPhim,
			@RequestParam("ngayApDung") String ngayApDung, @RequestParam("maLV") String maLV,
			BindingResult erors, RedirectAttributes redirectAttributes) throws ParseException {
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		Date ngayApDungDate = formatter.parse(ngayApDung);
		
		try {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				int temp = 1;
				List<GiaVeConfig> list = getDsGiaVe();
				for (GiaVeConfig lv : list) {
					if (lv.getMaLV().equals(maLV) && lv.getMaPhim().equals(maPhim)
							&& lv.getNgayApDung().equals(ngayApDungDate)) {
						temp = 0;
					}
				}

				if (temp == 1) {
					if(ngayApDungDate.before(new Date())) {
						redirectAttributes.addFlashAttribute("message", new Message("error", "Ngày Áp Dụng Giá Vé không hợp lệ"));
						return "redirect:/admin/ticket-config.htm";
					}
					
					ticketConfig.setNgayApDung(ngayApDungDate);
					session.save(ticketConfig);
					redirectAttributes.addFlashAttribute("message", new Message("success", "Thêm thành công"));
					System.out.println("luu thanh cong");
				} else {
					System.out.println("bi trung cấu hình giá vé");
					redirectAttributes.addFlashAttribute("message", new Message("error", "Thêm Thất Bại-Thông tin giá vé đã được cấu hình"));
				}
				
				t.commit();
				return "redirect:/admin/ticket-config.htm";
			} catch (Exception e) {
				t.rollback();
				System.out.println("error catch " + e.getCause());
			}finally {
				session.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		List<GiaVeConfig> lv = getDsGiaVe();
		model.addAttribute("lv", lv);
		
		redirectAttributes.addFlashAttribute("message",
				new Message("error","Thêm thất bại"));
		
		return "redirect:/admin/ticket-config.htm";
	}
	
	@RequestMapping(value = "ticket-config/update/{id}.htm", method = RequestMethod.POST)
	public String update(ModelMap model, @ModelAttribute("ticketConfig") GiaVeConfig ticketConfig, BindingResult result,
			BindingResult errors, @RequestParam("maPhim") Integer maPhim,
			@RequestParam("ngayApDung") String ngayApDung, @RequestParam("maLV") String maLV,
			BindingResult erors, RedirectAttributes redirectAttributes) throws ParseException {
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		Date ngayApDungDate = formatter.parse(ngayApDung);
		
		try {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				int temp = 1;
				List<GiaVeConfig> list = getDsGiaVe();
				for (GiaVeConfig lv : list) {
					if (lv.getMaLV().equals(maLV) && lv.getMaPhim().equals(maPhim)
							&& lv.getNgayApDung().equals(ngayApDungDate)) {
						temp = 0;
					}
				}

				if (temp == 1) {
					Integer tem = getLichChieusByIdPhim(maPhim);
					if(tem == 1) {
						redirectAttributes.addFlashAttribute("message",
								new Message("error","Thông tin giá vé đã được cập nhật cho lịch chiếu của Mã phim, không thể cập nhật!"));
						return "redirect:/admin/movie.htm";
					}
					if(ngayApDungDate.before(new Date())) {
						redirectAttributes.addFlashAttribute("message", new Message("error", "Ngày Áp Dụng Giá Vé không hợp lệ"));
						return "redirect:/admin/ticket-config.htm";
					}
					ticketConfig.setMaLV(maLV);
					ticketConfig.setNgayApDung(ngayApDungDate);
					session.merge(ticketConfig);
					redirectAttributes.addFlashAttribute("message", new Message("success", "Cập nhật thành công"));
					System.out.println("luu thanh cong");
				} else {
					System.out.println("bi trung cấu hình giá vé");
					redirectAttributes.addFlashAttribute("message", new Message("error", "Cập nhật Thất Bại-Thông tin giá vé đã được cấu hình"));
				}
				
				t.commit();
				return "redirect:/admin/ticket-config.htm";
			} catch (Exception e) {
				t.rollback();
				System.out.println("error catch " + e.getCause());
			}finally {
				session.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		List<GiaVeConfig> lv = getDsGiaVe();
		model.addAttribute("lv", lv);
		
		redirectAttributes.addFlashAttribute("message",
				new Message("error","Thêm thất bại"));
		
		return "redirect:/admin/ticket-config.htm";
	}
	
	@RequestMapping(value = "ticket-config/delete/{id}.htm", method = RequestMethod.POST)
	public String delete(ModelMap model, @PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		try {
			GiaVeConfig lv = getSingleGiaVeConfig(id);
			Integer tem = getLichChieusByIdPhim(lv.getMaPhim());
			if(tem == 1) {
				redirectAttributes.addFlashAttribute("message",
						new Message("error","Thông tin giá vé đã được cập nhật cho lịch chiếu của Mã phim, không thể xóa!"));
				return "redirect:/admin/ticket-config.htm";
			}else {
				Integer temp =this.deleteNews(id);
				if(temp==1) {
					redirectAttributes.addFlashAttribute("message",
							new Message("success","Xóa thành công"));
					System.out.println("Xóa thành công!");
				}		
				else {
					redirectAttributes.addFlashAttribute("message",
							new Message("error","Thông tin giá vé đã được cập nhật cho lịch chiếu của Mã phim, không thể xóa!"));
					System.out.println("Xóa thất bại!");
				}
			}

			return "redirect:/admin/ticket-config.htm";
		} catch (Exception e) {
			System.out.println(e);

		}

		List<GiaVeConfig> lv = getDsGiaVe();
		model.addAttribute("lv", lv);
		redirectAttributes.addFlashAttribute("message", new Message("error", "xóa thất bại"));
		return "redirect:/admin/ticket-config.htm";
	}
	
	public Integer deleteNews(Integer id) {
		//kiểm tra trạng thái của giao dịch hiện tại trước khi bắt đầu một giao dịch mới.
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		String hql = "FROM GiaVeConfig where ID=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		GiaVeConfig km = (GiaVeConfig) query.uniqueResult();
		try {
			session.delete(km);
			t.commit();
			System.out.println("sau commit");
			return 1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println(e);
			t.rollback();
			return 0;
		} finally {
			session.close();
		}

	}
}
