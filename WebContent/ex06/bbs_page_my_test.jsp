<%@page import="com.util.MyPage"%>
<%@page import="com.util.MyUtil"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");
	MyPage myPage = new MyPage();
	String pageNum = request.getParameter("page");
	int current_page = 1;
	if (pageNum != null) {
		current_page = Integer.parseInt(pageNum);
	}
	int dataCount = 1078;
	int rows = 10;
	int total_page = myPage.pageCount(rows, dataCount);
	String listUrl = "bbs_page_my_test.jsp";
	String cn = listUrl.indexOf("?") >= 0 ? "&amp;" : "?";
	int[] pages = myPage.paging(current_page, total_page, listUrl);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
<style type="text/css">
* {
	padding: 0;
	margin: 0;
}

ul, li {
	list-style-type: none;
	padding: 0 none;
}

body {
	font-size: 14px;
	font-family: "맑은 고딕", "돋움", sans-serif;
}

a {
	text-decoration: none;
	color: #000;
}

a:hover, a:active {
	text-decoration: underline;
	color: tomato;
}

li {
	display: inline-block;
	padding: 0 5px;
}

span.on{
	font-weight:bold;
	color:tomato;
}
</style>
</head>
<body>
	<div style="margin: 30px auto; width: 700px;">
		<h3>게시판</h3>
		<table style="width: 100%; margin-top: 10px;">
			<tr height="30" align="center">
				<td>총 페이지 수: <%=total_page%>, 현재 페이지: <%=current_page%></td>
			</tr>
			<tr height="30" align="center">
				<td>
					<ul>
						<%
							if(pages[0]>1){%>
								<li><a href="<%=listUrl%><%=cn%>page=1">처음</a></li>
						<%}
						%>
						<%
							if(pages[0]>2){%>
								<li><a href="<%=listUrl%><%=cn%>page=<%=pages[0]-1%>">이전</a></li>
						<%	}%>						
						<%
							for (int i = 0; i < pages.length; i++) {
							if (current_page == pages[i]) {
						%>
							<li><span class="on"><%=pages[i]%></span></li>
						<%
							} else {
						%>
							<li><a href="<%=listUrl%><%=cn%>page=<%=pages[i]%>"><%=pages[i]%></a></li>
						<%  
							}
						}
						%>
						<%
							if(current_page+1<pages[pages.length-1]){%>
								<li><a href="<%=listUrl%><%=cn%>page=<%=pages[pages.length-1]+1%>">다음</a></li>
						<%	}
						%>
						<%
							if(pages[pages.length-1]<total_page){%>
								<li><a href="<%=listUrl%><%=cn%>page=<%=total_page%>">끝</a></li>
						<%}%>
					</ul>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
