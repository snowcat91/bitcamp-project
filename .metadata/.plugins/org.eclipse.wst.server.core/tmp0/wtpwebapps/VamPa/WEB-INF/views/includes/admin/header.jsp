 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

		<div class="content_area" style="  padding-top: 30px;">
			<div class="section__container2">
		
            <!-- contents-area -->
            <div class="admin_wrap">
                <!-- 네비영역 -->
                <div class="admin_navi_wrap">
	              <ul>
	                  <li >
	                      <a class="admin_list_01" href="/admin/goodsEnroll">상품 등록</a>
	                  </li>
	                  <li>
	                      <a class="admin_list_02" href="/admin/goodsManage">상품 관리</a>
	                  </li>
	                  <lI>
	                      <a class="admin_list_03" href="/admin/authorEnroll">고객 등록</a>                            
	                  </lI>
	                  <lI>
	                      <a class="admin_list_04" href="/admin/authorManage">고객 관리</a>                            
	                  </lI>
	                                                                                                               
	              </ul>
                </div> 
             </div>
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