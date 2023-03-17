package com.board.domain;

import java.util.List;

import lombok.Data;

@Data
public class PageDTO {
	
	private int startPage;
	private int endPage;
	
	private boolean next;
	private boolean prev;
	
	private int total;
	private Criteria cri;
	
	private int[] amountList = {10,15,50};
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum()/ 10.0))* 10;
		this.startPage = this.endPage -9;
		
		int realEnd = (int)(Math.ceil((total * 1.0)/cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
	}
}
