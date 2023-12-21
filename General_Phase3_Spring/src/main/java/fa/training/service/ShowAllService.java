//package fa.training.service;
//
//import java.sql.Date;
//import java.util.ArrayList;
//import java.util.List;
//
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import fa.training.dto.PageAble;
//import fa.training.dto.ShowAll;
//
//@Service
//public class ShowAllService {
//	@Autowired
//	SessionFactory sessionFactory;
//
//	@SuppressWarnings("unchecked")
//	@Transactional("hibernateTransactionManager")
//	public List<ShowAll> getAllInfo() {
//
//		List<ShowAll> allInfoDTOs = new ArrayList<ShowAll>();
//		Session session = sessionFactory.getCurrentSession();
//		List<Object[]> allInfoList = session.createNativeQuery(
//				"select kh.khachhang_id maKhachHang, tenkhachhang tenKhachHang, m.may_id maMay, m.vitri viTri, m.trangthai trangThai, sdm.ngaybatdausudung ngayBatDauSuDungMay, sdm.giobatdausudung gioBatDauSuDungMay,  "
//						+ " sdm.thoigiansudung thoiGianSuDung, dv.dichvu_id maDichVu, sddv.ngaysudung ngaySuDungDichVu, sddv.giosudung gioSuDungDichVu, sddv.soluong soLuong, (sddv.soluong * dv.dongia) as tongTien "
//						+ " from khachhang kh " + " left join sudungmay sdm on sdm.khachhang_id = kh.khachhang_id "
//						+ " left join sudungdichvu sddv on sddv.khachhang_id = kh.khachhang_id "
//						+ " left join  dichvu dv on dv.dichvu_id = sddv.dichvu_id "
//						+ " left join may m on m.may_id = sdm.may_id "
//						+ " where sddv.khachhang_id is not null or sdm.khachhang_id is not null ")
//				.list();
//
//		for (Object[] o : allInfoList) {
//			ShowAll allInfoDTO = new ShowAll();
//			allInfoDTO.setMaKhachHang((String) o[0]);
//			allInfoDTO.setTenKhachHang((String) o[1]);
//			allInfoDTO.setMaMay((String) o[2]);
//			allInfoDTO.setViTri((String) o[3]);
//			allInfoDTO.setTrangThai((String) o[4]);
//			if (o[5] != null) {
//				allInfoDTO.setNgayBatDauSuDungMay(((Date) o[5]).toLocalDate());
//			} else {
//				allInfoDTO.setNgayBatDauSuDungMay(null);
//			}
//			allInfoDTO.setGioBatDauSuDungMay((String) o[6]);
//			if (o[7] != null) {
//				allInfoDTO.setThoiGianSuDung((Integer) o[7]);
//			} else {
//				allInfoDTO.setThoiGianSuDung(null);
//			}
//			allInfoDTO.setMaDichVu((String) o[8]);
//			if (o[9] != null) {
//				allInfoDTO.setNgaySuDungDichVu(((Date) o[9]).toLocalDate());
//			} else {
//				allInfoDTO.setNgaySuDungDichVu(null);
//			}
//			allInfoDTO.setGioSuDungDichVu((String) o[10]);
//			if (o[11] != null) {
//				allInfoDTO.setSoLuong((Integer) o[11]);
//			} else {
//				allInfoDTO.setSoLuong(null);
//			}
//			if (o[12] != null && o[11] != null) {
//				allInfoDTO.setTongTien((Integer) o[12] * (Integer) o[11]);
//			} else {
//				allInfoDTO.setTongTien(null);
//			}
//			allInfoDTOs.add(allInfoDTO);
//
//		}
//		return allInfoDTOs;
//	}
//
//}
