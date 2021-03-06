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
  if (score < 0 || score > 100) {
    alert("점수는 1~100점까지만 입력 가능합니다.");
    return false;
  }
  return true;
}
