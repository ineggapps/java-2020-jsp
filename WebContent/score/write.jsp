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
      <header id="header">
        <div id="header_container">
          <div class="header_row">
            <!-- <ul id="right_side">
              <li><a href="./login.html">로그인</a></li> 
              <li><a href="./join.html">회원가입</a></li>
            </ul> -->
          </div>
          <div id="gnb_area">
            <h1 id="logo"><a href="./index.html">성적관리시스템</a></h1>
            <ul id="gnb">
              <li class="main_menu">
                <a href="./teamenu.html"><span>성적 관리</span></a>
                <ul class="sub_gnb">
                  <li class="sub_menu"><a href="./teamenu.html">성적 등록</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </header>
      <main id="content">
        <div id="main">
          <article id="main_container">
            <!-- Content영역 -->
            <div class="banner_visual join">
              <div class="row join">
                <h2><span>성적 등록</span></h2>
                <p class="welcome"><span>Input your score!</span></p>
                <p><span>성적 정보 처리를 위한 기초정보를 입력하세요.</span></p>
              </div>
            </div>
            <div class="row">
              <form action="#">
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
                        가입하기
                      </button>
                      <button type="submit" name="btn" class="row_button white_button">
                        다시입력
                      </button>
                      <button type="submit" name="btn" class="row_button white_button">
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
      <footer id="footer">
        <div class="bottom_util">
          <ul id="fnb">
            <li><a href="#" class="active">이의제기</a></li>
            <li><a href="#">성적정보 처리방침</a></li>
          </ul>
        </div>
        <div class="bottom_logo_container"><span class="bottom_logo">성적관리시스템</span></div>
        <p class="copyright">&copy; 2020 성적관리시스템 Corp. ALL RIGHTS RESERVED.</p>
      </footer>
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
