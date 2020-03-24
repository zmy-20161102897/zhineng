package service;

import bean.Tadmin;
import dao.AdminDao;

import java.util.List;

public class AdminService {

    private AdminDao adminDao = new AdminDao();

    public Tadmin login(String adminName, String password) {
        return adminDao.login(adminName,password);
    }

    public List<Tadmin> queryAllAdmin() {
        return adminDao.queryAllAdmin();
    }

    public Tadmin queryAdminById(int adminId) {
        return adminDao.queryAdminById(adminId);
    }

    public int updateHeadImg(int adminId, String headImgData) {
        return adminDao.updateHeadImg(adminId,headImgData);
    }
}
