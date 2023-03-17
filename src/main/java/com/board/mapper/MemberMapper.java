package com.board.mapper;

import java.util.List;

import com.board.domain.BoardVO;
import com.board.domain.Criteria;
import com.board.domain.MemberVO;

public interface MemberMapper {
	
	//회원가입
	public void insert(MemberVO vo);
	
	//아이디 중복 여부
	public int selectId(String userid);
	
	//로그인
	public MemberVO login(MemberVO vo);
	
	//회원 정보 수정
	public int update(MemberVO vo);
	
	//회원 탈퇴하기
	public int delete(MemberVO vo);
	
	//작성한 글 가져오기
	public List<BoardVO> selectBoard(Criteria cri);
	
	//작성한 글 개수
	public int boardTotal(String userid);
	
	//비밀번호 변경
	public int updatePw(MemberVO vo);
	
	//아이디 찾기
	public String forgotId(MemberVO vo);
	
	//존재하는 이메일인지 체크
	public int emailCheck(MemberVO vo);
	
}
