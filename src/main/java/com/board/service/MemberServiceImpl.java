package com.board.service;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.board.domain.BoardVO;
import com.board.domain.Criteria;
import com.board.domain.MemberVO;
import com.board.mapper.BoardAttachMapper;
import com.board.mapper.BoardMapper;
import com.board.mapper.MemberMapper;
import com.board.mapper.ReplyMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BoardAttachMapper attachMapper;
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private ReplyMapper replyMapper;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public void join(MemberVO vo) {
		log.info("join.." );
		
		mapper.insert(vo);

	}

	@Override
	public int idCheck(String userid) {
		log.info("service.. idCheck");
		return mapper.selectId(userid);
	}

	@Override
	public MemberVO login(MemberVO vo) {
		log.info("service..Login");
		return mapper.login(vo);
	}

	@Override
	public int modify(MemberVO vo) {
		log.info("service member modify" + vo);
		return mapper.update(vo);
	}

	@Transactional
	@Override
	public int remove(MemberVO vo) {
		log.info("service to remove member: " + vo.getUserid());
		replyMapper.deleteByReplyer(vo.getUserid());
		replyMapper.deleteBnoByReplyer(vo.getUserid());
		log.info("delete reply..");
		long[] bno = boardMapper.bnoGet(vo.getUserid());
		for(int i = 0; i< bno.length; i++) {
			attachMapper.deleteAll(bno[i]);
		}
		log.info("delete attach..");
		boardMapper.deleteBoard(vo.getUserid());
		log.info("delete board..");
		return mapper.delete(vo);
	}

	@Override
	public List<BoardVO> boardGet(Criteria cri) {
		log.info("list of board : " + cri.getUserid());
		return mapper.selectBoard(cri);
	}

	@Override
	public int boardTotal(String userid) {
		log.info("boardTotal for : "+ userid);
		return mapper.boardTotal(userid);
	}

	@Override
	public int changePw(MemberVO vo) {
		log.info("change password: " + vo); 
		return mapper.updatePw(vo);
	}

	@Override
	public String forgotId(MemberVO vo) {
		log.info("forgotId");
		return mapper.forgotId(vo);
	}

	@Override
	public int emailCheck(MemberVO vo) {
		log.info("email check");
		return mapper.emailCheck(vo);
	}
	
	@Transactional
	@Override
	public int sendMail(MemberVO vo) {
		log.info("change pw" );
		Random random = new Random();
		
		int num = random.nextInt(888888) + 111111;
		log.info("비밀번호 " + num);	
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodePw = passwordEncoder.encode(Integer.toString(num));
		vo.setUserpw(encodePw);
		int changePw = mapper.updatePw(vo);
		if(changePw == 0) {
			return 0;
		}else {

			String setFrom = "kdyhy12@naver.com";
			String toMail = vo.getUserMail();
			String title= "임시 비밀번호입니다.";
			String content = "임시 비밀번호를 알려드립니다." + "<br> <br>" + "임시 비밀번호는 " + num + "입니다. <br>" 
					+ "해당 비밀번호로 로그인하여 비밀번호를 변경해주세요.";
			
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
		}
		return 1;
	}


}
