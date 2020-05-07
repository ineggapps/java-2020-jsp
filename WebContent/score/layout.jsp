<%@ page contentType="text/html; charset=UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
    <title>성적 입력</title>
    <link rel="stylesheet" href="./css/reset.css" />
    <link rel="stylesheet" href="./css/layout.css" />
    <link rel="stylesheet" href="./css/score.css" />
  </head>
  <body>
    <div id="wrap">
      <jsp:include page="./include/header.jsp" />
      <main id="content">
        <div id="main">
          <article id="main_container">
            <!-- Content영역 -->
            
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
