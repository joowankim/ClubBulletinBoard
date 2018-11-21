<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poster.PosterDAO" %>
<%@ page import="poster.Poster" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.io.File" %>

<% request.setCharacterEncoding("UTF-8"); %>

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
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요한 서비스입니다')");
		script.println("location.href = './LoginPage.jsp'");
		script.println("</script>");
	} else {
	
		// 파일이 저장될 서버의 경로. 되도록이면 getRealPath를 이용		
		String savePath = request.getServletContext().getRealPath("./image/poster");
		
		// 파일 크기 15MB로 제한
		int sizeLimit = 1024 * 1024 * 15;
		
		// request 객체 = (저장될 서버 경로, 파일 최대 크기, 인코딩 방식, 같은 이름의 파일명 방지처리)
		// 아래와 같이 MultipartRequest를 생성만 해주면 파일이 업로드 된다 (파일 자체의 업로드 완료)
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		
		// MultipartRequest로 전송받은 데이터를 불러온다
		// enctype을 "multi/form-data"로 선언하고 submit한 데이터들은 request 객체가 아닌 MultipartRequest 객체로 불러와야 한다
		String clubName = multi.getParameter("clubName");
		String clubCategory = multi.getParameter("clubCategory");
		int numOfRecruiting = Integer.parseInt(multi.getParameter("numOfRecruiting"));
		String homepageLink = multi.getParameter("homepageLink");
		String preferCondition = multi.getParameter("preferCondition");
		String activityField = multi.getParameter("activityField");
		String intro = multi.getParameter("intro");
		
		// 전송받은 데이터가 파일일 경우 getFilesystemName()으로 파일 이름을 받아올 수 있다
		String fileName = multi.getFilesystemName("posterImg");
		
		// 업로드한 파일의 전체 경로를 DB에 저장하기 위해서
		String fileFullPath = savePath + "/" + fileName;
		
		// 데이터들을 담을 그릇인 DTO(혹은 Bean) 객체를 생성 후, 데이터들을 set해준다
		Poster poster = new Poster();
		
		poster.setClubName(clubName);
		poster.setClubCategory(clubCategory);
		poster.setNumOfRecruiting(numOfRecruiting);
		poster.setHomepageLink(homepageLink);
		poster.setPreferCondition(preferCondition);
		poster.setActivityField(activityField);
		poster.setIntro(intro);
		poster.setPosterImg(fileFullPath);
		
		// posterDAO 객체 생성
		PosterDAO posterDAO = new PosterDAO();
		
		// insert 쿼리 수행
		int result = posterDAO.register(sessionID, poster.getClubName(), 
				poster.getClubCategory(), 
				poster.getNumOfRecruiting(), 
				poster.getHomepageLink(), 
				poster.getPreferCondition(), 
				poster.getActivityField(), 
				poster.getIntro(),
				poster.getPosterImg());
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('포스터 등록을 실패했습니다')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter  script = response.getWriter();
			script.println("<script>");
			script.println("location.href = './IndexPage.jsp'");
			script.println("</script>");
		}
	}
	
	%>
	
</body>
</html>