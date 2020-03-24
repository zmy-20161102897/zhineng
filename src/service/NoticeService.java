package service;

import bean.Tnotice;
import dao.NoticeDao;

import java.util.Date;
import java.util.List;

public class NoticeService {

    private NoticeDao noticeDao = new NoticeDao();

    public List<Tnotice> queryNoticeByAdminId(int adminId) {
        return noticeDao.queryNoticeByAdminId(adminId);
    }

    public Tnotice queryNoticeByNoticeId(int noticeId) {
        return noticeDao.queryNoticeByNoticeId(noticeId);
    }

    public int deleteNotice(int noticeId) {
        return noticeDao.deleteNotice(noticeId);
    }

    public int findLastNoticeId(int noticeId) {
        return noticeDao.findLastNoticeId(noticeId);
    }

    public int findNextNoticeId(int noticeId) {
        return noticeDao.findNextNoticeId(noticeId);
    }

    public List<Tnotice> queryAllNotice() {
        return noticeDao.queryAllNotice();
    }

    public int insertNotice(String title, String text, long adminId, Date date) {
        return noticeDao.insertNotice(title,text,adminId,date);
    }

    public List<String> queryNoticeTitleByTerm(String term) {
        return noticeDao.queryNoticeTitleByTerm(term);
    }
}
