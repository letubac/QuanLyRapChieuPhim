package ptithcm.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import javax.xml.bind.DatatypeConverter;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import admin.controller.Message;
import ptithcm.bean.Seat;
import ptithcm.entity.LichChieu;
import ptithcm.entity.LoaiVe;
import ptithcm.entity.Phim;
import ptithcm.entity.TaiKhoan;
import ptithcm.entity.Ve;

@Transactional
@Controller
@RequestMapping("/customer")
public class CustomerController {
	@Autowired
	SessionFactory factory; 
	
	public List<Ve> layLVKH(Integer maKH)
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Ve where maKH = :maKH";
		Query query = session.createQuery(hql);
		query.setParameter("maKH", maKH);
		List<Ve> list = query.list();
		return list;
	}  
	
	@RequestMapping("/account")
	public String account(ModelMap model, HttpServletRequest request, HttpSession ss) {
		model.addAttribute("user", LoginController.kh);
		model.addAttribute("tk", LoginController.taikhoan);
		//model.addAttribute("lv", LoginController.kh.getVeList());
		model.addAttribute("lv", layLVKH(LoginController.kh.getMaKH()));
		if(LoginController.matKhau.equals("01234567") == true) {
			model.addAttribute("message","Nhớ thay đổi mật khẩu mới!");		
		}
		model.addAttribute("login", true);
		return "customer/account";
	}

	@RequestMapping(value = "/update/{id}.htm", method = RequestMethod.POST)
	public String edit(ModelMap model, @RequestParam("tenKH") String tenKH, @RequestParam("gioiTinh") boolean gioiTinh,
			@RequestParam("soDT") String soDT, @RequestParam("ngaySinh") String ngaySinh,
			@RequestParam("diaChi") String diaChi, @PathVariable("id") Integer maKH,
			RedirectAttributes redirectAttributes) throws NoSuchAlgorithmException, ParseException {
		// NhanVien a = layNhanVien(id);
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		Date ngaySinhDate = formatter.parse(ngaySinh);
		
		boolean kt = true;
		if (tenKH.trim().toString().equals("")) {
			model.addAttribute("errors_tenNV", "Tên khách hàng không được để trống!");
			kt = false;
		}
		if (soDT.trim().toString().equals("")) {
			model.addAttribute("errors_soDT", "Số điện thoại không được để trống!");
			kt = false;
		}
		if (ngaySinhDate == null) {
			model.addAttribute("errors_ngaySinh", "Ngày sinh không được để trống!");
			kt = false;
		}
		if (diaChi.trim().toString().equals("")) {
			model.addAttribute("errors_diaChi", "Địa chỉ không được để trống!");
			kt = false;
		}
		if (kt == false) {
			model.addAttribute("user", LoginController.nv);
			model.addAttribute("tk", LoginController.taikhoan);
			model.addAttribute("mk", LoginController.matKhau);
			model.addAttribute("login", true);
			redirectAttributes.addFlashAttribute("message",
					new Message("error","Cập nhật thất bại!"));
			return "redirect:/customer/account.htm";
		}

		// Cập nhật thông tin cá nhân
		Session session_1 = factory.getCurrentSession();
		String hql_1 = "UPDATE KhachHang set TenKH = :tenKH, GioiTinh = :gioiTinh, SDT = :soDT, NgaySinh = :ngaySinhDate, DiaChi = :diaChi  WHERE MaKH = :maKH";
		Query query_1 = session_1.createQuery(hql_1);
		query_1.setParameter("tenKH", tenKH.trim().toString());
		query_1.setParameter("gioiTinh", gioiTinh);
		query_1.setParameter("ngaySinhDate", ngaySinhDate);
		query_1.setParameter("soDT", soDT.trim().toString());
		query_1.setParameter("diaChi", diaChi);
		query_1.setParameter("maKH", maKH);
		int affectedRows_1 = query_1.executeUpdate();
		LoginController.kh.setTenKH(tenKH.trim().toString());
		LoginController.kh.setGioiTinh(gioiTinh);
		LoginController.kh.setNgaySinh(ngaySinhDate);
		LoginController.kh.setSoDT(soDT.trim().toString());
		LoginController.kh.setDiaChi(diaChi.trim().toString());

		// Ä�á»• dá»¯ liá»‡u ra láº¡i file customer/account.jsp
		model.addAttribute("user", LoginController.kh);
		model.addAttribute("tk", LoginController.taikhoan);
		model.addAttribute("mk", LoginController.matKhau);
		model.addAttribute("lv", LoginController.kh.getVeList());
		model.addAttribute("login", true);
		//model.addAttribute("message", "Cập nhật thành công!");
		redirectAttributes.addFlashAttribute("message",
				new Message("success","Cập nhật thành công!"));
		return "redirect:/customer/account.htm";

	}

	public void doDL(ModelMap model) {
		model.addAttribute("user", LoginController.kh);
		model.addAttribute("tk", LoginController.taikhoan);
	}

	@RequestMapping(value = "/change/password", method = RequestMethod.POST)
	public String updatePass(ModelMap model, HttpSession ss, HttpServletRequest request,RedirectAttributes redirectAttributes)
			throws NoSuchAlgorithmException {
		String oldPass = request.getParameter("oldPass");
		String newPass = request.getParameter("newPass");
		String cfnewPass = request.getParameter("confirmPass");
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(oldPass.trim().getBytes());
		byte[] digest = md.digest();
		String myHash = DatatypeConverter.printHexBinary(digest).toLowerCase();
		TaiKhoan a = LoginController.taikhoan;
		if (newPass.toString().trim().length() > 8) {
			model.addAttribute("message", "Mật khẩu mới không được quá 8 ký tự!");
			doDL(model);
			redirectAttributes.addFlashAttribute("message",
					new Message("error","Mật khẩu mới không được quá 8 ký tự!"));
			return "redirect:/customer/account.htm";
		}
		if (oldPass.equals(LoginController.matKhau)) {
			if (newPass.equals(cfnewPass)) {
				MessageDigest md1 = MessageDigest.getInstance("MD5");
				md1.update(newPass.trim().getBytes());
				byte[] digest1 = md1.digest();
				String myHash1 = DatatypeConverter.printHexBinary(digest1).toLowerCase();
				a.setPassword(myHash1);
			} else {
				model.addAttribute("message", "Mật khẩu xác nhận không giống nhau!");
				doDL(model);
				model.addAttribute("login", true);
				redirectAttributes.addFlashAttribute("message",
						new Message("error","Mật khẩu xác nhận không giống nhau!"));
				return "redirect:/customer/account.htm";
			}
			if(newPass.equals("01234567") == true ) {
				model.addAttribute("message", "Không được sử dụng mật khẩu này!");
				doDL(model);
				model.addAttribute("login", true);
				redirectAttributes.addFlashAttribute("message",
						new Message("error","Sai mật khẩu cũ"));
				return "redirect:/customer/account.htm";
				
			}
		} else {
			model.addAttribute("message", "Sai mật khẩu cũ!");
			doDL(model);
			model.addAttribute("login", true);
			redirectAttributes.addFlashAttribute("message",
					new Message("error","Sai mật khẩu cũ!"));
			return "redirect:/customer/account.htm";
		}
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			LoginController.matKhau = newPass;
			session.update(a);
			t.commit();
			model.addAttribute("message", "Cập nhật thành công!");
			redirectAttributes.addFlashAttribute("message",
					new Message("success","Cập nhật thành công!"));
			return "redirect:/customer/account.htm";
			
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Cập nhật thất bại!");
		} finally {
			session.close();
		}
		doDL(model);
		model.addAttribute("login", true);
		redirectAttributes.addFlashAttribute("message",
				new Message("error","Cập nhật thất bại!"));
		return "redirect:/customer/account.htm";
	}

	public Phim layPhim(Integer id)
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim where MaPhim = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Phim p = (Phim)query.list().get(0);
		return p;
	}
	
	public LichChieu layLC(Integer id)
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM LichChieu where MaSuatChieu = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		LichChieu lc = (LichChieu)query.list().get(0);
		return lc;
	} 
	
	public LoaiVe layLV(String id)
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM LoaiVe where MaLV = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		LoaiVe lv = (LoaiVe)query.list().get(0);
		return lv;
	} 
	
	public List<Ve> layVe(Integer id)
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Ve where dsLichChieu.maSC = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		List<Ve> list = query.list();
		return list;
	} 

	public Integer layTongGhe(Integer maSC) {
		LichChieu lc = layLC(maSC);
		return lc.getDsPhong().getTongSoGhe();
	}
	
	public Integer ktGhe(Integer maSC, Integer soGhe) {
		List<Ve> list= new ArrayList<Ve>();
		list = layVe(maSC);
		for(Ve u : list) {
			if(u.getSoGhe() == soGhe) {
				return u.getKhachHang() != null? u.getKhachHang().getMaKH() : u.getNhanVien().getMaNV();
			}
		}
		return null;
	}
		
	public List<Seat> listSeat(Integer maSC, Integer maKH){
		List<Seat> list = new ArrayList<Seat>();
		for(int i=1; i <= layTongGhe(maSC); i++) {
			Seat s = new Seat();
			s.setNum(i);
			if(ktGhe(maSC,i) != null) {
				if(ktGhe(maSC,i) == maKH) {
					s.setStt("Cua ban");
				}
				else {
					s.setStt("Da dat");
				}
			}
			else {
				s.setStt("Trong");
			}
			list.add(s);
		}
		return list;
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping("/payment/{maPhim}/{maSC}.htm")
	public String payment(ModelMap model,@PathVariable("maPhim") Integer maPhim,
			@PathVariable("maSC") Integer maSC) {
		doDL(model);
		Phim p = layPhim(maPhim);
		LichChieu lc = layLC(maSC);
		LoaiVe lv;
		List<Seat> sl= listSeat(maSC,LoginController.kh.getMaKH());
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
			return "login";
		}
		if(lc.getNgayChieu().getDay() > 0 && lc.getNgayChieu().getDay() < 5) {
			lv = layLV("LV01");
		}
		else {
			lv = layLV("LV02");
		}
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
		}
		else {
			model.addAttribute("user", LoginController.kh);
			model.addAttribute("tk", LoginController.taikhoan);
			model.addAttribute("lv", LoginController.kh.getVeList());
			model.addAttribute("login", true);
		}
		model.addAttribute("phim", p);
		model.addAttribute("sl", sl);
		model.addAttribute("lc", lc);
		model.addAttribute("lv", lv);
		model.addAttribute("user", LoginController.kh);
		return "customer/payment";
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping("/payment_1/{maSC}/{selectedSeats}.htm")
	public String payment1(ModelMap model,@PathVariable("maSC") Integer maSC, @PathVariable("selectedSeats") List<Integer> selectedSeats) {
		LoaiVe lv;
		LichChieu lc = layLC(maSC);
		if(lc.getNgayChieu().getDay() > 0 && lc.getNgayChieu().getDay() < 5) {
			lv = layLV("LV01");
		}
		else {
			lv = layLV("LV02");
		}
		model.addAttribute("user", LoginController.kh);
		model.addAttribute("lc", lc);
		model.addAttribute("soGhe", selectedSeats);
		model.addAttribute("lv", lv);
		model.addAttribute("login", true);
		return "customer/payment_1";
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping("/payment_2/{maSC}/{soGhe}.htm")
	public String payment2(ModelMap model,@PathVariable("maSC") Integer maSC, @PathVariable("soGhe") String[] soGhe) {
		Ve v = new Ve();
		LichChieu lc = layLC(maSC);
		LoaiVe lv;

		if (lc.getNgayChieu().getDay() > 0 && lc.getNgayChieu().getDay() < 5) {
		    lv = layLV("LV01");
		} else {
		    lv = layLV("LV02");
		}
		
		List<Integer> soGheList = new ArrayList<>();
		for (String ghe : soGhe) {
		    String gheTrimmed = ghe.trim();
		    if (gheTrimmed.startsWith("[")) {
		        gheTrimmed = gheTrimmed.substring(1); // Loại bỏ ký tự "[" đầu chuỗi
		    }
		    if (gheTrimmed.endsWith("]")) {
		        gheTrimmed = gheTrimmed.substring(0, gheTrimmed.length() - 1); // Loại bỏ ký tự "]" cuối chuỗi
		    }
		    int gheInt = Integer.parseInt(gheTrimmed);
		    soGheList.add(gheInt);
		}
		
		for (int ghe : soGheList) {
		    Ve ve = new Ve();
		    ve.setDsLichChieu(layLC(maSC));
		    ve.setKhachHang(LoginController.kh);
		    ve.setLoaiVe(lv);
		    ve.setNgayBan(new Date());
		    ve.setSoGhe(ghe);

		    Session session = factory.openSession();
		    Transaction t = session.beginTransaction();
		    try {
		        session.save(ve);
		        t.commit();
		    } catch (Exception e) {
		        t.rollback();
		        model.addAttribute("user", LoginController.kh);
		        model.addAttribute("tk", LoginController.taikhoan);
		        model.addAttribute("message", e.getMessage());
		        return "redirect: QuanLyRapChieuPhim/customer/payment_1/{maSC}/{soGhe}.htm";
		    } finally {
		        session.close();
		    }
		}

		model.addAttribute("lc", lc);
		model.addAttribute("lv", lv);
		model.addAttribute("v", v);
		model.addAttribute("login", true);
		model.addAttribute("user", LoginController.kh);
		return "customer/payment_2";
	}
}
