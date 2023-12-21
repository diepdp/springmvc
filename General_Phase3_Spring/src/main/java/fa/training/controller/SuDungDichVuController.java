package fa.training.controller;

import java.time.LocalDate;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fa.training.dto.FormDKDV;
import fa.training.dto.PageAble;
import fa.training.dto.ShowAll;
import fa.training.entity.DichVu;
import fa.training.entity.KhachHang;
import fa.training.entity.SuDungDichVu;
import fa.training.entity.SuDungDichVuID;
import fa.training.service.DVServices;
import fa.training.service.KHService;
import fa.training.service.SuDungDichVuService;

@Controller
@RequestMapping("/sudungdichvu")
public class SuDungDichVuController {

	@Autowired
	SuDungDichVuService service;
	@Autowired
	KHService khService;
	@Autowired
	DVServices dvService;
//	@Autowired
//	ShowAllService showAll;

	@PostMapping("/saveDV")
	public String addNewSuDungDichVu(@ModelAttribute(name = "suDungDichVuForm") @Valid FormDKDV formDKDV,
			BindingResult result, Model model) {
		model.addAttribute("listIDKH", khService.getAll());
		model.addAttribute("listIDDV", dvService.getAll());
		if (result.hasErrors()) {
			return "/sudungdichvu/new";
		}
		SuDungDichVuID suDungDichVuID = new SuDungDichVuID();
		SuDungDichVu suDungDichVu = new SuDungDichVu();
		KhachHang khachHang = khService.findById(formDKDV.getIdKH());
		DichVu dichVu = dvService.findById(formDKDV.getIdDV());

		suDungDichVuID.setKhachHang(khachHang);
		suDungDichVuID.setDichVu(dichVu);
		suDungDichVuID.setNgaySuDung(LocalDate.parse(formDKDV.getNgaySD()));
		suDungDichVuID.setGioSuDung(formDKDV.getGioSD());

		suDungDichVu.setSuDungDichVuID(suDungDichVuID);
		suDungDichVu.setSoLuong(formDKDV.getSoLuong());

		service.save(suDungDichVu);

		return "redirect:/sudungdichvu/show";
	}

	@GetMapping("/save")
	public String showForm(Model model) {
		model.addAttribute("listIDKH", khService.getAll());
		model.addAttribute("listIDDV", dvService.getAll());
		model.addAttribute("suDungDichVuForm", new FormDKDV());
		return "/sudungdichvu/new";
	}

	@GetMapping("/show")
	public String showAll(Model model, @RequestParam(defaultValue = "0") int page) {
		PageAble pageAble = new PageAble(page);
//		List<ShowAll> showList = showAll.getAllInfo();
		Pageable pagaable = PageRequest.of(page, 5);
		Page<ShowAll> infoList = service.findAllInfo(pagaable);
		model.addAttribute("infoList", infoList.getContent());
		model.addAttribute("totalPages", infoList.getTotalPages());
		model.addAttribute("currentPage", page);
		return "/showall";
	}

}
