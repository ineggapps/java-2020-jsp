<%@page import="com.util.MyCustomUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.guest.GuestDTO"%>
<%@page import="com.guest.GuestDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	GuestDAO dao = new GuestDAO();
	
	MyCustomUtil myCustomUtil = new MyCustomUtil();
	String listUrl = cp + "/" + GuestDAO.FOLDER + "/" + GuestDAO.PAGE_GUEST;
	String pageNum = request.getParameter("page");
	int rows = 10;
	int dataCount = dao.dataCount();
	int total_page = myCustomUtil.pageCount(rows, dataCount);
	int current_page = 1;
	if (pageNum != null) {
		current_page = Integer.parseInt(pageNum);
	}
	if(current_page>total_page){
		current_page = total_page;
	}
	int[] pages = myCustomUtil.paging(current_page, total_page, listUrl);
	
	int start = (current_page - 1) * rows + 1;
	int end = current_page * rows;
	List<GuestDTO> list = dao.listGuest(start, end);
	String cn = listUrl.indexOf("?") >= 0 ? "&amp;" : "?";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>방명록</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
<link rel="stylesheet" href="./css/reset.css" />
<link rel="stylesheet" href="./css/layout.css" />
</head>
<body>
	<div id="wrap">
		<header>
			<div id="header_inner">
				<h1>
					<img src="./images/logo.png" class="logo" alt="logo" />방명록
				</h1>
			</div>
		</header>
		<main>
			<article id="main">
				<div id="content">
					<div id="content_inner">
						<div class="row">
							<div class="row_content">
								<form name="writeForm" action="guest_ok.jsp">
									<table class="writeForm">
										<tr>
											<td class="col_title">작성자</td>
											<td class="col_content"><input type="text" name="name" />
											</td>
										</tr>
										<tr>
											<td class="col_title">내&nbsp;&nbsp;용</td>
											<td class="col_content"><textarea name="content"></textarea>
											</td>
										</tr>
									</table>
									<div>
										<ul class="buttons">
											<li>
												<div>
													<button type="submit" class="btn submit">등록</button>
												</div>
											</li>
											<li>
												<div>
													<button type="reset" class="btn reset">다시 입력</button>
												</div>
											</li>
										</ul>
									</div>
								</form>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="row_content">
								<ul class="books">
									<%
										for (GuestDTO dto : list) {
									%>
									<li>
										<div class="book">
											<div class="book_title">
												<img src="https://res.cloudinary.com/eightcruz/image/facebook/c_lfill,h_44,w_44/2642920005821009" alt="profile" class="profile"/>
												<ul>
													<li class="name"><span ><%=dto.getName()%></span></li>
													<li class="control"><span
													><%=dto.getCreated()%>
													<a href="<%=dto.getNum()%>" class="delete">삭제</a></span></li>
												</ul>
											</div>
											<div class="book_content">
												<%=dto.getContent()%>
											</div>
										</div>
									</li>
									<%
										}
									%>
								</ul>
								<div>
									<%--paging --%>
									<%
										if (dataCount > 0) {
									%>
									<ul class="paging">
										<%
											if (pages[0] > 1) {
										%>
										<li><a href="<%=listUrl%><%=cn%>page=1">처음</a></li>
										<%
											}
										%>
										<%
											if (pages[0] > 2) {
										%>
										<li><a href="<%=listUrl%><%=cn%>page=<%=pages[0] - 1%>">이전</a></li>
										<%
											}
										%>
										<%
											for (int i = 0; i < pages.length; i++) {
											if (current_page == pages[i]) {
										%>
										<li class="on"><span><%=pages[i]%></span></li>
										<%
											} else {
										%>
										<li><a href="<%=listUrl%><%=cn%>page=<%=pages[i]%>"><%=pages[i]%></a></li>
										<%
											}
										}
										%>
										<%
											if (current_page + 1 < pages[pages.length - 1]) {
										%>
										<li><a
											href="<%=listUrl%><%=cn%>page=<%=pages[pages.length - 1] + 1%>">다음</a></li>
										<%
											}
										%>
										<%
											if (pages[pages.length - 1] < total_page) {
										%>
										<li><a href="<%=listUrl%><%=cn%>page=<%=total_page%>">끝</a></li>
										<%
											}
										%>
									</ul>
									<%
										} else {
									%>
									등록된 게시물이 없습니다.
									<%
										}
									%>
								</div>
							</div>
						</div>
					</div>
				</div>

			</article>
		</main>
	</div>
</body>
</html>
