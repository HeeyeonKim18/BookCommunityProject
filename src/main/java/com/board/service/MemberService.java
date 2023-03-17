package com.board.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.board.domain.BoardVO;
import com.board.domain.Criteria;
import com.board.domain.MemberVO;

public interface MemberService {
	
	//회원가입
	public void join(MemberVO vo);
	
	//아이디 중복 여부
	public int idCheck(String userid);
	
	//로그인
	public MemberVO login(MemberVO vo);
	
	//회원 정보 수정
	public int modify(MemberVO vo);
	
	//회원 탈퇴하기
	public int remove(MemberVO vo);
	
	//본인 작성글 가져오기
	public List<BoardVO> boardGet(Criteria cri);
	
	//작성글 총 개
	public int boardTotal(String userid);
	
	//비밀번호 변경
	public int changePw(MemberVO vo);
	
	//아이디 찾기
	public String forgotId(MemberVO vo);
	
	//존재하는 이메일인지 체크
	public int emailCheck(MemberVO vo);
	
	//비밀번호 변경 후 이메일 전송
	public int sendMail(MemberVO vo);
}
