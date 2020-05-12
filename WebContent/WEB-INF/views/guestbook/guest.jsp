
<%@page import="com.util.MyCustomUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.guest.GuestDTO"%>
<%@page import="com.guest.GuestDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>방명록</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
<link rel="stylesheet" href="<%=cp %>/guestbook/css/reset.css" />
<link rel="stylesheet" href="<%=cp %>/guestbook/css/layout.css" />
<script>
	function del(num){
		var url="${deleteUrl}${delCn}num="+num;
		if(confirm("덧글을 삭제하시겠습니까?")){			
			location.href = url; 
		}
	}
</script>
</head>
<body>
	<div id="wrap">
		<header>
			<div id="header_inner">
				<h1>
					<img src="<%=cp %>/guestbook/images/logo.png" class="logo" alt="logo" />방명록
				</h1>
			</div>
		</header>
		<main>
			<article id="main">
				<div id="content">
					<div id="content_inner">
						<div class="row">
							<div class="row_content">
								<form name="writeForm"
									action="${pageContext.request.contextPath}/guest/guest_ok.do"
									method="post">
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
									<!-- 반복되는 게시물 부분 -->
									<c:forEach var="dao" items="${list}">
									<li>
										<div class="book">
											<div class="book_title">
												<img
													src="https://res.cloudinary.com/eightcruz/image/facebook/c_lfill,h_44,w_44/2642920005821009"
													alt="profile" class="profile" />
												<ul>
													<li class="name"><span>${dao.name}</span></li>
													<li class="control"><span>${dao.created} <a href="#"
															onclick="del(${dao.num})" class="delete">삭제</a>
													</span></li>
												</ul>
											</div>
											<div class="book_content">${dao.content}</div>
										</div>
									</li>
									</c:forEach>
									<!-- 반복 끝 -->
								</ul>
								<div> 
									<!-- 페이징해야 하는 경우 -->
									<c:if test="${dataCount>0}">
									<ul class="paging">
										<c:if test="${pages[0]>1}">
											<li><a href="${listUrl}${cn}page=1">처음</a></li>
										</c:if>
										<c:if test="${pages[0]>2}">
											<li><a href="${listUrl}${cn}page=${pages[0] - 1}">이전</a></li>
										</c:if>
										<c:forEach var="i" begin="0" end="${fn:length(pages)-1}">
											<li${pages[i]==current_page?" class=\"on\"":""}><a href="${listUrl}${cn}page=${pages[i]}">${pages[i]}</a></li>
										</c:forEach>
										<c:if test="${current_page + 1 < pages[fn:length(pages)- 1]}">
											<li><a
											href="${listUrl}${cn}page=${pages[fn:length(pages)- 1] + 1}">다음</a></li>
										</c:if>
										<c:if test="${pages[fn:length(pages) - 1] < total_page}">
											<li><a href="${listUrl}${cn}page=${total_page}">끝</a></li>
										</c:if>
									</ul>
									</c:if>
									<c:if test="${dataCount==0}">
										<!-- 데이터가 없는 경우 -->
										<p class="alert">등록된 게시물이 없습니다.</p>
									</c:if>
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
