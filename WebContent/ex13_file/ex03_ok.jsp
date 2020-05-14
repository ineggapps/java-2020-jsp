<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");

	//localhost:9090/context명의 실제 물리 경로
	String root = pageContext.getServletContext().getRealPath("/");
	//이클립스가 웹 서버를 구축한 경로
	//D:\중략\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\java-2020-jsp\
	//파일처리는 웹 주소를 사용할 수 없고 물리주소로만 가능하기 때문에...
	String pathname = root + "uploads" + File.separator  + "pds";
	File f = new File(pathname);
	if(!f.exists()){//폴더가 없을 경우 폴더 생성
		f.mkdirs();
	}
	
	//🙄 enctype="multipart/form-data"로 넘어온 데이터는 request.getParameter()로 넘겨받지 못한다.
	String encType = "utf-8";
	int max = 5*1024*1024; //최대 업로드 용량을 5MB로 설정(톰캣 기본설정도 5MB). 
	
	MultipartRequest mreq = null;
	//request객체, 파일 저장 경로, 최대 수용 용량, form 파라미터 인코딩 방식, 동일파일명 보호여부(null: 덮어쓰기)
	mreq = new MultipartRequest(request, pathname, max, encType, new DefaultFileRenamePolicy());
	//동일한 파일이 업로드되면 파일명1.확장자 => 파일명2.확장자 이런 방식으로 저장된다.
	
	String name = mreq.getParameter("name");//MultipartRequest의 getParameter의 메서드
	String subject = mreq.getParameter("subject"); 
	//클라이언트에서 업로드한 실제 파일의 이름
	String originalFilename = mreq.getOriginalFileName("upload");
	//서버에 저장되는 파일의 이름
	String saveFilename = mreq.getFilesystemName("upload");
	long fileSize = 0;
	if(mreq.getFile("upload")!=null){//파일이 null이 아닌 경우를 체크해야 함
		fileSize = mreq.getFile("upload").length(); //파일의 크기 구하기
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>
	<p>name: <%=name %></p>
	<p>subject: <%=subject%></p>
	<p>originalFilename: <%=originalFilename%></p>
	<p>saveFilename: <%=saveFilename%></p>
	<p>fileSize: <%=fileSize%> byte(s)</p>
	
	<p><a href="down.jsp?file1=<%=saveFilename%>&amp;file2=<%=originalFilename%>">다운로드</a></p>
</body>
</html>