<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/layout2.css" />
<link rel="stylesheet" href="./resources/css/font.css" />
<link rel="stylesheet" href="./resources/css/home.css" />
</head>
<body>
	<div class="bookcover">
		<div class="bookdot">
			<div class="page">
				<div class="profile-container">
					<div class="header profile-title font-neo">
						TODAY<span class="color-red"> 28</span> | TOTAL 234918
					</div>
					<div class="box profile-box">
						<div class="profile-image">
							<img class="profile-image-img" src="./resources/img/${cymember.imgFile}" />
						</div>
						<div class="profile-text font-kyobohand">
							<div>Cyworld...ㅋ..ㅡㄹ론코...eㅣㅇ...☆</div>
							<div>---------------------</div>
							${cymember.id}님의 미니홈피에 오신걸 환영합니다!
						</div>
						<select>
							<option value="">일촌파도타기..☆</option>
							<option value="https://www.naver.com">네이버</option>
							<option value="https://www.google.com">구글</option>
						</select>
						<div class="profile-username font-kyobohand">
							<span style="color: #0f1b5c"></span> (♪♬)
						</div>
					</div>
				</div>
				<div class="content-container">
					<div class="header content-title">
						<div class="content-title-name">
							<img class="title-img" alt="logo"
								src="./resources/img/Cyworld-literal.svg">
						</div>
						<div class="content-title-url"></div>
					</div>
					<div class="box content-box">
						<div class="menu-wrapper">
							<div>
								<div class="box-title">그간의 여행들..</div>
								<div class="box-title">여행 사진들..</div>
								<div class="box-title">축 100 일 예린♥영권 </div>
							</div>
							<div style="border: 1px solid black;">
								<div style="display: flex;"class="box-wrapper">
									<div class="box-title">투데이</div>
									<div class="box-title">쥬크박스</div>
								</div>
								<div style="display: flex;" class="box-wrapper">
									<div class="box-title">사진첩</div>
									<a href="guestbook.jsp?id=${param.id}">
										<div class="box-title">방명록</div>
									</a>
								</div>
							</div>
						</div>
					</div>
					<div class="news-flex-box">
						<div class="news-box">
							<div class="news-row">
								<div class="news-category category-pic"></div>
								<div class="news-title"></div>
							</div>
							<div class="news-row">
								<div class="news-category category-post"></div>
								<div class="news-title"></div>
							</div>
							<div class="news-row">
								<div class="news-category category-post"></div>
								<div class="news-title"></div>
							</div>
							<div class="news-row">
								<div class="news-category category-pic"></div>
								<div class="news-title"></div>
							</div>
						</div>
						<div class="update-box">
							<div class="menu-row">
								<div class="menu-item">
									<span class="menu-num"></span>
								</div>
								<div class="menu-item">
									<span class="menu-num"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="miniroom">
						<div class="box-title"></div>
						<div class="miniroom-gif-box">
							<img class="content-img"
								src="./resources/img/home.contentfile.PNG" alt="" />
						</div>
					</div>
				</div>
				<div class="btn-wrapper">
					<button type="button" onclick="#" class="btn">Home</button>
					<button type="button" onclick="#" class="btn">Priofile</button>
					<button type="button" onclick="#"class="btn">Jukebox</button>
					<button type="button" onclick="#" class="btn">Miniroom</button>
					<button type="button" onclick="#" class="btn">Photo</button>
					<button type="button" onclick="#" class="btn">Board</button>
					<button type="button" onclick="#" class="btn">Paper</button>
					<a href="guestbook.jsp?id=${param.id}">
					<button type="button" onclick="#" class="btn">Visltor</button>
					</a>
					<button type="button" onclick="#" class="btn">Favorlte</button>
				</div>
			</div>
			<div class="menu-container"></div>
		</div>
	</div>
</body>
</html>