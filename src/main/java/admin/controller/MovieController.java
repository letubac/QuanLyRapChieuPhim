package admin.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import admin.controller.Message;
import javassist.expr.NewArray;
import ptithcm.entity.ChiTietTheLoai;
import ptithcm.entity.LichChieu;
import ptithcm.entity.Phim;
import ptithcm.entity.TheLoai;
import ptithcm.entity.Ve;

@Transactional
@Controller
@RequestMapping("/admin/")
public class MovieController {
	@Autowired
	SessionFactory factory;
	
	public List<Phim> getPhims(){
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim";
		Query query = session.createQuery(hql);
		List<Phim> list = query.list();
		return list;
	}
	
	public Phim getSinglePhims(Integer maPhim) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim where maPhim=:maPhim";
		Query query = session.createQuery(hql);
		query.setParameter("maPhim", maPhim);
		Phim n = (Phim) query.list().get(0);

		return n;
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
	public List<TheLoai> getTheLoaiByIdPhim(Integer id){
		Session session = factory.getCurrentSession();
		String hql = "FROM  TheLoai";
		Query query = session.createQuery(hql);
		List<TheLoai> list = query.list();
		List<TheLoai> newlist = new ArrayList<TheLoai>();
		
		for(TheLoai l : list) {
			if(l.getPhim().getMaPhim()==id) {
				newlist.add(l);
			}
		}
		
		
		return newlist;
	}
	public ChiTietTheLoai getCTTL(String maTL) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ChiTietTheLoai where maTL=:maTL";
		Query query = session.createQuery(hql);
		query.setParameter("maTL", maTL);
		ChiTietTheLoai n = (ChiTietTheLoai) query.list().get(0);

