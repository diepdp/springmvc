package fa.training.dto;

import javax.persistence.Entity;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@RequiredArgsConstructor
public class FormDKDV {
	@NotBlank(message="không được để trống")
	private String idKH;
	
	@NotBlank(message="không được để trống")
	private String idDV;
	
	@NotBlank(message="không được để trống")
	private String ngaySD;
	
	@NotBlank(message="không được để trống")
	private String gioSD;
	
	@NotNull(message="không được để trống")
	private int soLuong;
	
}
