package bean;


public class Tcomment {

  private long commentId;
  private long mesId;
  private String content;
  private long userId;
  private java.sql.Date commentDate;
  private long parentId;


  public long getCommentId() {
    return commentId;
  }

  public void setCommentId(long commentId) {
    this.commentId = commentId;
  }


  public long getMesId() {
    return mesId;
  }

  public void setMesId(long mesId) {
    this.mesId = mesId;
  }


  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public java.sql.Date getCommentDate() {
    return commentDate;
  }

  public void setCommentDate(java.sql.Date commentDate) {
    this.commentDate = commentDate;
  }


  public long getParentId() {
    return parentId;
  }

  public void setParentId(long parentId) {
    this.parentId = parentId;
  }

}
