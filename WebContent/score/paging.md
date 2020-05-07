# 페이징

## 페이징 처리

### 한 페이지 출력 데이터 수: 10개

### 전체 데이터 수: 965개

## 총 페이지 수

- 96페이지(10건씩)+ 1페이지(남은 5건) = 97페이지
- 공식: 전체 데이터 수 ÷ 출력할 데이터 수

```java
    if(전체 데이터 수 % 출력할 데이터 수 != 0 ){
        총 페이지 수 =  총 페이지 수 + 1;
    }
```

```java
    /**
	 * 페이지 수 구하기
	 * @param rows 한 화면에 표시할 데이터 개수
	 * @param dataCount 전체 데이터 수
	 * @return 페이지 수
	 */
	public int pageCount(int rows, int dataCount) {
		if (dataCount <= 0) {
			return 0;
		}
		return dataCount / rows + (dataCount % rows > 0 ? 1 : 0);
	}
```

## 예시

- 1페이지: 게시글1~10번째의 데이터 조회
- 2페이지: 게시글11~20번째의 데이터 조회
- 3페이지: 게시글21~30번째의 데이터 조회

### Oracle 11g

- 시작: (페이지-1)\*10+1
- 끝: 페이지\*10

```sql
--SELECT 실행순서 복습
--1. FROM
--2. WHERE
--)))))))))) GROUP BY, HAVING
--3. SELECT
--4. ORDER BY
--★★★★★★★★★★★★★★★★★★ 암기해야 할 쿼리문
select * from(
    select rownum rnum, tb.* from ( -- tb라는 별칭을 이용하지 않으려면 name, city, sal을 기재하면 된다.
        select name, city, sal
        from emp
        order by sal desc
    ) tb where rownum <=10 --일단 1~10개의 데이터까지는 추출한다.
    --실행 순서에 의해 여기서는 rownum의 별칭을 사용하면 안 된다. (복습)
) where rnum>=6; -- 범위를 지정하여 필요 없는 부분인 1~5번째는 잘라낸다.
-- ▶ ROWNUM사용 시 주의사항
-- 1.절대로 order by절이 있으면 rownum을 사용하면 의도하지 않은 숫자이므로 사용해서는 안 된다.
-- 2.where절에서  rownum보다 크다로 (rownum > 1) 비교하지 않는다.

--Oracle은 페이징처리를 공식적으로 지원하지 않아서(11g) 성능이 다소 떨어진다.
```

### Oracle 12c이상

- offset: (페이지-1)\*10개

## 페이징 예시 (HTML)

[페이징 예]
<이전><다음>은 10페이지 앞/뒤로 이동

- 1 2 3 4 5 6 7 8 9 10 [다음] 97 ⚡a태그 12-1=11개 (현재 페이지는 제외)
- 1 [이전] 31 32 33(현재) 34 35 36 37 38 39 40 [다음] 97 ⚡ a태그 14-1=13개 (현재 페이지는 제외)
- 1 [이전] 91 92 93 94 95 96 97 ⚡

[페이징 a태그]

- 일반 목록 조회
  <a href="목록.jsp?page=3">3</a>
- 검색할 때
  <a href="목록.jsp?condition=subject&keyword=java&page=3">3</a>
  condition(검색옵션), keyword(검색어), page(페이지)

## 페이징 예시 (JAVA Paging 클래스)

- currentPageSetup: 표시할 첫 페이지-1

- current_page: 3 🚀 표시할 페이지: 1 2 3 4 5 6 7 8 9 10 [다음][끝]
  - currentPageSetup = 0
- current_page: 47 🚀 표시할 페이지: [처음][이전] 41 42 43 44 45 46 47 48 49 50 [다음][끝]
  - currentPageSetup = 40
- current_page: 60 🚀 표시할 페이지: [처음][이전] 51 52 53 54 55 56 57 58 59 60 [다음][끝]
  - currentPageSetup = 50
- current_page: 93 🚀 표시할 페이지: [처음][이전] 91 92 93 94 95 96 97
  - currentPageSetup = 90

## 예제

1. [ ] MyUtil 클래스 분석
2. [ ] 페이징
3. [ ] 성적처리 선택하여 삭제
