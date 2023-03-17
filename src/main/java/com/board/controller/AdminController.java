package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.Criteria;
import com.board.domain.MemberVO;
import com.board.domain.PageDTO;
import com.board.domain.ReplyVO;
import com.board.service.AdminService;
import com.board.service.ReplyService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@Autowired
	private ReplyService replyService;
	
	@GetMapping("/memberManagement")
	public void manageMember(Criteria cri, Model model) {
		List<MemberVO> list = service.memberList(cri);
		model.addAttribute("list", list);
		int total = service.memberTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping({"/idGet", "/memberModify"})
	public void idGet(String userid, Model model,  @ModelAttribute("cri")Criteria cri) {
		log.info("id" + userid);
		model.addAttribute("list", service.idGet(userid));
	}
	
	@PostMapping("/memberModify")
	public String modifyMember(MemberVO vo, RedirectAttributes rttr,  @ModelAttribute("cri")Criteria cri) {
		log.info("modify the : " + vo);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		if(service.modifyMember(vo)==1) {
			rttr.addFlashAttribute("result", "수정이 완료되었습니다.");
		}else {
			rttr.addFlashAttribute("result", "오류가 발생했습니다. 다시 시도해주세요.");
		}
		return "redirect:/admin/memberManagement";
	}
	
	@PostMapping("/memberRemove")
	public String removeMember(String userid, RedirectAttributes rttr,  @ModelAttribute("cri")Criteria cri) {
		log.info("remove member: " + userid);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		if(service.removeMember(userid)==1) {
			rttr.addFlashAttribute("result", "회원 정보를 삭제하였습니다.");
		}else {
			rttr.addFlashAttribute("result", "오류가 발생하였습니다. 다시 시도해주세요.");
		}
		return "redirect:/admin/memberManagement";
	}
	
	@GetMapping("/countBoard")
	@ResponseBody
	public ResponseEntity<String> countBoard(String userid) {
		log.info("countBoard: " + userid);
		int result = service.memberBoard(userid);
		String count = String.valueOf(result);
		return new ResponseEntity<String>(count, HttpStatus.OK);
	}
	
	@GetMapping("/replyManagement")
	public void replyManage(Criteria cri, Model model) {
		List<ReplyVO> list = replyService.listAll(cri);
		model.addAttribute("list", list);
		int total = replyService.ReplyTotal();
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
}
