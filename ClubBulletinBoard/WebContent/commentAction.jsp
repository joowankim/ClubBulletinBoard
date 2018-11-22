<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="comment.Comment" %>
<%@ page import="comment.CommentDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="comment" class="comment.Comment" scope="page"/>
<jsp:setProperty name="comment" property="contents"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	
	String sessionID = null;
	
	if (session.getAttribute("sessionID") != null) {
		sessionID = (String) session.getAttribute("sessionID");
	}
	if (sessionID == null) {
		PrintWriter  script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다')");
		script.println("location.href = './LoginPage.jsp'");
		script.println("</script>");
	} else {
		if (comment.getContents() != null) {
			int posterID = Integer.parseInt(request.getParameter("posterID"));
			int userID = Integer.parseInt(sessionID);
			CommentDAO commentDAO = new CommentDAO();
			// update 쿼리 수행
			int result = commentDAO.updateComment(posterID, userID, comment.getContents());
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('fail')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter  script = response.getWriter();
				script.println("<script>");
				script.println("location.href ='./DetailPage.jsp?posterID="+posterID+"'");
				script.println("</script>");
			}
		} else {
			PrintWriter  script = response.getWriter();
			script.println("<script>");
			script.println("alert('내용을 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
		}
	}
	%>
</body>
</html>