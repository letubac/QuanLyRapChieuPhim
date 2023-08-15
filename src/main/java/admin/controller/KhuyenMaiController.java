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

import ptithcm.entity.ChiTietTheLoai;
import ptithcm.entity.KhuyenMai;
import ptithcm.entity.Phim;
import ptithcm.entity.TheLoai;

@Transactional
@Controller
@RequestMapping("admin")
public class KhuyenMaiController {
	
	@Autowired
	SessionFactory factory;
	
	public List<KhuyenMai> getPromotion(){
		Session session = factory.getCurrentSession();
		String hql = "FROM KhuyenMai";
		Query query = session.createQuery(hql);
		List<KhuyenMai> list = query.list();
		return list;
	}
	
	public Integer getPhimByMaKM(String maKM){
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim";
		Query query = session.createQuery(hql);
		List<Phim> list = query.list();
		
		for(Phim l : list) {
			if(l.getMaKM().equals(maKM)) {
				return 1;
			}
		}
		
		
		return 0;
	}
	
	public Integer deleteNews(String maKM) {
		//kiểm tra trạng thái của giao dịch hiện tại trước khi bắt đầu một giao dịch mới.
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		String hql = "FROM KhuyenMai where maKM=:maKM";
		Query query = session.createQuery(hql);
		query.setParameter("maKM", maKM);
		KhuyenMai km = (KhuyenMai) query.uniqueResult();
		try {
			if(getPhimByMaKM(maKM)==1) {
				return 0;
			}
			km.setMaTT(1);
			session.update(km);
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
	
	@RequestMapping(value = "promotion/add.htm", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("promotion") KhuyenMai promotion, BindingResult result,
			BindingResult errors, @RequestParam("tenKM") String tenKM,
			@RequestParam("ngayBatDau") String ngayBatDau, @RequestParam("ngayKetThuc") String ngayKetThuc,
			 @RequestParam("maTT") Integer maTT, @RequestParam("mucGiamGia") String mucGiamGia,
			 @RequestParam("moTa") String moTa,
			BindingResult erors, RedirectAttributes redirectAttributes) throws ParseException {
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		Date ngayBatDauDate = formatter.parse(ngayBatDau);
		Date ngayKetThucDate = formatter.parse(ngayKetThuc);
		
		if (mucGiamGia.matches(".*[a-zA-Z].*")) {
		    redirectAttributes.addFlashAttribute("message", new Message("error", "Mức giảm giá không được chứa ký tự!"));
		    return "redirect:/admin/promotion.htm";
		}
		
		if(ngayBatDauDate.before(new Date())) {
			redirectAttributes.addFlashAttribute("message", new Message("error", "Ngày bắt đầu khuyến mãi không hợp lệ"));
			return "redirect:/admin/promotion.htm";
		}
		
		if(ngayKetThucDate.before(new Date())) {
			redirectAttributes.addFlashAttribute("message", new Message("error", "Ngày kết thúc khuyến mãi không hợp lệ"));
			return "redirect:/admin/promotion.htm";
		}
		
		if(ngayKetThucDate.before(ngayBatDauDate)) {
			redirectAttributes.addFlashAttribute("message", new Message("error", "Ngày bắt đầu phải trước ngày kết thúc, không hợp lệ"));
			return "redirect:/admin/promotion.htm";
		}
		if(promotion.getMucGiamGia() == null) {
			redirectAttributes.addFlashAttribute("message",
					new Message("error","Mức giảm giá phải nhập số!"));
			return "redirect:/admin/promotion.htm";
		}
		try {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				promotion.setNgayBatDau(ngayBatDauDate);
				promotion.setNgayKetThuc(ngayKetThucDate);
				session.save(promotion);
				redirectAttributes.addFlashAttribute("message", new Message("success", "Thêm thành công"));
				System.out.println("luu thanh cong");
				t.commit();
				return "redirect:/admin/promotion.htm";
			} catch (Exception e) {
				t.rollback();
				System.out.println("error catch " + e.getCause());
			}finally {
				session.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		List<KhuyenMai> km = getPromotion();
		model.addAttribute("km", km);
		
		
		redirectAttributes.addFlashAttribute("message",
				new Message("error","Thêm thất bại"));
		
		return "redirect:/admin/promotion.htm";
	}
	
	@RequestMapping(value = "promotion/delete/{maKM}.htm", method = RequestMethod.POST)
	public String deletePromotion(ModelMap model, @PathVariable("maKM") String maKM, RedirectAttributes redirectAttributes) {
		try {
			Integer temp = this.deleteNews(maKM);
			if (temp == 1) {
				redirectAttributes.addFlashAttribute("message", new Message("success", "xóa thành công"));
				System.out.println("Xóa thành công!");
			} else if (temp == 0) {
				redirectAttributes.addFlashAttribute("message", new Message("error", "Xóa thất bại, Mã khuyến mãi đang được áp dụng cho phim khác!"));
				System.out.println("Xóa thất bại!");
			}

			return "redirect:/admin/promotion.htm";
		} catch (Exception e) {
			System.out.println(e);

		}
		redirectAttributes.addFlashAttribute("message", new Message("error", "xóa thất bại"));
		return "redirect:/admin/promotion.htm";
	}
	
	@RequestMapping(value = "promotion/update/{maKM}.htm",  method=RequestMethod.POST)
	public String updatePromotion(ModelMap model, @ModelAttribute("promotion") KhuyenMai promotion, BindingResult result, BindingResult errors,
			@RequestParam("tenKM") String tenKM,@RequestParam("ngayBatDau") String ngayBatDau, @RequestParam("ngayKetThuc") String ngayKetThuc,
			 @RequestParam("maTT") Integer maTT, @RequestParam("mucGiamGia") Integer mucGiamGia, 
			 @RequestParam("moTa") String moTa, RedirectAttributes redirectAttributes) throws ParseException {

		//		System.out.print(ticket.getMaLV());
		
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		Date ngayBatDauDate = formatter.parse(ngayBatDau);
		Date ngayKetThucDate = formatter.parse(ngayKetThuc);
		
		if(ngayBatDauDate.before(new Date())) {
			redirectAttributes.addFlashAttribute("message", new Message("error", "Ngày bắt đầu khuyến mãi không hợp lệ"));
			return "redirect:/admin/promotion.htm";
		}
		
		if(ngayKetThucDate.before(new Date())) {
			redirectAttributes.addFlashAttribute("message", new Message("error", "Ngày kết thúc khuyến mãi không hợp lệ"));
			return "redirect:/admin/promotion.htm";
		}
		
		if(ngayKetThucDate.before(ngayBatDauDate)) {
			redirectAttributes.addFlashAttribute("message", new Message("error", "Ngày bắt đầu phải trước ngày kết thúc, không hợp lệ"));
			return "redirect:/admin/promotion.htm";
		}
		if(promotion.getMucGiamGia() == null) {
			redirectAttributes.addFlashAttribute("message",
					new Message("error","Mức giảm giá phải nhập số!"));
			return "redirect:/admin/promotion.htm";
		}
		
		try {
			promotion.setNgayBatDau(ngayBatDauDate);
			promotion.setNgayKetThuc(ngayKetThucDate);
			session.merge(promotion);
			redirectAttributes.addFlashAttribute("message",
					new Message("success","sửa thành công"));
			t.commit();
			
			return "redirect:/admin/promotion.htm";
		}
		catch(Exception e) {
			System.out.println("error catch " +e.getCause());
			t.rollback();
		}
		finally {
			session.close();
		}

		redirectAttributes.addFlashAttribute("message",
				new Message("error","sửa thất bại"));
		

		return "redirect:/admin/promotion.htm";
		}
	
}
