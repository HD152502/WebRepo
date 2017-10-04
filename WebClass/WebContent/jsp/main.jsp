<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.dimigo.vo.UserVO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css" href="../css/ytgoo.css">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Cl4vis's blog</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
	integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="home"></div>
	<nav class="navbar navbar-expand-lg fixed-top">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarTogglerDemo01"
			aria-controls="navbarTogglerDemo01" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
			<a class="navbar-brand scroll" href="#home" style="color: skyblue">Home</a>
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item" onmouseover="menu_over(this);"
					onmouseout="menu_out(this)"><a class="nav-link scroll"
					href="#intro">Introduction <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item" onmouseover="menu_over(this);"
					onmouseout="menu_out(this)"><a class="nav-link scroll"
					href="#fav">Favorite</a></li>
				<li class="nav-item" onmouseover="menu_over(this);"
					onmouseout="menu_out(this)"><a class="nav-link scroll"
					href="#bucket">Bucket List</a></li>
			</ul>
			<%
			UserVO user = (UserVO) session.getAttribute("user");
			if (user == null) {
			%>
			<ul class="nav justify-content-end">
				<li class="nav-item"><a class="nav-link" data-toggle="modal"
					data-target="#logInModal" style="color: blue">Login</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="modal"
					data-target="#exampleModal" style="color: blue">Register</a></li>
			</ul>
			<%} else { %>
						<ul class="nav justify-content-end">
				<li class="nav-item"><a class="nav-link" data-toggle="modal"
					data-target="" style="color: blue"><%=user.getName()+"님" %></a></li>
			</ul>
			<%} %>
		</div>
	</nav>
	<div class="modal" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Register</h5>

				</div>

				<form method="post" id="regForm">
					<div class="modal-body">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-secondary active"> <input
								type="radio" name="grade" id="option1" value="first" checked>
								1학년
							</label> <label class="btn btn-secondary"> <input type="radio"
								name="grade" id="option2" value="second"> 2학년
							</label> <label class="btn btn-secondary"> <input type="radio"
								name="grade" id="option3" value="third"> 3학년
							</label>
						</div>
						<br /> <br /> <select class="custom-select" name="classes"
							id="classes" required>
							<option value="" selected>반선택</option>
							<option value="1">1반</option>
							<option value="2">2반</option>
							<option value="3">3반</option>
							<option value="4">4반</option>
							<option value="5">5반</option>
							<option value="6">6반</option>
						</select> <br /> <br /> <input class="form-control" name="num"
							type="text" placeholder="번호" id="num" required> <br /> <input
							class="form-control" name="name" type="text" placeholder="이름"
							id="name" required> <br> <input class="form-control"
							name="regId" type="text" placeholder="ID" id="regId" required>
						<br> <input class="form-control" name="regPwd" type="text"
							placeholder="PWD" id="regPwd" required>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button class="btn btn-primary" type="submit">Register</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="modal" id="logInModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="logInModalLabel">LogIn</h5>
				</div>

				<form id="logInForm">
					<div class="modal-body">
						<input class="form-control" name="logInId" type="text"
							placeholder="ID" id="logInId" required> <br /> <input
							class="form-control" name="logInPwd" type="text"
							placeholder="PWD" id="logInPwd" required>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button class="btn btn-primary" type="submit">Login</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal" id="checkModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="checkModalLabel">LogIn</h5>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">close</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal" id="check2Modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title2" id="checkModalLabel2">Register</h5>
				</div>
				<div class="modal-body"></div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">close</button>
				</div>
			</div>
		</div>
	</div>

	<section class="home1" id="home1">
		<div class="container" style="text-align: center">
			<!-- 글 -->
			<h1 id="first" class="white font text">Welcome to my blog</h1>
			<h5 class="white">15기 해킹방어과 2학년 5반 구윤태의 블로그입니다!</h5>
			<br> <br> <br> <br> <br> <br>
		</div>
		<div style="text-align: right" class="padr">
			<h5 class="white">더 많은 정보가 궁금하다면?&nbsp;&nbsp;</h5>
			<a href="#" class="btn btn-outline-dark btn-lg white" role="button"
				data-toggle="modal" data-target="#exampleModal" style="color: white">Register
				Now</a>
		</div>
	</section>
	<section class="introduction" id="intro">
		<div class="container">
			<h1 class="white">Profile</h1>
			<br>
			<h5 class="white">이름 : 구윤태</h5>
			<h5 class="white">생일 : 2001/01/05</h5>
			<h5 class="white">거주지 : 서울시 종로구 북촌로 1길 30-5</h5>
			<h5 class="white">직업 : 고등학생</h5>
			<h5 class="white">학력 : 서울재동초등학교</h5>
			<h5 class="white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서울중앙중학교</h5>
			<h5 class="white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;한국디지털미디어고등학교
				15기 해킹방어과</h5>
			<h5 class="white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;연세대학교
				물리학과(지망)</h5>
			<h5 class="white">좋아하는 과목 : 물리, 수학</h5>
			<h5 class="white">취미 : webhacking</h5>
			<h5 class="white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;축구</h5>
			<h5 class="white">좌우명 : 될대로 되라</h5>
			<h5 class="white">
				블로그 : <a class="white" href="http://cl4vis.tistory.com">www.cl4vis.tistory.com</a>
			</h5>
			<img src="../image/boy.png" class="absolute" alt="boy">
		</div>
	</section>

	<section class="xc" id="fav">
		<div class="container" id="favorite" style="text-align: center">
			<h1 style="color: white">Favorite Things</h1>
		</div>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100 pic" src="../image/1.jpg"
						alt="First slide">
					<div class="carousel-caption d-none d-md-block">
						<h3 style="color: white">종아하는 연예인 : 박보영</h3>
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100 pic" src="../image/soccer.jpg"
						alt="Second slide">
					<div class="carousel-caption d-none d-md-block">
						<h3 style="color: white">종아하는 운동 : 축구</h3>
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100 pic" src="../image/webhack.jpg"
						alt="Third slide">
					<div class="carousel-caption d-none d-md-block">
						<h3 style="color: white">좋아하는 공부 : 웹 해킹</h3>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</section>

	<section class="sc buecket" id="bucket">
		<div class="container" id="bucket2" style="text-align: left">
			<h1 class="white" style="text-align: center">Bucket List</h1>
			<br>
		</div>
		<div>
			<ul class="list-group">
				<li class="list-group-item" style="text-align: center">1. 세계일주
					하기</li>
				<li class="list-group-item" style="text-align: center">2. 전교1등
					해보기</li>
				<li class="list-group-item" style="text-align: center">3. 번지점프
					하기</li>
				<li class="list-group-item" style="text-align: center">4. 어떤
					게임이든 렝킹 50등안에 들어보기</li>
				<li class="list-group-item" style="text-align: center">5. 대학교
					과탑하기</li>
				<li class="list-group-item" style="text-align: center">6. 누가봐도
					부러울만한 대학 들어가기</li>
				<li class="list-group-item" style="text-align: center">7. 처음으로
					내 힘으로 번돈에서 반이상 부모님 드리기</li>
				<li class="list-group-item" style="text-align: center">8. 친구들과
					함께 7박8일 여행가기</li>
				<li class="list-group-item" style="text-align: center">9. 자전거
					여행 가기</li>

			</ul>
		</div>
	</section>


	<div class="footer"></div>
	<script type="text/javascript" src="../js/scroll.js"></script>
	<script type="text/javascript" src="../js/javascript.js"></script>
</body>
</html>