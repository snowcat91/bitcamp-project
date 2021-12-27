package com.vam.service;

import java.util.List;

import com.vam.model.BookVO;
import com.vam.model.CateVO;
import com.vam.model.Criteria;

public interface AdminService { //mapper 메서드 수행할 service 단계 메서드 선언부
	
	/*상품등록*/
	public void bookEnroll(BookVO book);
	
	/*카테고리 리스트*/
	public List<CateVO> cateList();
	
	/* 상품 리스트*/
	public List<BookVO> goodsGetList(Criteria cri);
	
	/* 상품 총 갯수*/
	public int goodsGetTotal(Criteria cri);
	
	/*상품 조회 페이지*/
	public BookVO goodsGetDetail(int bookId);
	
	/*상품 정보 수정*/
	public int goodsModify(BookVO vo);
	
	/*상품 정보 삭제*/
	public int goodsDelete(int bookId);
	
	
}
