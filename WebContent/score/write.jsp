<%@ page contentType="text/html; charset=UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String msg = "";
	String error = request.getParameter("error");
	if(error!=null){
		msg = "학번 중복 등으로 자료 입력에 실패하였습니다.";
	}

%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
    <title>성적 입력</title>
    <link rel="stylesheet" href="./css/reset.css" />
    <link rel="stylesheet" href="./css/layout.css" />
    <link rel="stylesheet" href="./css/score.css" />
	<script src="./js/score_input.js"></script>
  </head>
  <body>
  	<%if(error!=null){ %>
  	<div id="global_message">
  		<%=msg %>
  	</div>
  	<%} %>
    <div id="wrap">
      <jsp:include page="./include/header.jsp" />
      <main id="content">
        <div id="main">
          <article id="main_container">
            <!-- Content영역 -->
            <div class="banner_visual">
                <h2>
                  <span>성적 관리</span>
                </h2>
                <div class="visual_text">
                  <span>누가 누가 공부를 잘하나?</span>
                </div>
                <ul class="lnb">
                  <li><a href="./list.jsp">성적 목록</a></li>
                  <li class="on"><a href="./write.jsp">성적 등록</a></li>
                </ul>
              </div>
            <div class="row">
              <form action="write_ok.jsp" name="score" onsubmit="return confirm()">
                <div class="joinbox">
                  <div class="join_form">
                    <div class="component_wrap">
                      <div class="join_item_title">
                        <h3>성적 정보 입력</h3>
                      </div>
                      <div class="join_item">
                        <strong>학번</strong> <input type="text" name="hak" />
                      </div>
                      <div class="join_item">
                        <strong>이름</strong> <input type="text" name="name" />
                      </div>
                      <div class="join_item">
                        <strong>생년월일</strong> <input type="text" name="birth" />
                        <p class="desc">YYYY-MM-DD 형식으로 입력하세요.</p>
                      </div>
                      <div class="join_item">
                        <strong>국어</strong> <input type="text" name="kor" />
                      </div>
                      <div class="join_item">
                        <strong>영어</strong> <input type="text" name="eng" />
                      </div>
                      <div class="join_item">
                        <strong>수학</strong> <input type="text" name="mat" />
                      </div>
                    </div>
                    <div class="join_item_title submit">
                      <button type="submit" name="btn" class="row_button navy_button">
                       등록하기
                      </button>
                      <button type="reset" name="btn" class="row_button white_button">
                        다시입력
                      </button>
                      <button
                        type="button"
                        name="btn"
                        class="row_button white_button"
                        onclick="javascript:location.href='list.jsp'"
                      >
                        등록취소
                      </button>
                    </div>
                  </div>
                </div>
              </form>
            </div>
            <!-- Content 영역 끝 -->
          </article>
        </div>
      </main>
      <jsp:include page="./include/footer.jsp"></jsp:include>
    </div>
  </body>
</html>

<!-- 
	write.jsp => action: write_ok.jsp
	디자인은 알아서...
	학번 [hak]
	이름 [name]
	생년월일 [birth]
	국어 [kor]
	영어 [eng]
	수학 [mat]
	[등록하기] [다시입력] [등록취소] <= 버튼만 만들기
 -->
