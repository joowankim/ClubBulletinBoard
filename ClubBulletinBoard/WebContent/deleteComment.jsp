<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="comment.Comment" %>
<%@ page import="comment.CommentDAO" %>
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
			int posterID = 0;
			if (request.getParameter("posterID") != null) {
				posterID = Integer.parseInt(request.getParameter("posterID"));
			}
			int commentID = 0;
			if (request.getParameter("commentID") != null) {
				commentID = Integer.parseInt(request.getParameter("commentID"));
			}
			if (commentID == 0) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 댓글입니다')");
				script.println("history.back()");
				script.println("</script>");
			}
			if (sessionID == null) {
				PrintWriter  script = response.getWriter();
				script.println("<script>");
				script.println("alert('권한이 없습니다')");
				script.println("location.href = './LoginPage.jsp'");
				script.println("</script>");
			} else {
				
				CommentDAO commentDAO = new CommentDAO();
				// delete 쿼리 수행
				int result = commentDAO.deleteComment(commentID, posterID);
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('fail')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter  script = response.getWriter();
					script.println("<script>");
					script.println("location.href = location.href ='./DetailPage.jsp?posterID="+posterID+"'");
					script.println("</script>");
				}
	
			}
		
	%>
</body>
</html>