<%@page import="com.util.MyCustomUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.guest.GuestDTO"%>
<%@page import="com.guest.GuestDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	GuestDAO dao = new GuestDAO();
	
    MyCustomUtil myCustomUtil = new MyCustomUtil();
    String listUrl = cp + "/" + GuestDAO.FOLDER + "/" + GuestDAO.PAGE_GUEST;
    String pageNum = request.getParameter("page");
    int current_page = 1;
    if(pageNum != null){
    	current_page = Integer.parseInt(pageNum);
    }
	int rows= 10;
	int dataCount = dao.dataCount();
	int total_page= myCustomUtil.pageCount(rows, dataCount);
	String cn = listUrl.indexOf("?") >= 0 ? "&amp;" : "?";
	int[] pages = myCustomUtil.paging(current_page, total_page, listUrl);
	
	int start = (current_page-1)*rows+1;
	int end = current_page * rows;
	List<GuestDTO> list = dao.listGuest(start, end);
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>방명록</title>
    <link rel="icon" href="data:;base64,iVBORw0KGgo=" />
  </head>
  <body>
    <div id="wrap">
      <header>
        <div id="header_inner"></div>
      </header>
      <main>
        <article id="main">
          <div id="content">
            <div class="row">
              <div class="row_title">
                <h2>방명록</h2>
              </div>
              <div class="row_content">
                <form name="writeForm" action="guest_ok.jsp">
                  <table class="write-content">
                    <tr>
                      <td class="col_title">작성자</td>
                      <td class="col_content">
                        <input type="text" name="name" />
                      </td>
                    </tr>
                    <tr>
                      <td class="col_title">내&nbsp;&nbsp;용</td>
                      <td class="col_content">
                        <textarea name="content" id="content"></textarea>
                      </td>
                    </tr>
                  </table>
                  <div>
                    <ul>
                      <li>
                        <div><button type="submit">등록</button></div>
                      </li>
                      <li>
                        <div><button type="reset">다시 입력</button></div>
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
	                <% for(GuestDTO dto: list) {%>
	                  <li>
	                    <div class="book">
	                      <div class="book_title">
	                        <span class="name"><%=dto.getName() %></span>
	                        <span class="control"
	                          ><%=dto.getCreated() %>|
	                          <a href="<%=dto.getNum()%>">삭제</a></span
	                        >
	                      </div>
	                      <div class="book_content">
	                        <%=dto.getContent() %>
	                      </div>
	                    </div>
	                  </li>
	                <% } %>
                </ul>
                <div class="paging">
                  <ul>
                    <li>이전</li>
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>
                    <li>4</li>
                    <li>5</li>
                    <li>다음</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </article>
      </main>
    </div>
  </body>
</html>
