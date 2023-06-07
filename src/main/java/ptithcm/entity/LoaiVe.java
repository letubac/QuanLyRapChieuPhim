package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name="LOAIVE")
public class LoaiVe {
	@Id
	@Column(name="MaLV")
	private String maLV; // Mã loại vé - varchar(10)
	
	@Column(name="TenLV")
	private String tenLV; // Tên loaị vé - nvarchar(50)
	
	@Column(name="Gia")
	private Integer gia; // Giá vé - money
	
	@OneToMany(mappedBy="loaiVe")
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<Ve> veList;
	
	public LoaiVe() {
		// TODO Auto-generated constructor stub
	}

	public LoaiVe(String maLV, String tenLV, Integer gia) {
		super();
		this.maLV = maLV;
		this.tenLV = tenLV;
		this.gia = gia;
	}

	public String getMaLV() {
		return maLV;
	}

	public void setMaLV(String maLV) {
		this.maLV = maLV;
	}

	public String getTenLV() {
		return tenLV;
	}

	public void setTenLV(String tenLV) {
		this.tenLV = tenLV;
	}

	public int getGia() {
		return gia;
	}

	public void setGia(Integer gia) {
		this.gia = gia;
	}

	public Collection<Ve> getVeList() {
		return veList;
	}

	public void setLoaiVeList(Collection<Ve> veList) {
		this.veList = veList;
	}
}
