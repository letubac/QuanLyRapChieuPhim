package ptithcm.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="THE_LOAI_PHIM")
@IdClass(TheLoaiPK.class)
public class TheLoai implements Serializable{

	/*@Column(name="MaTL")
	private String maTL; // Mã thể loại - varchar(10)
	
	@Column(name="MaPhim")
	private Integer maPhim; // Mã phim - varchar(10)*/
	@Id
	@ManyToOne
	@JoinColumn(name="maTL")
	private ChiTietTheLoai chiTietTL;
	
	@Id
	@ManyToOne
	@JoinColumn(name="maPhim")
	private Phim phim;
	
	public TheLoai() {
		// TODO Auto-generated constructor stub
	}

	public ChiTietTheLoai getChiTietTL() {
		return chiTietTL;
	}

	public void setChiTietTL(ChiTietTheLoai chiTietTL) {
		this.chiTietTL = chiTietTL;
	}

	public Phim getPhim() {
		return phim;
	}

	public void setPhim(Phim phim) {
		this.phim = phim;
	}

	public TheLoai(ChiTietTheLoai chiTietTL, Phim phim) {
		super();
		this.chiTietTL = chiTietTL;
		this.phim = phim;
	}	
	
	
}
