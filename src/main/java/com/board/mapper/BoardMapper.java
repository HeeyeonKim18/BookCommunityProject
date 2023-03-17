package com.board.mapper;

import java.util.List;

import com.board.domain.BoardVO;
import com.board.domain.Criteria;

public interface BoardMapper {
	
	//게시판 등록
	public void insert(BoardVO vo);
	
	public void insertSelectKey(BoardVO vo);

	//게시판 목록
	public List<BoardVO> selectAll(Criteria cri);
	
	//게시판 조회
	public BoardVO selectOne(Long bno);
	
	//게시판 수정
	public int update(BoardVO vo);
	
	//게시판 삭제
	public int delete(Long bno);
	
	//게시판 조회수
	public void countViews(Long bno);
	
	//게시판 수
	public int boardTotal(Criteria cri);
	
	//아이디 보드 삭제
	public void deleteBoard(String writer);
	
	//bno 불러오기
	public long[] bnoGet(String writer);

}
