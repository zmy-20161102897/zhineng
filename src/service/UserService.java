package service;

import bean.Tuser;
import dao.UserDao;

import java.util.List;

public class UserService {
    private UserDao userDao = new UserDao();

    //登录
    public Tuser login(String userName, String password) {
        return userDao.login(userName,password);
    }

    //查看所有管理员
    public List<Tuser> queryAllAdmin() {
        return userDao.queryAllAdmin();
    }

    //管理员个人信息
    public Tuser queryAdminById(int userId) {
        return userDao.queryAdminById(userId);
    }

    //管理员头像
    public int updateHeadImg(int userId, String headImgData) {
        return userDao.updateHeadImg(userId,headImgData);
    }

    public List<Tuser> queryAllUsers() {
        return userDao.queryAllUsers();
    }

    public Tuser queryUserById(int userId) {
        return userDao.queryUserById(userId);
    }

    public int deleteUser(int userId) {
        return userDao.deleteUser(userId);
    }


}
