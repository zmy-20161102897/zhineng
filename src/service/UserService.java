package service;

import bean.Tuser;
import dao.UserDao;

import java.util.List;

public class UserService {
    private UserDao userDao = new UserDao();

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
