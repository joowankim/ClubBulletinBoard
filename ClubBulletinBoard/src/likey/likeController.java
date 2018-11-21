package likey;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

/**
 * Servlet implementation class likeController
 */
@WebServlet("/likeController")
public class likeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public likeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		HttpSession session = request.getSession();
		
		String param = (String) request.getParameter("ids");
		String sessionID = (String) session.getAttribute("sessionID");
		
		int posterID = Integer.parseInt(param);
		int userID = Integer.parseInt(sessionID);
			
		LikeyDAO likeyDAO = new LikeyDAO();

		JSONObject obj = new JSONObject();
		
		if (likeyDAO.updateLikeCount(posterID, userID) != -1) {
			obj.put("likeCount", likeyDAO.countLike(posterID));
		} else {
			// 좋아요 실패
			obj.put("likeCount", likeyDAO.countLike(posterID));
		}
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(obj);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
