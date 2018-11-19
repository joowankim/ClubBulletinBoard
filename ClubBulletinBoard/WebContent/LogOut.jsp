<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session.invalidate();
	%>	<!-- 세션에 저장된 값 모두 한번에 삭제, 세션 연결이 끊어짐 -->
	
	<script>
	alert("로그 아웃 되었습니다");
	location.href="./IndexPage.jsp";	//"IndexPage.jsp" 페이지로 링크, 이동
	</script>
</body>
</html>