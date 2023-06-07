package page.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.controller.LoginController;
import ptithcm.entity.LichChieu;
import ptithcm.entity.Phim;

@Transactional
@Controller
@RequestMapping("/film")
public class FilmController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("/coming_soon")
	public String comingSoon(ModelMap model,HttpServletRequest request,HttpSession ss) {
		Session session = factory.getCurrentSession(); 
		String hql = "SELECT distinct p FROM Phim p "
	             + "INNER JOIN p.lichChieuList lc "
	             + "WHERE p.maTT <> 2";
		//String hql = "FROM Phim WHERE maTT <> 2 ";
		Query query = session.createQuery(hql); 
		List<Phim> list = query.list();
		
		List<Phim> list_phu = new ArrayList<Phim>();
		for(Phim u : list) {
			if(u.getNgayKC().after(new Date())) {
				list_phu.add(u);
			}
		}
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
		}
		else {
			model.addAttribute("login", true);
			model.addAttribute("user", LoginController.kh);
			model.addAttribute("tk", LoginController.taikhoan);
			model.addAttribute("lv", LoginController.kh.getVeList());
		}
		model.addAttribute("phim", list_phu);
		return "movie/coming_soon";
	}

	@RequestMapping("/showing")
	public String showing(ModelMap model,HttpServletRequest request,HttpSession ss) {
		Session session = factory.getCurrentSession(); 
		String hql = "FROM Phim";
		Query query = session.createQuery(hql); 
		List<Phim> list = query.list();
		
		List<Phim> list_phu = new ArrayList<Phim>();
		for(Phim u : list) {
			if(u.getMaTT() == 1) {
				if(u.getNgayKC().before(new Date()) || u.getNgayKC().compareTo(new Date()) == 0 ) {
					list_phu.add(u);
				}
			}
		}
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
		}
		else {
			model.addAttribute("login", true);
			model.addAttribute("user", LoginController.kh);
			model.addAttribute("tk", LoginController.taikhoan);
			model.addAttribute("lv", LoginController.kh.getVeList());
		}
		model.addAttribute("day", LocalDate.now());
		model.addAttribute("phim", list_phu);
		return "movie/showing";
	}
	
	public Phim layPhim(Integer maPhim)
	{
		//makh.trim();
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim where MaPhim = :maPhim";
		Query query = session.createQuery(hql);
		query.setParameter("maPhim", maPhim);
		Phim p =(Phim)query.list().get(0);
		return p;
	}
	
	public List<LichChieu> layLichChieu(Integer maPhim) {
		Session session = factory.getCurrentSession();
		String hql = "FROM LichChieu where MaPhim = :maPhim";
		Query query = session.createQuery(hql);
		query.setParameter("maPhim", maPhim);
		List<LichChieu> list = query.list();
		
		return list;
	}
	

	@RequestMapping("/detail/ma={id}.htm")
	public String detail(ModelMap model, @PathVariable("id") Integer id) {
		Phim p = layPhim(id);
		model.addAttribute("phim", p);
		//System.out.println(LocalTime.now());
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
			model.addAttribute("day", LocalDate.now());
		}
		else {
			model.addAttribute("login", true);
			model.addAttribute("user", LoginController.kh);
			model.addAttribute("tk", LoginController.taikhoan);
			model.addAttribute("lv", LoginController.kh.getVeList());
			model.addAttribute("day", LocalDate.now());
		}
		return "movie/detail";
	}
	
	@RequestMapping("detail/ma={id}/{ngay}.htm")
	public String showtimes(ModelMap model,@PathVariable("id") Integer id, @PathVariable("ngay") String ngay) {
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(ngay.trim());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Phim p = layPhim(id);
		List<LichChieu> list = layLichChieu(id);
		List<LichChieu> list_phu = new ArrayList<LichChieu>();
		for(LichChieu u : list) {
			if(u.getNgayChieu().compareTo(date) == 0 )
				if(u.getNgayChieu().after(new Date())){
					list_phu.add(u);
				}
				else {
					if(u.getGioChieu() > (LocalTime.now().getHour())) {
						list_phu.add(u);
					}
			}
		}
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
		}
		else {
			model.addAttribute("login", true);
			model.addAttribute("user", LoginController.kh);
			model.addAttribute("tk", LoginController.taikhoan);
			model.addAttribute("lv", LoginController.kh.getVeList());
		}
		model.addAttribute("phim", p);
		model.addAttribute("lc", list_phu);
		model.addAttribute("day", LocalDate.now());
		
		return "movie/detail";
	}
}

