package com.vam.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.vam.model.AuthorVO;
import com.vam.model.BookVO;
import com.vam.model.Criteria;
import com.vam.model.PageDTO;
import com.vam.service.AdminService;
import com.vam.service.AuthorService;

@Controller
@RequestMapping("/admin")
public class AdminController {  //해당 수행단계 부분 , url 매핑 메서드 구현부
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private AuthorService authorService;
	
	@Autowired
	private AdminService adminService;
	
	  /* 관리자 메인 페이지 이동 */
    @RequestMapping(value="/main", method = RequestMethod.GET)
    public void adminMainGET() throws Exception{
        
        logger.info("관리자 페이지 이동");
        
    }
    
    /* 상품 관리 페이지 접속 */
    @RequestMapping(value = "/goodsManage", method = RequestMethod.GET)
    public void goodsManageGET(Criteria cri, Model model) throws Exception{
        logger.info("상품 관리 페이지 접속");
        
        /* 상품 리스트 데이터 */
		List list = adminService.goodsGetList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		
		/* 페이지 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageDTO(cri, adminService.goodsGetTotal(cri)));
    }
    
    /*상품 등록*/
    @PostMapping("/goodsEnroll")
    public String goodsEnrollPOST(BookVO book, RedirectAttributes rttr) {
    	
    	logger.info("goodsEnrollPOST........." + book);
    	
    	adminService.bookEnroll(book);
    	
    	rttr.addFlashAttribute("enroll_result", book.getBookName());
    	
    	return "redirect:/admin/goodsManage";
    	
    }
    
    /* 상품 정보 삭제 */
	@PostMapping("/goodsDelete")
	public String goodsDeletePOST(int bookId, RedirectAttributes rttr) {
		
		logger.info("goodsDeletePOST..........");
		
		int result = adminService.goodsDelete(bookId);
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/admin/goodsManage";
		
	}
    
    /*손님 검색 팝업창*/
    @GetMapping("/authorPop")
    public void authorPopGET(Criteria cri, Model model) throws Exception{
    	
    	logger.info("authorPopGET.......");
    	
    	cri.setAmount(5);
    	
    	/*게시물 출력 데이터*/
    	List list = authorService.authorGetList(cri);
    	
    	if(!list.isEmpty()) {
    		model.addAttribute("list",list); //손님 존재 경우
    	}else {
    		model.addAttribute("listCheck","empty"); //손님 존재하지 않을 경우
    	}
    	/*페이지 이동 인터페이스 데이터*/
    	model.addAttribute("pageMaker", new PageDTO(cri, authorService.authorGetTotal(cri)));
    }
    
    /* 상품 등록 페이지 접속 */
    @RequestMapping(value = "goodsEnroll", method = RequestMethod.GET)
    public void goodsEnrollGET(Model model) throws Exception{
        logger.info("상품 등록 페이지 접속");
        
        ObjectMapper objm = new ObjectMapper(); 
        
        List list =adminService.cateList();
        
        String cateList = objm.writeValueAsString(list);  // java 객체를 String 타입의 JSON 형식의 데이터 변환
        
        model.addAttribute("cateList", cateList);
        
        logger.info("변경 전.........." + list);
		logger.info("변경 후.........." + cateList);
    }
    /* 손님 등록 페이지 접속 내가넣었어 왜 not found get ? 접속 없어서 */
    @RequestMapping(value = "authorEnroll", method = RequestMethod.GET)
    public void authorEnrollGET() throws Exception{
        logger.info("손님 등록 페이지 접속");
    }
    /* 손님 등록 */
    @RequestMapping(value="authorEnroll.do", method = RequestMethod.POST)
    public String authorEnrollPOST(AuthorVO author, RedirectAttributes rttr) throws Exception{
    	System.out.println("테스트 1");
        logger.info("authorEnroll :" +  author);
        
        authorService.authorEnroll(author);      // 손님 등록 쿼리 수행
        
        rttr.addFlashAttribute("enroll_result", author.getAuthorName());
        
        return "redirect:/admin/authorManage";
        
    }
    
    /*손님 상세, 수정 페에지*/
    @GetMapping({"/authorDetail", "/authorModify"})
    public void authorGetInfoGET(int authorId, Criteria cri, Model model) throws Exception {
    	
    	logger.info("authorDetail..........." + authorId);
    	
    	
    	
    	/*손님 관리 페이지 정보*/
    	model.addAttribute("cri", cri);
    	
    	/*선택 손님 정보*/
    	model.addAttribute("authorInfo", authorService.authorGetDetail(authorId));
    }
    
    /*손님 정보 수정*/
    @PostMapping("/authorModify")
    public String authorModifyPOST(AuthorVO author, RedirectAttributes rttr)throws Exception{
    	
    	logger.info("authorModifyPOST............." + author);
    	
    	int result = authorService.authorModify(author);
    	
    	rttr.addFlashAttribute("modify_result", result);
    	
    	return "redirect:/admin/authorManage";
    	
    	
    }
    
    
    
    /* 손님 관리 페이지 접속 */
    @RequestMapping(value = "authorManage", method = RequestMethod.GET)
    public void authorManageGET(Criteria cri, Model model) throws Exception{
        logger.info("손님 관리 페이지 접속");
        
        /*손님 목록 출력 데이터*/
        List list = authorService.authorGetList(cri);
        
       // model.addAttribute("list",list);
        if(!list.isEmpty()) {
        	model.addAttribute("list", list); //손님 존재 경우
        } else {
        	model.addAttribute("listCheck", "empty"); //손님 존재하지 않을 경우
        }
        
        /*페이지 이동 인터페이스 데이터*/
        int total = authorService.authorGetTotal(cri);
        
        PageDTO pageMaker = new PageDTO(cri, total);
        
        model.addAttribute("pageMaker", pageMaker);
    }    
    
    /* 손님 정보 삭제 */
	@PostMapping("/authorDelete")
	public String authorDeletePOST(int authorId, RedirectAttributes rttr) {
		
		logger.info("authorDeletePOST..........");
		
		int result = 0;
		
		try {
			
			result = authorService.authorDelete(authorId);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			result = 1;
			rttr.addFlashAttribute("delete_result", result);
			
			return "redirect:/admin/authorManage";
			
		}
		
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/admin/authorManage";
		
	}	
    
    
    
    
    /*상품 조회 페이지*/
    @GetMapping({"/goodsDetail", "/goodsModify"})
    public void goodsGetInfoGET(int bookId, Criteria cri, Model model) throws JsonProcessingException {
    	
    	logger.info("goodsGetInfo().............." + bookId);
    	
    	ObjectMapper mapper = new ObjectMapper();
		
		/* 카테고리 리스트 데이터 */
		model.addAttribute("cateList", mapper.writeValueAsString(adminService.cateList()));
    	
    	/*목록 페이지 조건정보*/
    	model.addAttribute("cri", cri);
    	
    	/*조회 페이지 정보*/
    	model.addAttribute("goodsInfo", adminService.goodsGetDetail(bookId));
    }
    
    /* 상품 정보 수정 */
	@PostMapping("/goodsModify")
	public String goodsModifyPOST(BookVO vo, RedirectAttributes rttr) {
		
		logger.info("goodsModifyPOST.........." + vo);
		
		int result = adminService.goodsModify(vo);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/admin/goodsManage";		
		
	}
}
