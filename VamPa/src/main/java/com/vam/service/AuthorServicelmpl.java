package com.vam.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.AuthorMapper;
import com.vam.model.AuthorVO;
import com.vam.model.Criteria;

@Service
public class AuthorServicelmpl implements AuthorService {
	
	private static final Logger log = LoggerFactory.getLogger(AuthorServicelmpl.class);
	
	@Autowired
    AuthorMapper authorMapper;

	@Override  //손님등록
	public void authorEnroll(AuthorVO author) throws Exception {
		
	authorMapper.authorEnroll(author);
		
	}

	@Override //손님 목록
	public List<AuthorVO> authorGetList(Criteria cri) throws Exception {
		
		log.info("(service)authorGetList()......"+cri);
		
		return authorMapper.authorGetList(cri);
	}

	@Override //손님 총 수 
	public int authorGetTotal(Criteria cri) throws Exception {
		log.info("(Service)authorGetTotal()....." +cri);
		
		return authorMapper.authorGetTotal(cri);
	}

	@Override // 손님 상세페이지
	public AuthorVO authorGetDetail(int authorId) throws Exception {
		log.info("authorGetDetail......" + authorId);
		return authorMapper.authorGetDetail(authorId);
	}

	@Override //손님 정보 수정
	public int authorModify(AuthorVO author) throws Exception {
		log.info("(service) authorModify............" + author);
		return authorMapper.authorModify(author);
	}

	@Override  //손님 삭제
	public int authorDelete(int authorId) {
		log.info("authorDelete................");
		
		return authorMapper.authorDelete(authorId);
	}

}
