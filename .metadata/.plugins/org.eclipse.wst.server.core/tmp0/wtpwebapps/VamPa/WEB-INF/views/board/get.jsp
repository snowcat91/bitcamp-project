<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>게시판 상세정보</title>
<link rel="stylesheet" href="../resources/css/main1.css">
<link rel="stylesheet"
	href="../resources/css/bootstrap4.4.1/bootstrap.min.css">
<script src="../resources/js/main.js" defer></script>	
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
  </script>
</head>
<body>
<body>
	<!-- Navbar -->
	<nav id="navbar">
		<div class="navbar__logo">
			<img src="../resources/img/logo.png" class="home__a" /> kipping
				site
		</div>
		<ul class="navbar__menu">
			<c:if test="${member == null}">
				<a href="/main"><li class="navbar__menu__item ">Home</li></a>
				<a href="/member/login"><li class="navbar__menu__item">로그인</li></a>
				<a href="/member/join"><li class="navbar__menu__item">회원가입</li></a>
			</c:if>

			<c:if test="${member != null }">
				<c:if test="${member.adminCk == 1 }">
					<a  href="/admin/main"><li class="navbar__menu__item ">관리자 페이지</li></a>
				</c:if>
				<a href="/main"><li class="navbar__menu__item ">Home</li></a>
				<a href="/board/list"><li class="navbar__menu__item active">게시판</li></a>
				<li class="navbar__menu__item"><a id="gnb_logout_button">로그아웃</a></li>
			</c:if>

		</ul>

		<!-- header -->
		<button class="navbar__toggle-btn">
			<i class="fas fa-bars"></i>>
		</button>
	</nav>
	<section id="home">
		<div class="home__container">
			<img src="../resources/img/main.jpg" class="home__avatar" />
			<h3 class="home__title">
				Hello, <br />We provide you with any alcohol you want.
			</h3>

			<button class="home__contact">Contact Me</button>

		</div>
	</section>

	<div class="content_area">
		<section id="work" class="section">
			<div class="section__container2">


				<div class="input_wrap">
					<label>게시판 번호</label> <input type="text" class="form-control"
						aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-sm" name="bno"
						readonly="readonly" value='<c:out value="${pageInfo.bno}"/>'>
				</div>
				<div class="input_wrap">
					<label>게시판 제목</label> <input type="text" class="form-control"
						aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-sm" name="title"
						readonly="readonly" value='<c:out value="${pageInfo.title}"/>'>
				</div>
				<div class="input_wrap">
					<label>게시판 내용</label>
					<textarea class="form-control" aria-label="With textarea"
						name="content" placeholder="내용을 입력하세요"><c:out
							value="${pageInfo.content}" /></textarea>
				</div>
				<div class="input_wrap">
					<label>게시판 작성자</label> <input type="text" class="form-control"
						aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-sm"
					name="writer" readonly="readonly"
						value='<c:out value="${pageInfo.writer}"/>'>
				</div>
				<div class="input_wrap">
					<label>게시판 등록일</label> <input type="text" class="form-control"
						aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-sm"
					name="regdater" readonly="readonly"
						value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/>'>
				</div>
				<div class="input_wrap">
					<label>게시판 수정일</label> <input type="text" class="form-control"
						aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-sm"
					name="updateDate" readonly="readonly"
						value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.updateDate}"/>'>
				</div>
				<div class="btn_wrap">
					<a class="btn btn-secondary btn-lg" id="list_btn">목록 </a> <a
						class="btn btn-secondary btn-lg" id="modify_btn">수정 </a>
				</div>
				<form id="infoForm" action="/board/modify" method="get">
					<input type="hidden" id="bno" name="bno"
						value='<c:out value="${pageInfo.bno}"/>'> <input
						type="hidden" name="pageNum"
						value='<c:out value="${cri.pageNum}"/>'> <input
						type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
					<input type="hidden" name="type" value="${cri.type }"> <input
						type="hidden" name="keyword" value="${cri.keyword }">
				</form>

				<script>
	let form = $("#infoForm");
	
	$("#list_btn").on("click", function(e){
		form.find("#bno").remove();
		form.attr("action", "/board/list");
		form.submit();
	});
	
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/board/modify");
		form.submit();
	});	
</script>





			</div>
		</section>
	</div>


	<!-- Footer 영역 -->

	<!-- class="footer_nav" -->
	<section id="contact" class="section">

		<h2 class="contact__email">bit.kipping@gmail.com</h2>
		<div class="contact__links">
			<a href="https://github.com/dream-ellie" target="_blank"> <i
				class="fab fa-github"></i>
			</a> <a href="#" target="_blank"> <i class="fa fa-linkedin-square"></i>
			</a>
		</div>
		<p class="contact__rights">
			(주) Vam alchoal 대표이사 : 다이노 <br> 사업자등록번호 : o11-123-56789 <br>
			대표전화 : 1440-2293(발신자 부담전화) <br> <br> COPYRIGHT(C) <strong>bit.camp.com</strong>
			ALL RIGHTS RESERVED.
		</p>
	</section>
	<!-- class="footer" -->


	</div>
	</div>


	<script>
 
    /* gnb_area 로그아웃 버튼 작동 */
    $("#gnb_logout_button").click(function(){
    	//alert("버튼 작동");
        $.ajax({
            type:"POST",
            url:"/member/logout.do",
            success:function(data){
                alert("로그아웃 성공");
                document.location.reload();     
            } 
        }); // ajax     
    });
    
</script>
</body>
</html>