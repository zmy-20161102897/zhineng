package bean;


import java.text.SimpleDateFormat;

public class Tnotice {

    private long noticeId;
    private String noticeTitle;
    private String noticeText;
    private long userId;
    private java.sql.Date noticeDate;
    private String userName;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public long getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(long noticeId) {
        this.noticeId = noticeId;
    }


    public String getNoticeTitle(int length) {
        if (noticeTitle.length() < length) {
            return noticeTitle;
        } else {
            return noticeTitle.substring(0,length) + " ...";
        }
    }

    public String getNoticeTitle() {
//        if (noticeTitle.length() < 24) {
//            return noticeTitle;
//        } else {
//            return noticeTitle.substring(0,24) + " ...";
//        }
        return noticeTitle;
    }

    public String getFullNoticeTitle() {
        return noticeTitle;
    }

    public void setNoticeTitle(String noticeTitle) {
        this.noticeTitle = noticeTitle;
    }


    public String getNoticeText() {
        return noticeText;
    }

    public void setNoticeText(String noticeText) {
        this.noticeText = noticeText;
    }


    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }


    public String getNoticeDate() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return simpleDateFormat.format(noticeDate);
    }

    public void setNoticeDate(java.sql.Date noticeDate) {
        this.noticeDate = noticeDate;
    }

}
