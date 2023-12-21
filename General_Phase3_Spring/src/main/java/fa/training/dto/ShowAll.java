package fa.training.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ShowAll {

	private String maKhachHang;
	private String tenKhachHang;
	private String maMay;
	private String viTri;
	private String trangThai;
	private LocalDate ngayBatDauSuDungMay;
	private String gioBatDauSuDungMay;
	private Integer thoiGianSuDung;
	private String maDichVu;
	private LocalDate ngaySuDungDichVu;
	private String gioSuDungDichVu;
	private Integer soLuong;
	private Integer tongTien;
	
	
	
	
}
