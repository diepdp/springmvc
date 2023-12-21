package fa.training.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import fa.training.dto.ShowAll;
import fa.training.entity.SuDungDichVu;
import fa.training.entity.SuDungDichVuID;

@Repository
public interface SuDungDichVuRepo extends JpaRepository<SuDungDichVu, SuDungDichVuID> {
//	@Query(value="select kh.khachhang_id maKhachHang, tenkhachhang tenKhachHang, m.may_id maMay, m.vitri viTri, m.trangthai trangThai, sdm.ngaybatdausudung ngayBatDauSuDungMay, sdm.giobatdausudung gioBatDauSuDungMay,  "
//			+ " sdm.thoigiansudung thoiGianSuDung, dv.dichvu_id maDichVu, sddv.ngaysudung ngaySuDungDichVu, sddv.giosudung gioSuDungDichVu, sddv.soluong soLuong, (sddv.soluong * dv.dongia) as tongTien "
//			+ " from khachhang kh "
//			+ " left join sudungmay sdm on sdm.khachhang_id = kh.khachhang_id "
//			+ " left join sudungdichvu sddv on sddv.khachhang_id = kh.khachhang_id "
//			+ " left join  dichvu dv on dv.dichvu_id = sddv.dichvu_id "
//			+ " left join may m on m.may_id = sdm.may_id "
//			+ " where sddv.khachhang_id is not null or sdm.khachhang_id is not null "
//			+ "" , nativeQuery = true)
	
	@Query(value="SELECT new fa.training.dto.ShowAll(kh.id, kh.tenKH, m.id, m.viTri, m.trangThai, sdm.suDungMayID.ngayBatDauSuDung, "
			+ " sdm.suDungMayID.gioBatDauSuDung, sdm.thoiGianSuDung, dv.id, sddv.suDungDichVuID.ngaySuDung, "
			+ " sddv.suDungDichVuID.gioSuDung, sddv.soLuong, (sddv.soLuong * dv.donGia) as tongTien) "
			+ " FROM KhachHang kh "
			+ " LEFT JOIN kh.suDungMay sdm "
			+ " LEFT JOIN kh.suDungDichVu sddv "
			+ " LEFT JOIN sddv.suDungDichVuID.dichVu dv "
			+ " LEFT JOIN sdm.suDungMayID.may m "
			+ " WHERE sddv.suDungDichVuID.khachHang.id IS NOT NULL OR sdm.suDungMayID.may.id IS NOT NULL")
	Page<ShowAll> findAllInfo(Pageable pageable);
	
	@Query(value="SELECT COUNT (*) "
			+ " FROM KhachHang kh "
			+ " LEFT JOIN kh.suDungMay sdm "
			+ " LEFT JOIN kh.suDungDichVu sddv "
			+ " LEFT JOIN sddv.suDungDichVuID.dichVu dv "
			+ " LEFT JOIN sdm.suDungMayID.may m "
			+ " WHERE m.id = ?1")
	int countById(String id);

}
