package dao;

import bean.Tuser;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import utils.C3p0Utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class UserDao {

    private JdbcTemplate jdbcTemplate = new JdbcTemplate(C3p0Utils.getDataSource());

    private RowMapper<Tuser> userRowMapper = new RowMapper<Tuser>() {
        @Override
        public Tuser mapRow(ResultSet resultSet, int i) throws SQLException {
            Tuser tuser = new Tuser();
            tuser.setUserId(resultSet.getInt(1));
            tuser.setUserName(resultSet.getString(2));
            tuser.setUserBirthday(resultSet.getDate(3));
            tuser.setUserEmail(resultSet.getString(4));
            tuser.setUserSex(resultSet.getString(5));
            tuser.setUserPassword(resultSet.getString(6));
            tuser.setUserAddress(resultSet.getString(7));
            tuser.setUserMobile(resultSet.getString(8));
            tuser.setUserPic(resultSet.getString(9));
            tuser.setStatus(resultSet.getInt(10));
            return tuser;
        }
    };

    //管理员登录
    public Tuser login(String userName, String password) {
        String sql = "SELECT * FROM tuser WHERE userName = ? and userPassword = ? AND status = 1";
        try {
            return jdbcTemplate.queryForObject(sql, userRowMapper, userName, password);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    //查询所有管理员
    public List<Tuser> queryAllAdmin() {
        String sql = "SELECT * FROM tuser WHERE status = 1";
        try {
            return jdbcTemplate.query(sql, userRowMapper);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    //管理员详细信息
    public Tuser queryAdminById(int userId) {
        String sql = "SELECT * FROM tuser WHERE userID = ?";
        try {
            return jdbcTemplate.queryForObject(sql, userRowMapper, userId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    //管理员头像
    public int updateHeadImg(int userId, String headImgData) {
        String sql = "UPDATE tuser SET userPic = ? WHERE userID = ? AND status = 1";
        try {
            return jdbcTemplate.update(sql,headImgData,userId);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public List<Tuser> queryAllUsers() {
        String sql = "SELECT * FROM tuser WHERE status = 0";
        try {
            return jdbcTemplate.query(sql,userRowMapper);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Tuser queryUserById(int userId) {
        String sql = "SELECT * FROM tuser WHERE userID = ?";
        try {
            return jdbcTemplate.queryForObject(sql,userRowMapper,userId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public int deleteUser(int userId) {
        String sql = "DELETE FROM tuser WHERE userID = ?";
        try {
            return jdbcTemplate.update(sql,userId);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
}
