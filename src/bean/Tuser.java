package bean;

import utils.Img2StrUtils;

import java.text.SimpleDateFormat;

public class Tuser {

  private long userId;
  private String userName;
  private java.sql.Date userBirthday;
  private String userEmail;
  private String userSex;
  private String userPassword;
  private String userAddress;
  private String userMobile;
  private String userPic;
  private long status;


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }


  public String getUserBirthday() {
      SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
      return simpleDateFormat.format(userBirthday);
  }

  public void setUserBirthday(java.sql.Date userBirthday) {
    this.userBirthday = userBirthday;
  }


  public String getUserEmail() {
    return userEmail;
  }

  public void setUserEmail(String userEmail) {
    this.userEmail = userEmail;
  }


  public String getUserSex() {
    return userSex;
  }

  public void setUserSex(String userSex) {
    this.userSex = userSex;
  }


  public String getUserPassword() {
    return userPassword;
  }

  public void setUserPassword(String userPassword) {
    this.userPassword = userPassword;
  }


  public String getUserAddress() {
    return userAddress;
  }

  public void setUserAddress(String userAddress) {
    this.userAddress = userAddress;
  }


  public String getUserMobile() {
    return userMobile;
  }

  public void setUserMobile(String userMobile) {
    this.userMobile = userMobile;
  }


  public String getUserPic() {
    return userPic;
  }

  public void setUserPic(String userPic) {
      this.userPic = userPic;
      if (userPic != null) {
          Img2StrUtils.str2Img(this.userPic, "D:\\IdeaProjects\\graduationProject\\zhineng\\out\\artifacts\\zhineng_war_exploded\\img\\user\\" + this.userId, "png");
      }
  }

  public long getStatus() {
    return status;
  }

  public void setStatus(long status) {
    this.status = status;
  }

}