		return n;
	}
	
	public List<ChiTietTheLoai> getAllCTTL() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ChiTietTheLoai";
		Query query = session.createQuery(hql);
		return  query.list();
	}
	
	@RequestMapping(value = "movie/add.htm", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("movie") Phim movie, BindingResult result, BindingResult errors,
			@RequestParam("thoiLuong") String thoiLuongString,@RequestParam("ngayKC") String ngayKC,HttpServletRequest request, RedirectAttributes redirectAttributes) {

			
		String[] TL = request.getParameterValues("TL");

		if(Objects.isNull(TL)) {
			redirectAttributes.addFlashAttribute("message",
					new Message("error","Thể loại không được để trống khi thêm phim!"));
			return "redirect:/admin/movie.htm";
		}
		if(movie.getNamSX() == null) {
			redirectAttributes.addFlashAttribute("message",
					new Message("error","Năm sản xuất phải nhập số!"));
			return "redirect:/admin/movie.htm";
		}

		if(movie.getThoiLuong() == null) {
			redirectAttributes.addFlashAttribute("message",
					new Message("error","Thời lượng phải nhập số!"));
			return "redirect:/admin/movie.htm";
		}
//		if (anh.isEmpty()) {
//			System.out.println("rong");
//			errors.rejectValue("anh", "nhanhang", "Ảnh không được rỗng!");
//
//		} else {
			try {
//				String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyMMddHHmmss-"));
//				String tenAnh = date + anh.getOriginalFilename();
//				String duongDanAnh = basePathUploadFile.getBasePath() + File.separator + tenAnh;
//				System.out.println("anh: "+duongDanAnh);
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
				Date ngayKCDate = formatter.parse(ngayKC);
				int thoiLuongI = Integer.parseInt(thoiLuongString);
				TheLoai tl = new TheLoai();
				
				Session session = factory.openSession();
				Transaction t = session.beginTransaction();
				try {
					
					movie.setThoiLuong(thoiLuongI);
					movie.setNgayKC(ngayKCDate);
					session.save(movie);
					
					
					
					t.commit();
					Transaction ts = session.beginTransaction();
					try {
						for(int i = 0; i < TL.length; i ++) {
							ChiTietTheLoai cttl = getCTTL(TL[i]);
							TheLoai theLoai = new TheLoai(cttl, movie);
							session.save(theLoai);
						}
						redirectAttributes.addFlashAttribute("message",
								new Message("success","Thêm thành công"));
						ts.commit();
						return "redirect:/admin/movie.htm";
					}catch(Exception e) {
						ts.rollback();
						System.out.println("error catch 122 " +e.getCause());
					}
					
					return "admin/movie";
				} catch (Exception e) {
					t.rollback();
					System.out.println("error catch " +e.getCause());
				} finally {
					session.close();
				}

			} catch (Exception e) {
				// TODO: handle exception
			}
//		}

		List<Phim> list = getPhims();
		model.addAttribute("phim", list);
		
		
		redirectAttributes.addFlashAttribute("message",
				new Message("error","Thêm thất bại"));
		return "redirect:/admin/movie.htm";
		
	}
	
	public boolean deleteTLP(String maTL, Integer maPhim) {
		
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			String hql = "delete from TheLoai where maTL = '" + maTL + "' and maPhim = " + maPhim;
			Query query = session.createQuery(hql);
			System.out.println(hql);
			query.executeUpdate();
			t.commit();

		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
		}
		finally {
			session.close();
		}
		return true;
	}
	
	public TheLoai getTLP(String maTL, Integer maPhim) {
		
		Session session = factory.getCurrentSession();
		String hql = "from TheLoai where maTL = '" + maTL + "' and maPhim = " + maPhim;
		Query query = session.createQuery(hql);
		System.out.println(hql);
		if(query.list().size() > 0) {
			return (TheLoai) query.list().get(0);
		}
		return null;		
	}
	
	@RequestMapping(value = "movie/update/{id}.htm", method = RequestMethod.POST)
	public String updateMovie(ModelMap model, @ModelAttribute("movieUpdate") Phim movie, BindingResult result, BindingResult errors,@RequestParam("thoiLuong") String thoiLuongString,
			@RequestParam("ngayKC") String ngayKC,@RequestParam("maPhimN") Integer maPhimN,@RequestParam("maTT") Integer maTT,
			@RequestParam("tenPhim") String tenPhim,@RequestParam("moTa") String moTa,
			@RequestParam("link") String link,
			@RequestParam("nuocSX") String nuocSX,@RequestParam("namSX") Integer namSX,@RequestParam("daoDien") String daoDien,HttpServletRequest request,RedirectAttributes redirectAttributes ) {
			
			String[] TL = request.getParameterValues("TL");
			
			try {
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
				Date ngayKCDate = formatter.parse(ngayKC);

				if (thoiLuongString.matches(".*[a-zA-Z].*")) {
				    redirectAttributes.addFlashAttribute("message", new Message("error", "Thời lượng không được chứa ký tự!"));
				    return "redirect:/admin/movie.htm";
				}
				int thoiLuongI = Integer.parseInt(thoiLuongString);
//				int id = Integer.parseInt(maPhimN);
				Session session = factory.openSession();
				TheLoai tl = new TheLoai();

				Transaction t = session.beginTransaction();
				
				Integer temp = getLichChieusByIdPhim(maPhimN);
				if(temp == 1) {
					redirectAttributes.addFlashAttribute("message",
							new Message("error","Phim đang có trong lịch chiếu, không thể cập nhật!"));
					return "redirect:/admin/movie.htm";
				}
				if(Objects.isNull(TL)) {
					redirectAttributes.addFlashAttribute("message",
							new Message("error","Thể loại không được để trống khi update mã phim: " + maPhimN));
					return "redirect:/admin/movie.htm";
				}
				if(namSX == null) {
					redirectAttributes.addFlashAttribute("message",
							new Message("error","Năm sản xuất phải nhập số!"));
					return "redirect:/admin/movie.htm";
				}
				try {
					movie = getSinglePhims(maPhimN);
					movie.setThoiLuong(thoiLuongI);
					movie.setMaTT(maTT);
					movie.setNgayKC(ngayKCDate);
					movie.setMoTa(moTa);
					movie.setNamSX(namSX);
					movie.setTenPhim(tenPhim);
					movie.setNuocSX(nuocSX);
					movie.setDaoDien(daoDien);
					movie.setLink(link);

					session.merge(movie);
					redirectAttributes.addFlashAttribute("message",
							new Message("success","Chỉnh sửa thành công"));
					t.commit();
					Transaction ts = session.beginTransaction();
					try {
						
//						tl.setPhim(movie);
						List<TheLoai> listOld =  (List<TheLoai>) movie.getTheLoaiS();
						List<TheLoai> listDelete = new ArrayList<TheLoai>(listOld);
						List<TheLoai> listNew = new ArrayList<TheLoai>();
						for(int i = 0; i < TL.length; i ++) {
							ChiTietTheLoai cttl = getCTTL(TL[i]);
							System.out.println(cttl.getMaTL());
							TheLoai theloai = getTLP(cttl.getMaTL(), movie.getMaPhim());
							System.out.println(getTLP(cttl.getMaTL(), movie.getMaPhim()));
							if(theloai != null)
							listNew.add(theloai);
						}
						System.out.println(listNew.size());
					
						listDelete.removeAll(listNew);
					
								
						for (TheLoai theLoai : listDelete) {
							deleteTLP(theLoai.getChiTietTL().getMaTL(), movie.getMaPhim());
						}
						session.flush();
						
						for(int i = 0; i < TL.length; i ++) {
							ChiTietTheLoai cttl = getCTTL(TL[i]);
							System.out.println(TL[i]);
							TheLoai theLoai = new TheLoai(cttl, movie);
							session.merge(theLoai);
						}

						ts.commit();
						return "redirect:/admin/movie.htm";
					}catch(Exception e) {
						ts.rollback();
						System.out.println("error catch 122 " +e);
					}
					
					return "admin/movie";
					
				} catch (Exception e) {
					t.rollback();
					System.out.println("error catch " +e);
				} finally {
					session.close();
				}

			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("error catch " +e);
			}
//		}

		List<Phim> list = getPhims();
		model.addAttribute("phim", list);
		
		
		redirectAttributes.addFlashAttribute("message",
				new Message("error","Chỉnh sửa thất bại"));
		return "redirect:/admin/movie.htm";
	}

	
	@RequestMapping(value="movie/delete/{id}.htm",method = RequestMethod.POST)
	public String delete_User(ModelMap model,
			@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
			try {
//				Integer idI = Integer.parseInt(id);
//				LichChieu t = this.getSingleLichChieus(id);
//				System.out.println(t);
				Phim lc = getSinglePhims(id);
				Integer temp =this.deleteNews(id);
				if(temp==1) {
//					model.addAttribute("message","Xóa thành công!");
//					redirectAttributes.addFlashAttribute("message",
//							new Message("success","Xoá thành công"));
					redirectAttributes.addFlashAttribute("message",
							new Message("success","Xóa thành công"));
					System.out.println("Xóa thành công!");
				}		
				else if(temp==0) {
//					model.addAttribute("message","Xóa thất bại!");
//					model.addAttribute("message",
//							new Message("error","Xóa thất bại!"));
					redirectAttributes.addFlashAttribute("message",
							new Message("error","Phim đang có trong lịch chiếu, không thể xóa!"));
					System.out.println("Xóa thất bại!");
				}
				
				return "redirect:/admin/movie.htm";
			} catch(Exception e){
				System.out.println(e);
				
			}
			
			
			List<Phim> list = getPhims();
			model.addAttribute("phim",list);
			redirectAttributes.addFlashAttribute("message",
					new Message("error","Xóa thất bại"));
			return "redirect:/admin/movie.htm";
	}
	public Integer deleteNews(Integer  id) {
		Phim lc = new Phim();
		List<TheLoai> list = getTheLoaiByIdPhim(id);
		lc.setMaPhim(id);
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Integer temp = getLichChieusByIdPhim(id);
			if(temp == 1) {
				return 0;
			}
			for(TheLoai v : list) {
			session.delete(v);
			}
			session.delete(lc);	
			t.commit();
			System.out.println("sau commit");
			return 1; 
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			System.out.println(e);
			t.rollback();
			return 0;
		}
		finally {
			session.close();
		}
		
	}	
}


