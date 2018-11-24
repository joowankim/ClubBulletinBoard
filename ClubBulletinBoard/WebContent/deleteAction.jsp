<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="poster.Poster" %>
<%@ page import="poster.PosterDAO" %>
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
			if (posterID == 0) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 포스터입니다')");
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
				
				PosterDAO posterDAO = new PosterDAO();
				Poster poster = posterDAO.getPoster(posterID);
				
				// delete 쿼리 수행
				int result = posterDAO.delete(posterID);
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('fail')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter  script = response.getWriter();
					script.println("<script>");
					script.println("location.href = './PosterPage.jsp?clubCategory=" + poster.getClubCategory() +"'");
					script.println("</script>");
				}
	
			}
		
	%>
</body>
</html>