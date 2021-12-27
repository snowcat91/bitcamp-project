package com.vam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.BoardMapper;
import com.vam.model.BoardVO;
import com.vam.model.BookVO;
import com.vam.model.Criteria;

@Service
public class BoardServicelmpl implements BoardService {
	
	@Autowired
	private BoardMapper mapper;

	@Override // 게시판 등록
	public void enroll(BoardVO board) {
		
		mapper.enroll(board);
		
	}

	@Override //게시판 목록
	public List<BoardVO> getList() {
		
		return mapper.getList();
	}

	@Override // 게시판 조회
	public BoardVO getPage(int bno) {
		
		return mapper.getPage(bno);
	}

	@Override // 게시판 수정
	public int modify(BoardVO board) {
		
		return mapper.modify(board);
	}

	@Override //게시판 삭제
	public int delete(int bno) {
		
		return mapper.delete(bno);
	}

	@Override // 게시판 페이징
	public List<BoardVO> getListPaging(Criteria cri) {
		
		return mapper.getListPaging(cri);
	}

	@Override //게시판 총 갯수
	public int getTotal(Criteria cri) {
		
		return mapper.getTotal(cri);
	}


	
	

}
