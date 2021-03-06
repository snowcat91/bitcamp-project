<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Welcome BookMall</title>

<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/main1.css">
<script src="resources/js/main.js" defer></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
	
</script>
</head>
<body>

	<!-- Navbar -->
	<nav id="navbar">
		<div class="navbar__logo">
			<img src="resources/img/logo.png" alt="Ellie's profile photo"
				class="home__a" /> <a href="#">kipping site</a>
		</div>
		<ul class="navbar__menu">
			<c:if test="${member == null}">
				<a href="/main"><li class="navbar__menu__item ">Home</li></a>
				<a href="/member/login"><li class="navbar__menu__item">로그인</li></a>
				<a href="/member/join"><li class="navbar__menu__item">회원가입</li></a>
			</c:if>

			<c:if test="${member != null }">
				<c:if test="${member.adminCk == 1 }">
					<li class="navbar__menu__item "><a href="/admin/main">관리자
							페이지</a></li>
				</c:if>
				<li class="navbar__menu__item active" data-link="#home">Home</li>
				<li class="navbar__menu__item"><a href="/board/list">게시판</li>
				<li class="navbar__menu__item"><a id="gnb_logout_button">로그아웃</a></li>
				<li class="navbar__menu__item"><c:choose>
						<c:when test="${member.adminCk == 1 }">
							<a href="/admin/goodsManage">키핑게시판</a>
						</c:when>
						<c:otherwise>
							<a href="/board/goodsManage">키핑게시판</a>
						</c:otherwise>
					</c:choose></li>
			</c:if>
		</ul>

		<!-- Toggle button -->
		<button class="navbar__toggle-btn">
			<i class="fas fa-bars"></i>>
		</button>
	</nav>
	<section id="home">
		<div class="home__container">
			<img src="resources/img/main.jpg" class="home__avatar" />
			<h2 class="home__title">
				Hello, <br />We provide you with any alcohol you want.
			</h2>

			<button class="home__contact">Contact Me</button>

		</div>
	</section>

	<div class="content_area">
		<section id="work" class="section">
			<div class="section__container">
				<h1>제품</h1>
				<h3>alcohol</h3>
				<div class="work__categories">
					<button class="category__btn " data-filter="*">
						새 상품 <span class="category__count">8</span>
					</button>
					<button class="category__btn" data-filter="front-end">
						추천상품 <span class="category__count">3</span>
					</button>
					<button class="category__btn" data-filter="back-end">
						인기상품 <span class="category__count">2</span>
					</button>

				</div>
				<div class="work__projects">
					<a href="" class="project" target="blank" data-type="front-end">
						<img src="resources/img/sull1.png" alt="Youtube"
						class="project__img" />
						<div class="project__description">
							<h3>조니 워커 18년 선물세트</h3>
							<span>153,000원</span>
						</div>
					</a> <a href="https://github.com/dream-ellie/responsive-nav-bar"
						class="project" data-type="front-end" target="blank"> <img
						class="project__img" src="resources/img/sull2.png" alt="navbar" />
						<div class="project__description">
							<h3>1865, 시라 2019</h3>
							<span>30,000원</span>
						</div>
					</a> <a href="https://github.com/dream-ellie/responsive-nav-bar"
						class="project" data-type="front-end" target="blank"> <img
						class="project__img" src="resources/img/sull3.png" alt="navbar" />
						<div class="project__description">
							<h3>플랜테이션 오리지널다크</h3>
							<span>42,000원</span>
						</div>
					</a> <a href="" class="project" data-type="back-end"> <img
						class="project__img" src="resources/img/sull4.png" alt="" />
						<div class="project__description">
							<h3>강소백</h3>
							<span>19,000원</span>
						</div>
					</a> <a href="" class="project" data-type="back-end"> <img
						class="project__img" src="resources/img/sull5.png" alt="" />
						<div class="project__description">
							<h3>보쥬 밀크 리큐르</h3>
							<span>25,000원</span>
						</div>
					</a> <a href="" class="project" data-type="mobile"> <img
						class="project__img" src="resources/img/sull6.png" alt="" />
						<div class="project__description">
							<h3>노첼로</h3>
							<span>41,000원</span>
						</div>
					</a> <a href="" class="project" data-type="mobile"> <img
						class="project__img" src="resources/img/sull7.png" alt="" />
						<div class="project__description">
							<h3>아가베로</h3>
							<span>80,000원</span>
						</div>
					</a> <a href="" class="project" data-type="mobile"> <img
						class="project__img" src="resources/img/sull8.png" alt="" />
						<div class="project__description">
							<h3>아발라우어 12년</h3>
							<span>12</span>
						</div>
					</a>
				</div>
			</div>
		</section>
	</div>


	<!-- Footer 영역 -->

	<!-- class="footer_nav" -->
	<section id="contact" class="section">
		<div class="content_area">
			<div class="section__container2">
				<div id="map2" style="width: 900px; height: 300px;"></div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7055ac60564655c342df1e91bac4b22"></script>
				<script>
					var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div
					mapOption2 = {
						center : new kakao.maps.LatLng(37.507373, 127.034434), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};
					var map2 = new kakao.maps.Map(mapContainer2, mapOption2); // 지도를 생성합니다
					// 마커가 표시될 위치입니다
					var markerPosition = new kakao.maps.LatLng(37.507373, 127.034434);
					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
						position : markerPosition
					});
					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map2);
				</script>

				
			</div>
		</div>
		<p class="contact__rights">
			(주) Vam alchoal 대표이사 : 다이노 <br> 사업자등록번호 : o11-123-56789 <br>
			대표전화 : 1440-2293(발신자 부담전화) <br> <br> COPYRIGHT(C) <strong>bit.camp.com</strong>
			ALL RIGHTS RESERVED.
		</p>
	</section>
	<!-- class="footer" -->





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