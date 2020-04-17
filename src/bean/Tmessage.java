package bean;


public class Tmessage {

  private long mesId;
  private String mesSubject;
  private String mesText;
  private String mesPhoto;
  private java.sql.Date mesDate;
  private long userId;
  private long cid;
  private long zancount;
  private String userName;
  private String cname;

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public long getMesId() {
    return mesId;
  }

  public void setMesId(long mesId) {
    this.mesId = mesId;
  }


  public String getMesSubject(int length) {
      if (mesSubject.length() < length) {
        return mesSubject;
      } else {
        return mesSubject.substring(0,length) + " ...";
      }
  }

  public void setMesSubject(String mesSubject) {
    this.mesSubject = mesSubject;
  }


  public String getMesText() {
    return mesText;
  }

  public void setMesText(String mesText) {
    this.mesText = mesText;
  }


  public String getMesPhoto() {
    return mesPhoto;
  }

  public void setMesPhoto(String mesPhoto) {
    this.mesPhoto = mesPhoto;
  }


  public java.sql.Date getMesDate() {
    return mesDate;
  }

  public void setMesDate(java.sql.Date mesDate) {
    this.mesDate = mesDate;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public long getCid() {
    return cid;
  }

  public void setCid(long cid) {
    this.cid = cid;
  }

  public void setCname(String cname) {
    this.cname = cname;
  }

  public long getZancount() {
    return zancount;
  }

  public void setZancount(long zancount) {
    this.zancount = zancount;
  }

  public String getFullMessageSubject() {
    return mesSubject;
  }

}
