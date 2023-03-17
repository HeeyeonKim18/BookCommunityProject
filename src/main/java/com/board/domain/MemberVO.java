package com.board.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String userid;
	private String userpw;
	private String userName;
	private String userMail;
	private String userPhone;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private int auth;
	
	private Date regDate;
	private Date updateDate;
	
}
/*
create table tbl_member(
	userid varchar2(50) not null primary key,
	userpw varchar2(100) not null,
	username varchar2(100)not null,
	usermail varchar2(100) not null,
	userphone varchar2(100) not null,
	userAddr1 varchar2(100) not null,
	userAddr2 varchar2(100) not null,
	userAddr3 varchar2(100),
	auth number default '0',
	regdate date default sysdate,
	updatedate date default sysdate
);
*/
