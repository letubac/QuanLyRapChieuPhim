package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="THE_LOAI")
public class ChiTietTheLoai {
	@Id
	@Column(name="MaTL")
	private String maTL; // Mã thể loại - varchar(10)
	
	@Column(name="TenTL")
	private String tenTL; // Tên thể loại - nvarchar(50)
	
	@OneToMany(mappedBy="chiTietTL", fetch=FetchType.EAGER)
	private Collection<TheLoai> TheLoaiS ;
	
	public Collection<TheLoai> getTheLoaiS() {
		return TheLoaiS;
	}

	public void setTheLoaiS(Collection<TheLoai> theLoaiS) {
		TheLoaiS = theLoaiS;
	}

	public ChiTietTheLoai() {
		// TODO Auto-generated constructor stub
	}

	public ChiTietTheLoai(String maTL, String tenTL) {
		super();
		this.maTL = maTL;
		this.tenTL = tenTL;
	}

	public String getMaTL() {
		return maTL;
	}

	public void setMaTL(String maTL) {
		this.maTL = maTL;
	}

	public String getTenTL() {
		return tenTL;
	}

	public void setTenTL(String tenTL) {
		this.tenTL = tenTL;
	}
	
	
}
