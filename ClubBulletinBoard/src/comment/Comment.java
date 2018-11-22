package comment;


public class Comment {
	private int commentID;
	private int userID;
	private int posterID;
	private String contents;
	private String date;
	
	public int getCommentID() {
		return commentID;
	}
	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getPosterID() {
		return posterID;
	}
	public void setPosterID(int posterID) {
		this.posterID = posterID;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
}
