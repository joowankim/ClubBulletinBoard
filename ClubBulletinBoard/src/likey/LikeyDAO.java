package likey;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import poster.Poster;

public class LikeyDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public LikeyDAO() {
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
	
	public int updateLikeCount(int posterID, int userID) {
		String SQL = "UPDATE poster SET like_cnt = ? WHERE posterID = ?";
		try {
			if (checkLike(posterID, userID) == 0) {
				if (insertLike(posterID, userID) != -1) {
					int likeCount = countLike(posterID);
					if (likeCount != -1) {
						PreparedStatement pstmt = conn.prepareStatement(SQL);
						pstmt.setInt(1, likeCount);
						pstmt.setInt(2, posterID);
						return pstmt.executeUpdate();
					} else {
						return -1;
					}
				} else {
					return -1;
				}
			} else if (checkLike(posterID, userID) == 1) {
				if (cancelLike(posterID, userID) != -1) {
					int likeCount = countLike(posterID);
					if (likeCount != -1) {
						PreparedStatement pstmt = conn.prepareStatement(SQL);
						pstmt.setInt(1, likeCount);
						pstmt.setInt(2, posterID);
						return pstmt.executeUpdate();
					} else {
						return -1;
					}
				} else {
					return -1;
				}
			} else {
				return -1;	// 데이터베이스 오류
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
	}
	
	public int checkLike(int posterID, int userID) {
		String SQL = "SELECT COUNT(*) FROM poster_like WHERE poster_id_fk = ? and user_id_fk = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, posterID);
			pstmt.setInt(2, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	private int insertLike(int posterID, int userID) {
		String SQL = "INSERT INTO poster_like VALUES (0, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, userID);
			pstmt.setInt(2, posterID);
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
	}
	
	public int countLike(int posterID) {
		String SQL = "SELECT COUNT(*) FROM poster_like WHERE poster_id_fk = ?";
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
	
	private int cancelLike(int posterID, int userID) {
		String SQL = "DELETE FROM poster_like WHERE poster_id_fk = ? and user_id_fk = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, posterID);
			pstmt.setInt(2, userID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터베이스 오류
	}
}
