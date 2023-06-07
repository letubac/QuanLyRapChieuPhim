package ptithcm.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import admin.controller.Message;
import ptithcm.bean.Seat;
import ptithcm.controller.LoginController;
import ptithcm.entity.LichChieu;
import ptithcm.entity.LoaiVe;
import ptithcm.entity.NhanVien;
import ptithcm.entity.Phim;
import ptithcm.entity.PhongChieu;
import ptithcm.entity.TaiKhoan;
import ptithcm.entity.Ve;

@Transactional
@Controller
@RequestMapping("/staff/")
public class StaffController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("profile")
	public String profile(ModelMap model,HttpSession ss) {
		model.addAttribute("tk", LoginController.taikhoan);		
		model.addAttribute("user", LoginController.nv);
		model.addAttribute("mk", LoginController.matKhau);
		return "staff/profile";
	}
	
	@RequestMapping(value="/edit/employee/{maNV}/{email}.htm",method=RequestMethod.POST)
	public String edit(ModelMap model, 
			@RequestParam("tenNV") String tenNV,
			@RequestParam("soDT") String soDT,
			@RequestParam("diaChi") String diaChi,
			@PathVariable("maNV") Integer maNV, 
			@PathVariable("email") String email, RedirectAttributes redirectAttributes)throws NoSuchAlgorithmException {
		//NhanVien a = layNhanVien(id);
		boolean kt = true;
		boolean kt1 = true;
		if (!tenNV.trim().toString().matches("[^0-9]*")) {
			model.addAttribute("errors_tenNV","Tên Nhân Viên Không được bỏ trống!");
			kt1 = false;
		}
		if (soDT.length() != 10 || soDT.matches(".*[a-zA-Z].*")) {
			model.addAttribute("errors_soDT","Số điện thoại không được trống!");
			kt = false;
		}
		if(kt1==false) {
			model.addAttribute("user",LoginController.nv);
			model.addAttribute("tk", LoginController.taikhoan);
			model.addAttribute("mk", LoginController.matKhau);
			redirectAttributes.addFlashAttribute("message",
					new Message("error","Không nhập số trong tên"));
			return "redirect:/staff/profile.htm";
		}
		
		if(kt==false) {
			model.addAttribute("user",LoginController.nv);
			model.addAttribute("tk", LoginController.taikhoan);
			model.addAttribute("mk", LoginController.matKhau);
			redirectAttributes.addFlashAttribute("message",
					new Message("error","Số điện thoại không đúng định dạng! Vui lòng nhập lại"));
			return "redirect:/staff/profile.htm";
		}
		
		
		
		
		Session session_1 = factory.getCurrentSession();
		String hql_1 = "UPDATE NhanVien set TenNV = :tenNV, SDT = :soDT, DiaChi = :diaChi WHERE MaNV = :maNV";
		Query query_1 = session_1.createQuery(hql_1);
		query_1.setParameter("tenNV", tenNV.trim().toString());
		query_1.setParameter("soDT", soDT.trim().toString());
		query_1.setParameter("diaChi", diaChi);
		query_1.setParameter("maNV", maNV);
		int affectedRows_1 = query_1.executeUpdate();
		LoginController.nv.setTenNV(tenNV.trim().toString());
		LoginController.nv.setSoDT(soDT.trim().toString());
		LoginController.nv.setDiaChi(diaChi.trim().toString());
		
		//Ä á»• dá»¯ liá»‡u ra láº¡i file staff/profile.jsp
		model.addAttribute("user", LoginController.nv);
		model.addAttribute("tk", LoginController.taikhoan);
		//model.addAttribute("mk", LoginController.matKhau);
		/* model.addAttribute("message", "Cáº­p nháº­t tÃ i khoáº£n thÃ nh cÃ´ng!"); */
		redirectAttributes.addFlashAttribute("message",
				new Message("success","Cập Nhập Thành Công!"));
		return "redirect:/staff/profile.htm";
		
		
	}
	
	@RequestMapping("password")
	public String change(ModelMap model) {
		model.addAttribute("user", LoginController.nv);
		model.addAttribute("tk", LoginController.taikhoan);
		return "staff/password";
	}
	
	public void doDL(ModelMap model) {
		model.addAttribute("user", LoginController.nv);
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
			doDL(model);
			redirectAttributes.addFlashAttribute("message",
					new Message("error","Mật khẩu không được quá 8 kí tự!"));
			return "redirect:/staff/password.htm";
		}
		 if(newPass.equals(oldPass))
			{
				doDL(model);
				redirectAttributes.addFlashAttribute("message",
						new Message("error","Mật khẩu mới không trùng với mật khẩu cũ!"));
				//model.addAttribute("login", true);
				return "redirect:/staff/password.htm";
			}
			
		if (oldPass.equals(LoginController.matKhau)) {
			if (newPass.equals(cfnewPass)) {
				MessageDigest md1 = MessageDigest.getInstance("MD5");
				md1.update(newPass.trim().getBytes());
				byte[] digest1 = md1.digest();
				String myHash1 = DatatypeConverter.printHexBinary(digest1).toLowerCase();
				a.setPassword(myHash1);
			
			}
			else {
				
				doDL(model);
				redirectAttributes.addFlashAttribute("message",
						new Message("error","mật khẩu xác nhận không giống nhau!"));
				//model.addAttribute("login", true);
				return "redirect:/staff/password.htm";
			}
			if(newPass.equals("01234567") == true ) {
				//model.addAttribute("message", "khách hàng không được sử dụng mật khẩu này!");
				doDL(model);
				redirectAttributes.addFlashAttribute("message",
						new Message("error","Không được sử dụng mật khẩu này!"));
				//model.addAttribute("login", true);
				return "redirect:/staff/password.htm";
			}
		} else {
			model.addAttribute("message", "Sai Mật Khẩu Cũ!");
			doDL(model);
			//model.addAttribute("login", true);
			redirectAttributes.addFlashAttribute("message",
					new Message("error","Sai mật khẩu cũ"));
			return "redirect:/staff/password.htm";
		}
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			LoginController.matKhau = newPass;
			session.update(a);
			t.commit();
			redirectAttributes.addFlashAttribute("message",
					new Message("success","Cập Nhập Mật Khẩu Thành Công"));
			return "redirect:/staff/password.htm";		
		} catch (Exception e) {
			t.rollback();
			
			
		} finally {
			session.close();
		}
		doDL(model);
		//model.addAttribute("login", true);
		redirectAttributes.addFlashAttribute("message",
				new Message("error","Cập Nhập Mật Khẩu Thất Bại"));
		return "redirect:/staff/password.htm";
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
	
	//Kiá»ƒm tra gháº¿ cÃ³ trá»‘ng khÃ´ng!
	public boolean ktGhe(Integer maSC, Integer soGhe) {
		List<Ve> list= new ArrayList<Ve>();
		list = layVe(maSC);
		for(Ve u : list) {
			if(u.getSoGhe() == soGhe) {
				return true;
			}
		}
		return false;
	}
		
	public List<Seat> listSeat(Integer maSC){
		List<Seat> list = new ArrayList<Seat>();
		for(int i=1; i <= layTongGhe(maSC); i++) {
			Seat s = new Seat();
			s.setNum(i);
			if(ktGhe(maSC,i) != false) {
				s.setStt("Da dat");			
			}
			else {
				s.setStt("Trong");
			}
			list.add(s);
		}
		return list;
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping("order")
	public String order(ModelMap model,HttpServletRequest request,HttpSession ss) throws ParseException {
		Session session = factory.getCurrentSession(); 
		String hql = "FROM LichChieu";
		Query query = session.createQuery(hql); 
		List<LichChieu> list = query.list();
		List<LichChieu> list_phu = new ArrayList<LichChieu>();
		LoaiVe v;

		long millis=System.currentTimeMillis();
		java.sql.Date date=new java.sql.Date(millis); 
		String[] parts = date.toString().split("-");
		DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
		String day = parts[1] + "/" + parts[2] + "/" + parts[0];
		System.out.println(df.parse(day));		
				
		if((new Date()).getDay() > 0 && (new Date()).getDay() < 5) {
			v = layLV("LV01");
		}
		else {
			v = layLV("LV02");
		}
		
		for(LichChieu u : list) {
			if(u.getNgayChieu().equals(df.parse(day))) {
				if(u.getGioChieu() > (LocalTime.now().getHour()) || 
				  ((u.getGioChieu() == LocalTime.now().getHour()) && LocalTime.now().getMinute() < 30 )) {
					list_phu.add(u);
				}	
			}
		}
		if(LoginController.matKhau.equals("01234567") == true) {
			model.addAttribute("message","Chào mừng bạn đến trang dành cho nhân viên!");		
		}
		model.addAttribute("lc", list_phu);
		model.addAttribute("lv", v);
		model.addAttribute("user", LoginController.nv);

		return "staff/order";
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping("/order/{maSC}.htm")
	public String payment(ModelMap model,
			@PathVariable("maSC") Integer maSC) {
		/*doDL(model);
		Phim p = layPhim(maPhim);*/
		LichChieu lc = layLC(maSC);
		LoaiVe lv;
		List<Seat> sl= listSeat(maSC);
		/*if(LoginController.taikhoan.getEmail() == null) {
			return "login";
		}*/
		if(lc.getNgayChieu().getDay() > 0 && lc.getNgayChieu().getDay() < 6) {
			lv = layLV("LV01");
		}
		else {
			lv = layLV("LV02");
		}
		model.addAttribute("user", LoginController.nv);
		model.addAttribute("tk", LoginController.taikhoan);
		model.addAttribute("sl", sl);
		model.addAttribute("lc", lc);
		model.addAttribute("lv", lv);
		return "staff/seat";
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping("/confirm/{maSC}/{soGhe}.htm")
	public String payment1(ModelMap model,@PathVariable("maSC") Integer maSC, @PathVariable("soGhe") Integer soGhe) {
		LoaiVe lv;
		LichChieu lc = layLC(maSC);
		if(lc.getNgayChieu().getDay() > 0 && lc.getNgayChieu().getDay() < 5) {
			lv = layLV("LV01");
		}
		else {
			lv = layLV("LV02");
		}
		model.addAttribute("user", LoginController.nv);
		model.addAttribute("lc", lc);
		model.addAttribute("soGhe", soGhe);
		model.addAttribute("lv", lv);
		return "staff/confirm";
	}
	
	@RequestMapping("/complete/{maSC}/{soGhe}.htm")
	public String payment2(ModelMap model,@PathVariable("maSC") Integer maSC, @PathVariable("soGhe") Integer soGhe) {
		Ve v = new Ve();
		LichChieu lc = layLC(maSC);
		LoaiVe lv;
		
		if(lc.getNgayChieu().getDay() > 0 && lc.getNgayChieu().getDay() < 5) {
			lv = layLV("LV01");
		}
		else {
			lv = layLV("LV02");
		} 
		
		v.setDsLichChieu(layLC(maSC));
		v.setNhanVien(LoginController.nv);
		v.setLoaiVe(lv);
		v.setNgayBan(new Date());
		v.setSoGhe(soGhe);
		
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try
		{
			session.save(v);
			t.commit();
			model.addAttribute("lc", lc);
			model.addAttribute("lv",lv);
			model.addAttribute("v", v);
			return "redirect: /QuanLyRapChieuPhim/staff/order/{maSC}.htm";
		}
		catch(Exception e)
		{
			t.rollback();
			model.addAttribute("user", LoginController.kh);
			model.addAttribute("tk", LoginController.taikhoan);
			model.addAttribute("message",e.getMessage());
			return "redirect: /QuanLyRapChieuPhim/customer/payment_1/{maSC}/{soGhe}.htm";
		}
		finally {
			session.close();
		}
	}
	
	public NhanVien layNhanVien(Integer maNV)
	{
		//makh.trim();
		Session session = factory.getCurrentSession();
		String hql = "FROM NhanVien where MaNV = :maNV";
		Query query = session.createQuery(hql);
		query.setParameter("maNV", maNV);
		NhanVien p =(NhanVien)query.list().get(0);
		return p;
	}
	
	@RequestMapping("room")
	public String room(ModelMap model,HttpServletRequest request,HttpSession ss) {
		Session session = factory.getCurrentSession(); 
		String hql = "FROM PhongChieu";
		Query query = session.createQuery(hql); 
		List<PhongChieu> list = query.list();
		
		model.addAttribute("pc", list);
		return "staff/room";
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

			return "redirect:/staff/room.htm";
		}
		catch(Exception e) {
			System.out.println(e);
			t.rollback();
		}
		finally {
			session.close();
		}
		
		return "staff/room";
	}
	
}