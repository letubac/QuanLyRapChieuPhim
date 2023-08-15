package ptithcm.entity;


import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
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

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
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
	
	@Column(name="GiaVe")
	private Integer giaVe; // Giá vé - money
	
	@OneToMany(mappedBy="dsPhim")
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<LichChieu> lichChieuList;

	@Column(name="MaKM")
	private String maKM;

	@OneToMany(mappedBy="phim")
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<TheLoai> theLoaiS ;
	
	public Phim() {
		// TODO Auto-generated constructor stub
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
}
