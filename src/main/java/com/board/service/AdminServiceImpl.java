package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.board.domain.Criteria;
import com.board.domain.MemberVO;
import com.board.mapper.AdminMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;

	@Override
	public List<MemberVO> memberList(Criteria cri) {
		log.info("list");
		return mapper.selectMemberAll(cri);
	}

	@Override
	public int memberTotal(Criteria cri) {
		log.info("total member");
		return mapper.memberTotal(cri);
	}

	@Override
	public MemberVO idGet(String userid) {
		log.info("get Member id" + userid);
		return mapper.selectId(userid);
	}

	@Override
	public int modifyMember(MemberVO vo) {
		log.info("modifyMember" + vo);
		return mapper.update(vo);
	}

	@Override
	public int removeMember(String userid) {
		log.info("remove member : " + userid);
		return mapper.delete(userid);
	}

	@Override
	public int memberBoard(String userid) {
		log.info("count board");
		return mapper.memberBoard(userid);
	}

	
}
