<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");
	//방명록 입력 데이터 처리하기
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd hh:mm:ss");
	String date = sdf.format(new Date());
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="icon" href="data:;base64,iVBORw0KGgo=" />
    <style type="text/css">
      #wrap {
        width: 600px;
        margin: 0 auto;
      }
      
      a {
      	color:inherit;
      	text-decoration:none;
      }

      .input,
      .list { 
	    width:100%;
        border: 2px solid skyblue;
        border-radius: 5px;
        padding:20px 2%;
      }
      
      table{
      	border-spacing: 0;
		border-collapse: collapse;
      }
      
      .input table, .list table{
      	width:100%;
      }

      input,textarea {
        border: 1px solid #d9d9d9;
        border-radius: 5px;
      }

      input:focus,
      button:focus {
        outline: none;
      }
      
      .input{
      	width:100%;
      	margin-bottom:30px;
      }
      
      .form{
      	width:100%;
      	margin:0 auto;
		border-top:1px solid #ccc;
      }
      
      .form .title{
      	background-color:#eee;
      	text-align:center;
      	font-weight:bold;
      }
      
      .form tr{
      	border-bottom:1px solid #ccc;
      }
      
      .form td{
      	padding:10px; 
      }
      
      .form input[type=text]{
      	height:15px;
      	padding:5px;
      }
      
      .form textarea{
		width:98%;
      	height:50px;
      	margin:0 auto;
      }

      .list table tr {
        width: 100%;
      }
      
      tr.header{
      	background-color:#eee;
      	border:1px solid #ccc;
      } 
      
      tr.header td{
      	padding:1%;
      }

      td.name {
        width: 50%;
        font-weight:bold;
      }

      td.date {
        width: 50%;
        text-align: right;
        font-size:0.9rem;
      }
      
      tr.content td{
      	padding-top:10px;
      }
    </style>
    <script>
      function reset() {
        //다시 입력
      }  
      function check() {
        const f = document.visitorForm;

        if (!f.name.value.trim()) {
          alert("이름을 입력하세요");
          f.name.focus();
          return false;
        }

        if (!f.content.value.trim()) {
          alert("내용을 입력하세요");
          f.content.focus();
          return false;
        }

        return true;
      }
    </script>
  </head>
  <body>
    <div id="wrap">
      <h1>방명록</h1>
      <div class="input">      
	      <form method="POST" action="guest.jsp" onsubmit="return check()" name="visitorForm">
	        <table class="form">
	          <tr>
	            <td class="title">작성자</td>
	            <td><input type="text" name="name" /></td>
	          </tr>
	          <tr>
	            <td class="title">내&nbsp;&nbsp;용</td>
	            <td><textarea name="content" cols="30" rows="10"></textarea></td>
	          </tr>
	          <tr>
	            <td colspan="2">
	              <button type="submit">등록하기</button>
	              <button type="button" onclick="reset()">다시 입력</button>
	            </td>
	          </tr>
	        </table>
	      </form>
      <% if(name != null && content != null){ %>
      </div>
      <div class="list">
        <table>
          <tr class="header">
            <td class="name"><%=name %></td>
            <td class="date"><%=date %> | <a href="./guest.jsp">삭제</a></td>
          </tr>
          <tr class="content">
            <td colspan="2"><%=content %></td>
          </tr>
        </table>
      </div>
      <% } %>
    </div>
  </body>
</html>
