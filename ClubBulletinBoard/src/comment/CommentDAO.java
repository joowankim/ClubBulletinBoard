package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class CommentDAO {

	private Connection conn;
	private ResultSet rs;
	
	public CommentDAO() {
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
	
	public ArrayList<Comment> getComments(int posterID) {
		String SQL = "SELECT * FROM poster_comment WHERE poster_id_fk = ? AND commentAvailable = 1";
		ArrayList<Comment> list = new ArrayList<Comment>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, posterID);
			rs = pstmt.executeQuery();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			while (rs.next()) {
				Comment comment = new Comment();
				comment.setCommentID(rs.getInt(1));
				comment.setUserID(rs.getInt(2));
				comment.setPosterID(rs.getInt(3));
				comment.setContents(rs.getString(4));
				comment.setDate(sdf.format(rs.getTimestamp(5)));
				list.add(comment);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int updateComment(int posterID, int userID, String content) {
		String SQL = "UPDATE poster SET comment_cnt = ? WHERE posterID = ?";
		try {
			if (insertComment(posterID, userID, content) != -1) {
				int commentCount = countComment(posterID);
				if (commentCount != -1) {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setInt(1, commentCount);
					pstmt.setInt(2, posterID);
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
	
	public int deleteComment(int commentID, int posterID) {
		String SQL = "UPDATE poster_comment SET commentAvailable = 0 WHERE comment_id = ?";
		try {
			if (adjustCount(posterID) != -1) {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, commentID);
				return pstmt.executeUpdate();
			} else {
				return -1;	// 데이터베이스 오류
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; 	// 데이터베이스 오류
	}
	
	private int adjustCount(int posterID) {
		String SQL = "UPDATE poster SET comment_cnt = ? WHERE posterID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, countComment(posterID));
			pstmt.setInt(2, posterID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
	}
	
	private int countComment(int posterID) {
		String SQL = "SELECT COUNT(*) FROM poster_comment WHERE poster_id_fk = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, posterID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
	}
	
	private int insertComment(int posterID, int userID, String content) {
		String SQL = "INSERT INTO poster_comment VALUES (0, ?, ?, ?, now(), 1)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, userID);
			pstmt.setInt(2, posterID);
			pstmt.setString(3, content);
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
	}
}
