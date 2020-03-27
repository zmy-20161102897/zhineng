package bean;


import utils.Img2StrUtils;

import java.text.SimpleDateFormat;

public class Tadmin {

    private long adminId;
    private String adminName;
    private java.sql.Date adminBirthday;
    private String adminEmail;
    private String adminSex;
    private String adminPassword;
    private String adminAddress;
    private String adminMobile;
    private String adminPic;

    public long getAdminId() {
        return adminId;
    }

    public void setAdminId(long adminId) {
        this.adminId = adminId;
    }


    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }


    public String getAdminBirthday() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return simpleDateFormat.format(adminBirthday);
    }

    public void setAdminBirthday(java.sql.Date adminBirthday) {
        this.adminBirthday = adminBirthday;
    }


    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }


    public String getAdminSex() {
        return adminSex;
    }

    public void setAdminSex(String adminSex) {
        this.adminSex = adminSex;
    }


    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }


    public String getAdminAddress() {
        return adminAddress;
    }

    public void setAdminAddress(String adminAddress) {
        this.adminAddress = adminAddress;
    }


    public String getAdminMobile() {
        return adminMobile;
    }

    public void setAdminMobile(String adminMobile) {
        this.adminMobile = adminMobile;
    }


    public String getAdminPic() {
        return adminPic;
    }

    public void setAdminPic(String adminPic) {
        this.adminPic = adminPic;
        if (adminPic != null) {
            Img2StrUtils.str2Img(this.adminPic, "IdeaProjects\\graduationProject\\zhineng\\out\\artifacts\\zhineng_war_exploded\\img\\admin\\" + this.adminId, "png");
        }
    }

}
