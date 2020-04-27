# HTTP 메서드

## GET

- GET은 캐시에 저장될 수 있음
- GET은 브라우저 기록에 남는다.
- GET은 북마크가 가능하다.
- GET은 민감한 데이터를 다루어서는 안 된다
  - ex) 검색어 등...
- GET은 길이 제한이 있다.
- GET은 오로지 데이터를 요청할 때 사용된다. (수정할 때 사용되지 않음)

  - 따라서 GET메서드를 이용하여 무엇인가 데이터가 수정되어서는 안 된다. (ex: Google Accelerator)

- GET의 요청 파라미터는 인코딩이 반드시 필요하다.
- GET은 부작용이 있는 요청에 대해서는 사용되어서는 안 된다. 왜냐하면 로봇에나 크롤러에 의해 임의로 사용될 수 있기 때문이다.
- URL 뒤에 ?key1=value1&key2=value2 형식으로 전달됨
- 파라미터의 개수는 2,000~64,000개 정도로 제한

- GET: 멱등(동일한 연산을 여러 번 수행하더라도 동일한 결과가 나타나야 함)
  - GET으로 서버에 동일한 요청을 하더라도 여전히 동일한 응답이 돌아와야 한다는 것을 의미한다.

## POST

- POST는 캐시에 저장되지 않는다.
- POST는 브라우저 기록에 남지 않는다
- POST는 북마크할 수 없음
- POST는 길이 제한이 없다
- 민감 정보
  - ex) 비밀번호, 은행 계좌정보 등...
- form data 형식으로 전달된다.
- 파라미터의 개수는 무제한

---

[HTTP Request Methods (w3schools)](https://www.w3schools.com/tags/ref_httpmethods.asp)

[What is GET and POST method in HTTP and HTTPS Protocol](https://javarevisited.blogspot.com/2012/03/get-post-method-in-http-and-https.html)

[Difference Between Get And Post](http://www.differencebetween.net/technology/internet/difference-between-get-and-post/)
