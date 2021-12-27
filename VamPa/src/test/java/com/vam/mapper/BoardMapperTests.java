package com.vam.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.vam.model.BoardVO;
import com.vam.model.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTests {
	
	private static final Logger log = LoggerFactory.getLogger(BoardMapperTests.class);
	
	@Autowired
	private BoardMapper mapper;
	
	//게시판 등록
	/*
	@Test 
	public void testEnroll() {
		
		BoardVO vo = new BoardVO();
		
		vo.setTitle("mapper test345");
		vo.setContent("mapper test345");
		vo.setWriter("mapper test345");
		
		mapper.enroll(vo);
	}
	*/
	
	/*게시판 목록 테스트
	@Test
	public void testGetList() {
		
		List list = mapper.getList();
		for(int i = 0; i<list.size();i++) {
			log.info("" + list.get(i));
		}
	}
	*/
	
	/*게시판 조회 테스트
	@Test
	public void testGetPage() {
		
		//실제 존재하는 페이지 
		int bno = 9;
		
		log.info("" + mapper.getPage(bno));
	}
	*/
	
	/*게시판 수정 테스트
	@Test
	public void testModify() {
		
		BoardVO board = new BoardVO();
		board.setBno(10);
		board.setTitle("수정 제목22");
		board.setContent("수정 내용222");
		
		int result = mapper.modify(board);
		log.info("result: " + result);
	}
	*/
	
	/*게시판 삭제 테스트
	@Test
	public void testDelete() {
		
		int result = mapper.delete(45);
		log.info("result: " + result);
	}
	*/
	
	/*게시판 목록(페이징 적용)테스트
	@Test
	public void testGetListPaging() {
		
		Criteria cri = new Criteria();
		
		cri.setPageNum(3);
		
		List list = mapper.getListPaging(cri);
		
		list.forEach(board -> log.info("" + board));
	}
	
	*/
	
	/*게시물 총 갯수*/
	
	

}
