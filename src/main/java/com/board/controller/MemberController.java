package com.board.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.BoardAttachVO;
import com.board.domain.BoardVO;
import com.board.domain.Criteria;
import com.board.domain.MemberVO;
import com.board.domain.PageDTO;
import com.board.service.BoardService;
import com.board.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@Log4j
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@GetMapping("/join")
	public void joinGet() {
		log.info("회원가입 페이지 진입");
	}
	
	@PostMapping("/join")
	public String joinPost(MemberVO vo) {
		String pw = "";
		String encodePw = "";
		
		pw = vo.getUserpw();
		encodePw = encoder.encode(pw);
		vo.setUserpw(encodePw);
		
		service.join(vo);
		return "redirect:/member/login";
	}
	
	@PostMapping("/idCheck")
	@ResponseBody
	public String idCheckPost(String userid) {
		log.info("idCheck for join");
		
		int result = service.idCheck(userid);
		
		if(result != 0) {
			return "fail";
		}else {
			return "success";
		}
	}
	
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		log.info("email data");
		log.info("인증 번호: " + email);
		
		Random random = new Random();
		
		int checkNum = random.nextInt(888888) + 111111;
		log.info("인증번호: " + checkNum);
		
		String setFrom = "kdyhy12@naver.com";
		String toMail = email;
		String title= "회원가입 인증 이메일입니다.";
		String content = "홈페이지에 방문해주셔서 감사합니다." + "<br> <br>" + "인증번호는 " + checkNum + "입니다. <br>" 
				+ "해당 인증번호를 인증번호 확인란에 기입해주세요.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String num = Integer.toString(checkNum);
		
		return num;
	}
	
	@GetMapping("/login")
	public void loginGet(){
	}
	
	@PostMapping("/login")
	public String loginPost(HttpServletRequest request, MemberVO vo, RedirectAttributes rttr) {
		log.info("loginPost");
		
		HttpSession session = request.getSession();
		String pw = "";
		String encodePw ="";
		
		MemberVO member = service.login(vo);
		
		if(member != null) {
			pw = vo.getUserpw();
			encodePw = member.getUserpw();
			
			if(true == encoder.matches(pw, encodePw)) {
				session.setAttribute("member", member);
				return "redirect:/main";
				
			}else {
				rttr.addFlashAttribute("login", "로그인에 실패하였습니다. 다시 시도해주세요.");
				return "redirect:/member/login";
			}
		}else {
			rttr.addFlashAttribute("login", "일치하는 아이디가 존재하지 않습니다.");
			return "redirect:/member/login";
		}
	}
	
	@GetMapping("/logout")
	public String logoutGet(HttpServletRequest request) {
		log.info("logout");
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "redirect:/main";
	}
	
	@GetMapping("/modify")
	public void idGet(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		log.info("modify : ");
		MemberVO vo = (MemberVO)session.getAttribute("member");
		model.addAttribute("list", vo);
	}
	
	@PostMapping("/modify")
	public String modifyMember(MemberVO vo, RedirectAttributes rttr) {
		log.info("modify the : " + vo);
		if(service.modify(vo)==1) {
			rttr.addFlashAttribute("result", "수정이 완료되었습니다.");
		}else {
			rttr.addFlashAttribute("result", "오류가 발생했습니다. 다시 시도해주세요.");
		}
		return "redirect:/member/modify";
	}
	
	@PostMapping("/remove")
	public String removeMember(HttpServletRequest request, MemberVO vo, RedirectAttributes rttr) {
		log.info("Controller to remove the member: " + vo.getUserid());
		String pw = "";
		String encodepw = "";	
		HttpSession session = request.getSession();
		
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		if(vo.getUserid() != null && vo.getUserpw() != null) {
			pw = vo.getUserpw();
			encodepw = mvo.getUserpw();

			if(true == encoder.matches(pw, encodepw)) {
				vo.setUserpw(encodepw);
				int result = service.remove(vo);
				log.info("result: " + result);
				if(result == 1) {
					session.invalidate();
					rttr.addFlashAttribute("removeMember", "탈퇴 완료되었습니다. 그동안 이용해주셔서 감사합니다.");
					return "redirect:/main";
				}
				
			}else {
				rttr.addFlashAttribute("result", "비밀번호가 일치하지 않습니다.");
				return "redirect:/member/modify";
			}
		}else {
			return "redirect:/member/modify";
		}
		return "redirect:/member/login";
	}
	
	@GetMapping("/getBoard")
	public void boardGet(HttpServletRequest request, Model model, Criteria cri) {
		log.info("getBoard...");
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		cri.setUserid(mvo.getUserid());
		int total = service.boardTotal(mvo.getUserid());
		model.addAttribute("list", service.boardGet(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	
	@GetMapping("/detail")
	public void detailGet(@RequestParam("bno") long bno, Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("detail board...");
		model.addAttribute("board", boardService.getBno(bno));
	}
	
	@GetMapping("/boardModify")
	public void modifyGet(@RequestParam("bno") long bno, Model model, @ModelAttribute("cri")Criteria cri) {
		log.info("Controller: modify the "+ bno);
		model.addAttribute("board", boardService.getModify(bno));
	}
	
	@PostMapping("/boardModify")
	public String modifyPost(BoardVO vo, RedirectAttributes rttr, @ModelAttribute("cri")Criteria cri) {
		log.info("Controller POST Modify");
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		if(boardService.modify(vo) ==1) {
			rttr.addFlashAttribute("result", "수정이 완료되었습니다.");
			return "redirect:/member/getBoard";
		}else {
			rttr.addFlashAttribute("result", "수정에 실패하였습니다. 다시 시도해주세요.");
			return "redirect:/member/getBoard";
		}
		
	}
	@PostMapping("/member/boardRemove")
	public String removePost(@RequestParam("bno") long bno, RedirectAttributes rttr, @ModelAttribute("cri")Criteria cri) {
		log.info("Controller: POST remove");
		List<BoardAttachVO> attachList = boardService.getAttachList(bno);
		
		if(boardService.remove(bno)==1) {
			
			deleteFiles(attachList);
		}
		
		rttr.addFlashAttribute("result", "삭제되었습니다.");
		
		return "redirect:/member/getBoard"+ cri.getMemberLink();
	}
	
	@GetMapping("/pwCheck")
	@ResponseBody
	public String pwCheckPost(HttpServletRequest request, String userpw, RedirectAttributes rttr) {
		log.info("pwCheck for changePw");
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		MemberVO vo = service.login(mvo);
		String pw = vo.getUserpw();
		log.info(encoder.matches(userpw,pw));
		if(false == encoder.matches(userpw,pw)) {
			return "fail";
		}else {
			return "success";
		}
	}
	
	@GetMapping("modPw")
	public void modifyPw(HttpServletRequest request, Model model) {
		log.info("modPw");
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		
	}
	
	@PostMapping("modPw")
	public String modPw(MemberVO vo,RedirectAttributes rttr) {
		String pw = vo.getUserpw();
		String encodePw = encoder.encode(pw);
		vo.setUserpw(encodePw);
		int result = service.changePw(vo);
		if(result ==1) {
			rttr.addFlashAttribute("result", "비밀번호가 변경되었습니다.");
			return "redirect:/member/login";
		}else {
			rttr.addFlashAttribute("result", "오류가 발생했습니다. 다시 시도해주세요");
			return "redirect:/member/login";
		}
	}
	
	@GetMapping("forgotId")
	public void forgotIdGet() {
		log.info("forgotId....");
		
	}
	
	@PostMapping(value= "forgotId")
	@ResponseBody
	public String forgotIdPost(MemberVO vo) {
		log.info("forgotIdPost..." + vo.getUserName() + " and " + vo.getUserMail());
		String id = service.forgotId(vo);
		if(id != null) {
			return id;	
		}else {
			return "fail";
		}
	}
	@GetMapping("forgotPw")
	public void forgotPwGet(String userName, Model model) {
		log.info("forgotPw....");
		if(userName != null) {
			model.addAttribute("name", userName);
		}else {
			
		}
		
	}
	
	@PostMapping("beforeMailPw")
	@ResponseBody
	public String beforeMailPw(MemberVO vo) {
		log.info("email check: " + vo);
		int result = service.emailCheck(vo);
		if(result == 0) {
			return "fail";
		}else {
			return "success";
		}
	}
	
	@PostMapping("forgotPw")
	public String forgotPwPost(MemberVO vo, RedirectAttributes rttr) {
		log.info("forgotPw...post.." + vo);
		int result = service.sendMail(vo);
		if(result != 1) {
			rttr.addFlashAttribute("result","오류가 발생했습니다. 다시 시도해주세요.");
		}else {
			rttr.addFlashAttribute("result", "이메일이 전송되었습니다. 임시 비밀번호로 로그인해주세요.");
		}
		return "redirect:/member/login";
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
