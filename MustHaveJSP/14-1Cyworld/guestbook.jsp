<%@page import="model.GuestbookReplyDTO"%>
<%@page import="model.GuestbookReplyDAO"%>
<%@page import="model.member"%>
<%@page import="model.memberDAO"%>
<%@page import="model.guestbookDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.guestbookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/layout2.css" />
<link rel="stylesheet" href="./resources/css/font.css" />
<link rel="stylesheet" href="./resources/css/home.css" />
<link rel="stylesheet" href="./resources/css/guestbook2.css" />
<%
	String owner_id = request.getParameter("id");

guestbookDAO dao = new guestbookDAO();
List<guestbookDTO> DtoList = dao.selectbookdto(owner_id);
dao.close();

memberDAO dao2 = new memberDAO();
member mem = dao2.selectidforFile2(owner_id);
dao2.close();
%>
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
							<img class="profile-image-img"
								src="./resources/img/<%=mem.getImgFile()%>" />
						</div>
						<div class="profile-text font-kyobohand">
							<div>Cyworld...ㅋ..ㅡㄹ론코...eㅣㅇ...☆</div>
							<div>---------------------</div>
							${param.id}님의 미니홈피에 오신걸 환영합니다!
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
					</div>
					<div>${param.id}님의추억상자...☆</div>
					<div class="box content-box">
						<div class="menu-wrapper">
							<div>
								<div class="box-title">그간의 여행들..</div>
								<div class="box-title">여행 사진들..</div>
								<div class="box-title">축 100 일 예린♥영권</div>
							</div>
							<div style="border: 1px solid black;">
								<div style="display: flex;" class="box-wrapper">
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
						<div>
							<c:if test="${userid != param.id}">
								<%--글쓰기 입력폼 추후 수정 필요 --%>
								<div style="border: 1px solid black;">
									<form action="guestBookServlet" method="post">
										<%-- 이게 로그인 유저 아이디 --%>
										<input type="hidden" name="writerid" value="${userid}">
										<input type="hidden" name="owner_id" value="${param.id}">
										<textarea rows="" cols="" name="content"></textarea>
										<button type="submit">글작성하기</button>
									</form>
								</div>
							</c:if>
						</div>

						<p>${userid}가..${param.id}에게..♥</p>
						<c:forEach var="i" items="<%=DtoList%>">
							<div class="book">
							<div class="half">
								<c:set var="b_noListAction" value="${i.no}" />
								<div class="half-1" > <!-- NO, userid, 홈아이콘(선택) ,created -->
									${userid}☆<img src="./resources/img/${i.imgFile}" class="writerimg">
								</div>
								<div class="half-2"> <!-- img, content (div 2개, flex, align-items-center), content margin-left 적절하게 -->
									<p>게시물번호:${i.no}</p>
									<p>작성자:${i.id}</p> 
									<p>작성내용:${i.content}</p>
									<p>글쓴날자:${i.created}</p>
								</div>
							</div>
								<div class="command">
									<form action="guestbookreplyServlet" method="post">
										${i.created}작성일자. <input type="hidden" name="b_no"
											value="${i.no}"> <input type="hidden" name="id"
											value="${i.id}"> <input type="hidden" name="owner_id"
											value="<%=owner_id%>">
										<textarea rows="" cols="" name="content"></textarea>
										<button type="submit">전송하기</button>
									</form>
								</div>
								<%
									GuestbookReplyDAO dao3 = new GuestbookReplyDAO();
								String b_no = (String) pageContext.getAttribute("b_noListAction");

								List<GuestbookReplyDTO> ReplyDTOList = dao3.selectGuestbookReply(b_no);
								%>
								<c:forEach var="b" items="<%=ReplyDTOList%>">
									<div style="border: 1px solid black;">no:${b.r_no}
										댓글내용:${b.content} 작성자id${b.id} 댓글작성날자:${b.created}</div>
								</c:forEach>
							</div>
						</c:forEach>
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
						<div class="miniroom-gif-box"></div>
					</div>
				</div>
				<div class="btn-wrapper">
					<button type="button" onclick="#" class="btn">Home</button>
					<button type="button" onclick="#" class="btn">Priofile</button>
					<button type="button" onclick="#" class="btn">Jukebox</button>
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