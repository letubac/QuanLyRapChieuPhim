package admin.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import admin.controller.Message;
import ptithcm.entity.LichChieu;
import ptithcm.entity.LoaiVe;
import ptithcm.entity.Phim;
import ptithcm.entity.PhongChieu;
import ptithcm.entity.Ve;

@Transactional
@Controller
@RequestMapping("/admin/")
public class ShowtimeController {
	@Autowired
	SessionFactory factory;

	public List<Phim> getPhims() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim";
		Query query = session.createQuery(hql);
		List<Phim> list = query.list();
		return list;
	}

	public List<Ve> getOrders() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Ve";
		Query query = session.createQuery(hql);
		List<Ve> list = query.list();
		return list;
	}

	public List<LichChieu> getLichChieus() {
		Session session = factory.getCurrentSession();
		String hql = "FROM LichChieu";
		Query query = session.createQuery(hql);
		List<LichChieu> list = query.list();
		return list;
	}

	public LichChieu getSingleLichChieus(Integer maSC) {
		Session session = factory.getCurrentSession();
		String hql = "FROM LichChieu where maSC=:maSC";
		Query query = session.createQuery(hql);
		query.setParameter("maSC", maSC);
		LichChieu n = (LichChieu) query.list().get(0);

		return n;
	}

	public List<LichChieu> getLichChieusByIdPhim(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM LichChieu";
		Query query = session.createQuery(hql);
		List<LichChieu> list = query.list();
		List<LichChieu> temp_list = new ArrayList<LichChieu>();
		for (LichChieu l : list) {
			if (l.getDsPhim().getMaPhim() == id) {
				temp_list.add(l);
			}
		}
		return temp_list;
	}

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

	public Phim getSinglePhims(Integer maPhim) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim where maPhim=:maPhim";
		Query query = session.createQuery(hql);
		query.setParameter("maPhim", maPhim);
		Phim n = (Phim) query.list().get(0);

		return n;
	}

	public List<PhongChieu> getRoomsTrue() {
		Session session = factory.getCurrentSession();
		String hql = "FROM PhongChieu";
		Query query = session.createQuery(hql);
		List<PhongChieu> list = query.list();
		List<PhongChieu> listTrue = new ArrayList<PhongChieu>();
		for (PhongChieu p : list) {
			if (p.getTrangThai() == false) {
				listTrue.add(p);
			}
		}

		return listTrue;
	}

	@RequestMapping(value = "showtimes/add.htm", method = RequestMethod.POST)

	public String insert(ModelMap model, @ModelAttribute("showtimes") LichChieu showtimes, BindingResult result,
			BindingResult errors, @RequestParam("maPhong") String maPhong, @RequestParam("maPhim") String maPhim,
			@RequestParam("ngayChieu") String ngayChieu, @RequestParam("gioChieu") String gioChieuS,
			BindingResult erors, RedirectAttributes redirectAttributes) throws ParseException {
		int maPhimI = Integer.parseInt(maPhim);
		PhongChieu p = getSingleRooms(maPhong);
		Phim ph = getSinglePhims(maPhimI);
		int gioChieuI = Integer.parseInt(gioChieuS);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		Date ngayChieuDate = formatter.parse(ngayChieu);
		List<LichChieu> list = getLichChieus();

		try {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				int temp = 1;
//				int i=1;
				for (LichChieu lc : list) {
					if (lc.getDsPhong().getMaPhong().equals(maPhong) && lc.getGioChieu().equals(gioChieuI)
							&& lc.getNgayChieu().equals(ngayChieuDate)) {
						temp = 0;
//						System.out.println(i);
//						i++;
					}
//					System.out.println(i+"=>>>>>>");
//					System.out.println(lc.getDsPhong().getMaPhong());
//					System.out.println(lc.getGioChieu());
//					System.out.println(lc.getNgayChieu());
//					i++;
				}

				if (temp == 1) {
					showtimes.setGioChieu(gioChieuI);
					showtimes.setDsPhong(p);
					showtimes.setDsPhim(ph);
					if(ngayChieuDate.before(new Date())) {
						redirectAttributes.addFlashAttribute("message", new Message("error", "Ngày chiếu không hợp lệ"));
						return "redirect:/admin/showtimes.htm";
					}
					showtimes.setNgayChieu(ngayChieuDate);
					session.save(showtimes);
					redirectAttributes.addFlashAttribute("message", new Message("success", "Thêm thành công"));
					System.out.println("luu thanh cong");
				} else {
					System.out.println("bi trung lich chieu");
					redirectAttributes.addFlashAttribute("message", new Message("error", "Thêm Thất Bại-Trùng Lịch Chiếu"));
				}
				t.commit();

				return "redirect:/admin/showtimes.htm";

			} catch (Exception e) {
				t.rollback();
				System.out.println("error catch " + e.getCause());
			} finally {
				session.close();
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

//		List<LichChieu> list = getLichChieus();
		List<Phim> phimTrue = getPhims();// doi ten ham getPhimsTrue
		List<PhongChieu> phongChieuTrue = getRoomsTrue();

		model.addAttribute("lc", list);
		model.addAttribute("pct", phongChieuTrue);
		model.addAttribute("pt", phimTrue);
		redirectAttributes.addFlashAttribute("message", new Message("error", "Thêm thất bại"));
		return "redirect:/admin/showtimes.htm";
	}

	@RequestMapping(value = "showtimes/update/{id}.htm", method = RequestMethod.POST)
	public String updateMovie(ModelMap model, @RequestParam("ngayChieu") String ngayChieu,
			@RequestParam("maPhim") Integer maPhim, @RequestParam("maPhong") String maPhong,
			@RequestParam("maSC") Integer id, @RequestParam("gioChieu") Integer gioChieu,
			RedirectAttributes redirectAttributes) {

		try {
			List<LichChieu> list = getLichChieus();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
			Date ngayChieuDate = formatter.parse(ngayChieu);
//				int maPhimI = Integer.parseInt(maPhim);
			PhongChieu p = getSingleRooms(maPhong);
			Phim ph = getSinglePhims(maPhim);
			int gioChieuI = gioChieu;
//				int id = Integer.parseInt(maSC);
//				int gio =Integer.parseInt(gioChieu);
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			if(ngayChieuDate.before(new Date())) {
				redirectAttributes.addFlashAttribute("message", new Message("error", "Ngày chiếu không hợp lệ"));
				return "redirect:/admin/showtimes.htm";
			}
			for (LichChieu lc : list) {
				if (lc.getDsPhong().getMaPhong().equals(maPhong) && lc.getGioChieu().equals(gioChieuI)
						&& lc.getNgayChieu().equals(ngayChieuDate)) {
					System.out.println("bi trung lich chieu");
					redirectAttributes.addFlashAttribute("message", new Message("error", "Cập Nhật Thất Bại-Trùng Lịch Chiếu Có Mã Suất Chiếu: " + lc.getMaSC()));
					return "redirect:/admin/showtimes.htm";
				}
			}
			if (getSingleLichChieus(id).getDsPhim().getMaTT() != 2) {
				try {
					LichChieu showtime = getSingleLichChieus(id);
					if (checkLichChieu(id) == 1) {
						showtime.setGioChieu(gioChieu);
						showtime.setDsPhim(ph);
						showtime.setDsPhong(p);
						showtime.setNgayChieu(ngayChieuDate);
						session.merge(showtime);
						redirectAttributes.addFlashAttribute("message", new Message("success", "sửa thành công"));
						t.commit();

						return "redirect:/admin/showtimes.htm";
					}

				} catch (Exception e) {
					t.rollback();
					System.out.println("error catch " + e.getCause());
				} finally {
					session.close();
				}
			}
			else {
				redirectAttributes.addFlashAttribute("message", new Message("error", "sửa that bai phim da ngung chieu"));
				t.commit();

				return "redirect:/admin/showtimes.htm";
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
//		}

		List<LichChieu> list = getLichChieus();
		model.addAttribute("LichChieu", list);

		redirectAttributes.addFlashAttribute("message", new Message("error", "sửa thất bại"));
		return "redirect:/admin/showtimes.htm";
	}

	@RequestMapping(value = "showtimes/delete/{id}.htm", method = RequestMethod.POST)
	public String delete_User(ModelMap model, @PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		try {
//				Integer idI = Integer.parseInt(id);
//				LichChieu t = this.getSingleLichChieus(id);
//				System.out.println(t);
			LichChieu lc = getSingleLichChieus(id);
			Integer temp = this.deleteNews(id);
			if (temp == 1) {
//					model.addAttribute("message","Xóa thành công!");
//					redirectAttributes.addFlashAttribute("message",
//							new Message("success","Xoá thành công"));
				redirectAttributes.addFlashAttribute("message", new Message("success", "xóa thành công"));
				System.out.println("Xóa thành công!");
			} else if (temp == 0) {
//					model.addAttribute("message","Xóa thất bại!");
//					model.addAttribute("message",
//							new Message("error","Xóa thất bại!"));
				redirectAttributes.addFlashAttribute("message", new Message("error", "xóa thất bại"));
				System.out.println("Xóa thất bại!");
			}

			return "redirect:/admin/showtimes.htm";
		} catch (Exception e) {
			System.out.println(e);

		}

		List<LichChieu> list = getLichChieus();
		model.addAttribute("lc", list);
		redirectAttributes.addFlashAttribute("message", new Message("error", "xóa thất bại"));
		return "redirect:/admin/showtimes.htm";
	}

	public Integer deleteNews(Integer id) {
		LichChieu lc = new LichChieu();
		lc.setMaSC(id);
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			List<Ve> lVe = getOrders();

			for (Ve v : lVe) {
				System.out.println("dong 246:   " + v.getDsLichChieu().getMaSC());
				if (lc.getMaSC() == v.getDsLichChieu().getMaSC()) {
//					session.delete(lc);
					System.out.println("success");
					return 0;
				}

			}
			session.delete(lc);
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

	public Integer checkLichChieu(Integer id) {
		LichChieu lc = new LichChieu();
		lc.setMaSC(id);
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			List<Ve> lVe = getOrders();

			for (Ve v : lVe) {
				System.out.println("dong 246:   " + v.getDsLichChieu().getMaSC());
				if (lc.getMaSC() == v.getDsLichChieu().getMaSC()) {
//				session.delete(lc);
					System.out.println("success");
					return 0;
				}

			}

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
