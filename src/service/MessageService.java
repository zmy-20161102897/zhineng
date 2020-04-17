package service;

import bean.Tmessage;
import bean.Tnotice;
import dao.MessageDao;

import java.util.Date;
import java.util.List;

public class MessageService {

    private MessageDao messageDao = new MessageDao();

    public List<Tmessage> queryAllMessage() {
        return messageDao.queryAllMessage();
    }

    public List<Tmessage> queryHotMessage() {
        return messageDao.queryHotMessage();
    }

    public List<Tmessage> queryOriginMessage() {
        return messageDao.queryOriginMessage();
    }

    public List<Tmessage> queryCompareMessage() {
        return messageDao.queryCompareMessage();
    }

    public List<Tmessage> queryFutureMessage() {
        return messageDao.queryFutureMessage();
    }

    public int deleteMessage(int mesId) {
        return messageDao.deleteMessage(mesId);
    }

    public List<Tmessage> queryDevelopByUserId(int userId) {
        return messageDao.queryDevelopByUserId(userId);
    }

    public List<Tmessage> queryInvitationByUserId(int userId) {
        return messageDao.queryInvitationByUserId(userId);
    }

    public int deleteMessageByUserID(int userId) {
        return messageDao.deleteMessageByUserID(userId);
    }

    public Tmessage queryMessageByMesId(int messageId) {
        return messageDao.queryMessageByMesId(messageId);
    }


}
