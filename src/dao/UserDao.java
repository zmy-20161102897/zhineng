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
            return tuser;
        }
    };

    public List<Tuser> queryAllUsers() {
        String sql = "SELECT * FROM tuser";
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
