package ptithcm.entity;

import java.io.Serializable;

public class TheLoaiPK  implements Serializable {
	protected Phim phim;
    protected ChiTietTheLoai chiTietTL;

    public TheLoaiPK() {}

	public TheLoaiPK(Phim phim, ChiTietTheLoai chiTietTL) {
		this.phim = phim;
		this.chiTietTL = chiTietTL;
	}
    // equals, hashCode
}
