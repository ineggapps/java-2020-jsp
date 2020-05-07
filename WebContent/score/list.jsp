<%@page import="com.score.ScoreDTO"%> <%@page import="java.util.List"%> <%@page
import="com.score.ScoreDAO"%> <%@ page contentType="text/html; charset=UTF-8"%> <%@ page
trimDirectiveWhitespaces="true"%> <% request.setCharacterEncoding("UTF-8"); ScoreDAO dao = new
ScoreDAO(); List<ScoreDTO>
  list = dao.listScore(); %>
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
              <form method="post" name="listForm">
                <!-- Content영역 -->
                <div class="banner_visual">
                  <h2>
                    <span>성적 관리</span>
                  </h2>
                  <div class="visual_text">
                    <span>누가 누가 공부를 잘하나?</span>
                  </div>
                  <ul class="lnb">
                    <li class="on"><a href="./list.jsp">성적 목록</a></li>
                    <li><a href="./write.jsp">성적 등록</a></li>
                  </ul>
                </div>
                <div class="row">
                  <div class="row_title">
                    <h3><strong class="strong">성적 목록</strong> 조회하기</h3>
                  </div>
                  <div class="row_buttons">
                    <input class="delete_button" type="button" value="삭제" class="btn" />
                    <input
                      class="enroll_button"
                      type="button"
                      value="  등록하기  "
                      class="btn"
                      onclick="javascript:location.href='write.jsp'"
                    />
                  </div>
                </div>
                <div class="row">
                  <table id="card_history">
                    <thead>
                      <tr>
                        <td calss="col_check">
                          <input type="checkbox" name="chkAll" value="all" />
                        </td>
                        <td class="col_hak">학번</td>
                        <td class="col_name">이름</td>
                        <td class="col_birth">생년월일</td>
                        <td class="col_kor">국어</td>
                        <td class="col_eng">영어</td>
                        <td class="col_mat">수학</td>
                        <td class="col_tot">총점</td>
                        <td class="col_ave">평균</td>
                        <td class="col_rank">석차</td>
                        <td class="col_control">수정</td>
                      </tr>
                    </thead>
                    <tbody>
                      <%for(ScoreDTO dto: list){ %>
                      <tr>
                        <td><input type="checkbox" name="haks" value="<%=dto.getHak()%>" /></td>
                        <td><%=dto.getHak()%></td>
                        <td><%=dto.getName()%></td>
                        <td><%=dto.getBirth()%></td>
                        <td><%=dto.getKor()%></td>
                        <td><%=dto.getEng()%></td>
                        <td><%=dto.getMat()%></td> 
                        <td><%=dto.getTot()%></td>
                        <td><%=dto.getAve()%></td>
                        <td><%=dto.getRank()%></td>
                        <td>
                          <input type="button" value="수정" class="btn" />
                          <input type="button" value="삭제" class="btn" />
                        </td>
                      </tr>
                      <%} %>
                    </tbody>
                  </table>
                </div>
              </form>
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
</ScoreDTO>
