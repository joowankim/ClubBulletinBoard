package poster;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PosterDAO {

	private Connection conn;
	private ResultSet rs;
	
	public PosterDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/ClubBulletinBoard?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "SELECT now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";	// 데이터베이스 오류
	}
	
	public int getNext() {
		String SQL = "SELECT posterID FROM poster ORDER BY posterID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;	// 첫번째 게시물인 경우
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
	}
	
	public int getUserID(String userEmail) {
		String SQL = "SELECT userID FROM user WHERE email = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 1;	// 첫번째 게시물인 경우
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
	}
	
	public int register(String userEmail, String clubName, String clubCategory, int numOfRecruiting,
			String homepageLink, String preferCondition, String activityField, String intro, String posterImg) {
		String SQL = "INSERT INTO poster VALUES (0, ?, ?, 0, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getUserID(userEmail));
			pstmt.setInt(2, 0);
			pstmt.setString(3, getDate());
			pstmt.setString(4, clubName);
			pstmt.setString(5, clubCategory);
			pstmt.setInt(6, numOfRecruiting);
			pstmt.setString(7, homepageLink);
			pstmt.setString(8, preferCondition);
			pstmt.setString(9, activityField);
			pstmt.setString(10, intro);
			pstmt.setString(11, posterImg);
			pstmt.setInt(12, 1);
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
	}
	
	public ArrayList<Poster> getList(int pageNumber) {	// page에 맞는 poster list
		String SQL = "SELECT * FROM poster WHERE posterID < ? AND posterAvailable = 1 ORDER BY posterID DESC LIMIT 12";
		ArrayList<Poster> list = new ArrayList<Poster>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 12);	// 한 페이지의 목록 개수
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Poster poster = new Poster();
				poster.setPosterID(rs.getInt(1));
				poster.setLikeCount(rs.getInt(3));
				poster.setCommentCount(rs.getInt(4));
				poster.setClubName(rs.getString(6));
				poster.setClubCategory(rs.getString(7));
				poster.setNumOfRecruiting(rs.getInt(8));
				poster.setHomepageLink(rs.getString(9));
				poster.setPreferCondition(rs.getString(10));
				poster.setActivityField(rs.getString(11));
				poster.setIntro(rs.getString(12));
				poster.setPosterImg(rs.getString(13));
				list.add(poster);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;	
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM poster WHERE posterID < ? AND posterAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);	// 한 페이지의 목록 개수
			rs = pstmt.executeQuery();
			if (rs.next()) {	// 결과가 존재하면 다음페이지로 넘어갈 수 있다
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;	// 없으면 false
	
	}
	
	
	
	public int updateComment(Poster pos, int userID, String content) {
		String SQL = "UPDATE poster SET comment_cnt = ? WHERE posterID = ?";
		try {
			if (insertComment(pos, userID, content) != -1) {
				int commentCount = countComment(pos);
				if (commentCount != -1) {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setInt(1, commentCount);
					pstmt.setInt(2, pos.getPosterID());
					return pstmt.executeUpdate();
				} else {
					return -1;
				}
			} else {
				return -1;
			}		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
	}
	
	private int countComment(Poster pos) {
		String SQL = "SELECT COUNT(*) FROM poster_comment WHERE poster_id_fk = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, pos.getPosterID());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
	}
	
	private int insertComment(Poster pos, int userID, String content) {
		String SQL = "INSERT INTO poster_like VALUES (0, ?, ?, ?, 0)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, userID);
			pstmt.setInt(2, pos.getPosterID());
			pstmt.setString(3, content);
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
	}

}
