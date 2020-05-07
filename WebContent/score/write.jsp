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
    <script>
      if (typeof String.prototype.trim !== "function") {
        String.prototype.trim = function () { 
          var TRIM_PATTERN = /(^\s*)|(\s*$)/g;
          return this.replace(TRIM_PATTERN, "");
        };
      }

      function confirm() {
        const f = document.score;

        f.hak.value = f.hak.value.trim();
        f.name.value = f.name.value.trim();
        f.birth.value = f.birth.value.trim();
        f.kor.value = f.kor.value.trim();
        f.eng.value = f.eng.value.trim();
        f.mat.value = f.mat.value.trim();

        //학번 입력 검사
        if (!isValidHak(f.hak.value)) {
          f.hak.focus();
          return false;
        }
        //이름 입력 검사
        if (!isValidName(f.name.value)) {
          f.name.focus();
          return false;
        }
        //생년월일 입력 검사
        if (!isValidDateFormat(f.birth.value)) {
          alert("날짜 형식에 맞게 입력해 주세요");
          f.birth.focus();
          return false;
        }
        //국어, 영어, 수학 점수 입력 검사
        if (!isValidScore(f.kor.value)) {
          f.kor.focus();
          return false;
        }
        if (!isValidScore(f.eng.value)) {
          f.eng.focus();
          return false;
        }
        if (!isValidScore(f.mat.value)) {
          f.mat.focus();
          return false;
        }
        return true;
      }
      function isValidHak(hak) {
        if (!hak) {
          alert("학번을 입력해 주세요");
          return false;
        }
        return true;
      }

      function isValidName(name) {
        if (!name) {
          alert("이름을 입력해 주세요");
          return false;
        }
        if (!/^[\uac00-\ud7a3]*$/g.test(name)) {
          alert("이름은 한글만 입력이 가능합니다.");
          return false;
        }
        return true;
      }

      function isValidDateFormat(data) {
        var regexp = /[12][0-9]{3}[\.|\-|\/]?[0-9]{2}[\.|\-|\/]?[0-9]{2}/;
        if (!regexp.test(data)) return false;

        regexp = /(\.)|(\-)|(\/)/g;
        data = data.replace(regexp, "");

        var y = parseInt(data.substr(0, 4));
        var m = parseInt(data.substr(4, 2));
        if (m < 1 || m > 12) return false;
        var d = parseInt(data.substr(6));
        var lastDay = new Date(y, m, 0).getDate();
        if (d < 1 || d > lastDay) return false;
        return true;
      }

      function isValidScore(score) {
        if (!score) {
          alert("점수를 입력해 주세요");
          return false;
        }
        if (!/^[0-9]{1,3}$/.test(score)) {
          alert("점수를 올바르게 입력해 주세요.");
          return false;
        }
        if (score < 1 || score > 100) {
          alert("점수는 1~100점까지만 입력 가능합니다.");
          return false;
        }
        return true;
      }
    </script>
  </head>
  <body>
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
                  <li class="on"><a href="./list.jsp">성적 목록</a></li>
                  <li><a href="./write.jsp">성적 등록</a></li>
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
                        가입하기
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
