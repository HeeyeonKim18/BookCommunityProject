package com.board.controller;

import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.BoardAttachVO;
import com.board.domain.BoardVO;
import com.board.domain.Criteria;
import com.board.domain.MemberVO;
import com.board.domain.PageDTO;
import com.board.service.BoardService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@GetMapping("/main")
	public void main(Criteria cri, Model model) {		
		log.info("main with board table");
		model.addAttribute("board", service.getList(cri));
		int total = service.total(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/board/register")
	public void registerGet(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		model.addAttribute("id",vo.getUserid());

	}
	
	@PostMapping("/board/register")
	public String registerPost(BoardVO vo, RedirectAttributes rttr) {
		log.info("Controller:register Post" + vo);
		
		service.register(vo);
		
		rttr.addFlashAttribute("result", vo.getBno());
		
		return "redirect:/main";
	}
	
	@GetMapping("/board/lookup")
	public void lookupGet(@RequestParam("bno") long bno, Model model, @ModelAttribute("cri")Criteria cri) {
		log.info("Controller: look upthe "+ bno);
		model.addAttribute("board", service.getBno(bno));
	}
	
	@GetMapping("/board/modify")
	public void modifyGet(@RequestParam("bno") long bno, Model model, @ModelAttribute("cri")Criteria cri) {
		log.info("Controller: modify the "+ bno);
		model.addAttribute("board", service.getModify(bno));
	}
	
	@PostMapping("/board/modify")
	public String modifyPost(BoardVO vo, RedirectAttributes rttr, @ModelAttribute("cri")Criteria cri) {
		log.info("Controller POST Modify");
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		if(service.modify(vo) ==1) {
			rttr.addFlashAttribute("modifyResult", vo.getBno());
			return "redirect:/main";
		}else {
			rttr.addFlashAttribute("modifyResult", vo.getBno());
			return "redirect:/board/lookup?bno=" + vo.getBno();
		}
		
	}
	
	@PostMapping("/board/remove")
	public String removePost(@RequestParam("bno") long bno, RedirectAttributes rttr, @ModelAttribute("cri")Criteria cri) {
		log.info("Controller: POST remove");
		
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		
		if(service.remove(bno)==1) {
			deleteFiles(attachList);
		}
		
		rttr.addFlashAttribute("removeResult", bno);
		
		return "redirect:/main"+ cri.getListLink();
	}
	
	@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(long bno){
		log.info("getAttachList " + bno);
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		log.info("delete attach files");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("/Users/kimheeyeon/Desktop/upload12/" + attach.getUploadPath() 
				+ "/" + attach.getUuid()+ "_" + attach.getFileName());
				
				Files.deleteIfExists(file);
				
				Path thumbNail = Paths.get("/Users/kimheeyeon/Desktop/upload12/" + attach.getUploadPath() 
				+ "/s_" + attach.getUuid()+ "_" + attach.getFileName());
				
				Files.delete(thumbNail);
			}catch(Exception e) {
				log.error("delete file errror" + e.getMessage());
			}
		});
	}
	
	
	

}
