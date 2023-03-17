package com.board.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private Date updateDate;
	private Long views;
	
	private List<BoardAttachVO> attachList;
	
	private int boardCnt;
}
/*
create table tbl_board( 
	    bno number(10,0),
	    title varchar2(200) not null,
	    content varchar2(2000) not null,
	    writer varchar2(50) not null,
	    regdate date default sysdate,
	    updatedate date default sysdate,
	    views number default 0
);
	    
alter table tbl_board add constraint pk_boardprimary key (bno);
	    
alter table tbl_board add constraint fk_board_writer foreign key(writer)references tbl_member(userid);
*/	    
