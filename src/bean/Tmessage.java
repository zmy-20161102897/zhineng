package bean;


public class Tmessage {

  private long mesId;
  private String mesSubject;
  private String mesText;
  private String mesPhoto;
  private java.sql.Date mesDate;
  private long userIid;


  public long getMesId() {
    return mesId;
  }

  public void setMesId(long mesId) {
    this.mesId = mesId;
  }


  public String getMesSubject() {
    return mesSubject;
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


  public long getUserIid() {
    return userIid;
  }

  public void setUserIid(long userIid) {
    this.userIid = userIid;
  }

}
