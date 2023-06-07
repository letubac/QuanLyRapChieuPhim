package ptithcm.entity;


import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.format.annotation.DateTimeFormat;
@Entity
@Table(name="PHIM")
public class Phim {
	@Id
	@Column(name = "MaPhim")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer maPhim; // Mã phim - int - identity
	
	@Column(name="TenPhim")
	private String tenPhim; // Tên phim - nvarchar(100)
	
	@Column(name="MoTa")
	private String moTa; // Mô tả chi tiết phim - nvarchar(1000)
	
	@Column(name="NuocSX")
	private String nuocSX; // Nước sản xuất - nvarchar(10)
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="MM/dd/yyyy")
	@Column(name="NgayKhoiChieu")
	private Date ngayKC; // Ngày khởi chiếu - date
	
	@Column(name="NamSX")
	private Integer namSX; // Năm sản xuất - int
	
	@Column(name="DaoDien")
	private String daoDien; // Đao diễn - nvarchar(50)
	
	@Column(name="ThoiLuong")
	private Integer thoiLuong; // Thời lượng - int
	
	@Column(name="Link")
	private String link;
	
	@Column(name="LinkTrailer")
	private String linkTrailer;
	
	@Column(name="MaTT")
	private Integer maTT;
	
	@OneToMany(mappedBy="dsPhim")
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<LichChieu> lichChieuList;
	
	public String getLinkTrailer() {
		return linkTrailer;
	}

	public void setLinkTrailer(String linkTrailer) {
		this.linkTrailer = linkTrailer;
	}

	public Collection<LichChieu> getLichChieuList() {
		return lichChieuList;
	}

	public void setLichChieuList(Collection<LichChieu> lichChieuList) {
		this.lichChieuList = lichChieuList;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	@OneToMany(mappedBy="phim")
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<TheLoai> theLoaiS ;
	
	public Phim() {
		// TODO Auto-generated constructor stub
	}
	
	public Collection<TheLoai> getTheLoaiS() {
		return theLoaiS;
	}

	public void setTheLoaiS(Collection<TheLoai> theLoaiS) {
		theLoaiS = theLoaiS;
	}

	public Phim(Integer maPhim, String tenPhim, String moTa, String nuocSX, Date ngayKC, Integer namSX, String daoDien,
			Integer thoiLuong, Collection<TheLoai> theLoaiS) {
		super();
		this.maPhim = maPhim;
		this.tenPhim = tenPhim;
		this.moTa = moTa;
		this.nuocSX = nuocSX;
		this.ngayKC = ngayKC;
		this.namSX = namSX;
		this.daoDien = daoDien;
		this.thoiLuong = thoiLuong;
		this.theLoaiS = theLoaiS;
	}

	public Integer getMaPhim() {
		return maPhim;
	}

	public void setMaPhim(Integer maPhim) {
		this.maPhim = maPhim;
	}

	public String getTenPhim() {
		return tenPhim;
	}

	public void setTenPhim(String tenPhim) {
		this.tenPhim = tenPhim;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public String getNuocSX() {
		return nuocSX;
	}

	public void setNuocSX(String nuocSX) {
		this.nuocSX = nuocSX;
	}

	public Date getNgayKC() {
		return ngayKC;
	}

	public void setNgayKC(Date ngayKC) {
		this.ngayKC = ngayKC;
	}

	public Integer getNamSX() {
		return namSX;
	}

	public void setNamSX(Integer namSX) {
		this.namSX = namSX;
	}

	public String getDaoDien() {
		return daoDien;
	}

	public void setDaoDien(String daoDien) {
		this.daoDien = daoDien;
	}

	public Integer getThoiLuong() {
		return thoiLuong;
	}

	public void setThoiLuong(Integer thoiLuong) {
		this.thoiLuong = thoiLuong;
	}

	public Integer getMaTT() {
		return maTT;
	}

	public void setMaTT(Integer maTT) {
		this.maTT = maTT;
	}
}
