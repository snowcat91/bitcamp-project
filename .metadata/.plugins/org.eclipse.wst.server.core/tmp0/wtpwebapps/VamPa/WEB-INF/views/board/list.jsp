<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>게시판</title>
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
			<img src="../resources/img/logo.png" class="home__a" />kipping site
		</div>
		<ul class="navbar__menu">
			<c:if test="${member == null}">
				<a href="/main"><li class="navbar__menu__item ">Home</li></a>
				<a href="/member/login"><li class="navbar__menu__item">로그인</li></a>
				<a href="/member/join"><li class="navbar__menu__item">회원가입</li></a>
			</c:if>

			<c:if test="${member != null }">
				<c:if test="${member.adminCk == 1 }">
					<a href="/admin/main"><li class="navbar__menu__item ">관리자
							페이지</li></a>
				</c:if>
				<a href="/main"><li class="navbar__menu__item ">Home</li></a>

				<a href="/board/list"><li class="navbar__menu__item ">게시판</li></a>
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


		</div>
	</section>

	<div class="content_area">
		<div class="section__container2">
			<div class="table_wrap">

				<table class="table table-striped">
					<thead>

						<tr>
							<th scope="col" class="text-center">번호</th>
							<th scope="col" class="text-center">상품리뷰</th>
							<th scope="col" class="text-center">작성자</th>
							<th scope="col" class="text-center">작성일</th>
							<th scope="col" class="text-center">수정일</th>
						</tr>
					</thead>
					<c:forEach items="${list}" var="list">
						<tr>
							<td scope="col" class="text-center"><c:out
									value="${list.bno}" /></td>
							<td scope="col" class="text-center"><a class="move"
								href='<c:out value="${list.bno}"/>'> <c:out
										value="${list.title}" />
							</a scope="col" class="text-center"></td>
							<td scope="col" class="text-center"><c:out
									value="${list.writer}" /></td>
							<td scope="col" class="text-center"><fmt:formatDate
									pattern="yyyy/MM/dd" value="${list.regdate}" /></td>
							<td scope="col" class="text-center"><fmt:formatDate
									pattern="yyyy/MM/dd" value="${list.updateDate}" /></td>
						</tr>
					</c:forEach>
				</table>

				<div class="search_wrap">
					<a href="/board/enroll" style="padding-top: 30px;padding-right: 10px;"
					 >
						<button type="button" class="btn btn-outline-secondary">게시판등록</button>
					</a>
					<div class="search_area">

						<select name="type">
							<option value=""
								<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>선택하세요</option>
							<option value="T"
								<c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>상품리뷰</option>
							<option value="C"
								<c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
							<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
							<option value="TC"
								<c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>상품리뷰
								+ 내용</option>
							<option value="TW"
								<c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>상품리뷰
								+ 작성자</option>
							<option value="TCW"
								<c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>상품리뷰
								+ 내용 + 작성자</option>
						</select> <input type="text" name="keyword"
							value="${pageMaker.cri.keyword }">

						<button type="button" class="btn btn-secondary btn-sm ">SEARCH</button>
					</div>
				</div>


				<div class="pageInfo_wrap">
					<div class="pageInfo_area">
						<ul id="pageInfo" class="pageInfo"   style=" margin-left: 400px;"
						>

							<!-- 이전페이지 버튼 -->
							<c:if test="${pageMaker.prev}">
								<li class="pageInfo_btn previous"><a
									href="${pageMaker.startPage-1}">Previous</a></li>
							</c:if>

							<!-- 각 번호 페이지 버튼 -->
							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a
									href="${num}">${num}</a></li>
							</c:forEach>

							<!-- 다음페이지 버튼 -->
							<c:if test="${pageMaker.next}">
								<li class="pageInfo_btn next"><a
									href="${pageMaker.endPage + 1 }">Next</a></li>
							</c:if>

						</ul>
					</div>
				</div>



				<form id="moveForm" method="get">
					<input type="hidden" name="pageNum"
						value="${pageMaker.cri.pageNum }"> <input type="hidden"
						name="amount" value="${pageMaker.cri.amount }"> <input
						type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
					<input type="hidden" name="type" value="${pageMaker.cri.type }">
				</form>
			</div>

			<script>
				$(document).ready(function() {

					let result = '<c:out value="${result}"/>';

					checkAlert(result);
					console.log(result);

					function checkAlert(result) {

						if (result === '') {
							return;
						}

						if (result === "enroll success") {
							alert("등록이 완료되었습니다.");
						}

						if (result === "modify success") {
							alert("수정이 완료되었습니다.");
						}

						if (result === "delete success") {
							alert("삭제가 완료되었습니다.");
						}
					}

				});
				let moveForm = $("#moveForm");
				$(".move")
						.on(
								"click",
								function(e) {
									e.preventDefault();

									moveForm
											.append("<input type='hidden' name='bno' value='"
													+ $(this).attr("href")
													+ "'>");
									moveForm.attr("action", "/board/get");
									moveForm.submit();
								});
				$(".pageInfo a").on(
						"click",
						function(e) {
							e.preventDefault();
							moveForm.find("input[name='pageNum']").val(
									$(this).attr("href"));
							moveForm.attr("action", "/board/list");
							moveForm.submit();

						});

				$(".search_area button")
						.on(
								"click",
								function(e) {
									e.preventDefault();

									let type = $(".search_area select").val();
									let keyword = $(
											".search_area input[name='keyword']")
											.val();

									if (!type) {
										alert("검색 종류를 선택하세요.");
										return false;
									}

									if (!keyword) {
										alert("키워드를 입력하세요.");
										return false;
									}

									moveForm.find("input[name='type']").val(
											type);
									moveForm.find("input[name='keyword']").val(
											keyword);
									moveForm.find("input[name='pageNum']").val(
											1);
									moveForm.submit();
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
		$("#gnb_logout_button").click(function() {
			//alert("버튼 작동");
			$.ajax({
				type : "POST",
				url : "/member/logout.do",
				success : function(data) {
					alert("로그아웃 성공");
					document.location.reload();
				}
			}); // ajax     
		});
	</script>

</body>
</html>