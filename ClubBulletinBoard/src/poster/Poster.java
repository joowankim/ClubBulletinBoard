package poster;

public class Poster {
	
	private int posterID;
	private int userID;
	private int likeCount;
	private int commentCount;
	private String clubName;
	private String clubCategory;
	private int numOfRecruiting = -1;
	private String homepageLink;
	private String preferCondition;
	private String activityField;
	private String intro;
	private String posterImg;
	private String posterFileName;
	
	public int getPosterID() {
		return posterID;
	}
	public void setPosterID(int posterID) {
		this.posterID = posterID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public String getClubCategory() {
		return clubCategory;
	}
	public void setClubCategory(String clubCategory) {
		this.clubCategory = clubCategory;
	}
	public int getNumOfRecruiting() {
		return numOfRecruiting;
	}
	public void setNumOfRecruiting(int numOfRecruiting) {
		this.numOfRecruiting = numOfRecruiting;
	}
	public String getHomepageLink() {
		return homepageLink;
	}
	public void setHomepageLink(String homepageLink) {
		this.homepageLink = homepageLink;
	}
	public String getPreferCondition() {
		return preferCondition;
	}
	public void setPreferCondition(String preferCondition) {
		this.preferCondition = preferCondition;
	}
	public String getActivityField() {
		return activityField;
	}
	public void setActivityField(String activityField) {
		this.activityField = activityField;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getPosterImg() {
		return posterImg;
	}
	public void setPosterImg(String posterImg) {
		this.posterImg = posterImg;
	}
	public String getPosterFileName() {
		return posterFileName;
	}
	public void setPosterFileName(String posterFileName) {
		this.posterFileName = posterFileName;
	}
	
	
	
}
