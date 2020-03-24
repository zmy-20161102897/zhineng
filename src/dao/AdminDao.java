package dao;

import bean.Tadmin;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import utils.C3p0Utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class AdminDao {

    private JdbcTemplate jdbcTemplate = new JdbcTemplate(C3p0Utils.getDataSource());

    private RowMapper<Tadmin> adminRowMapper = new RowMapper<>() {
        @Override
        public Tadmin mapRow(ResultSet resultSet, int i) throws SQLException {
            Tadmin admin = new Tadmin();
            admin.setAdminId(resultSet.getInt(1));
            admin.setAdminName(resultSet.getString(2));
            admin.setAdminBirthday(resultSet.getDate(3));
            admin.setAdminEmail(resultSet.getString(4));
            admin.setAdminSex(resultSet.getString(5));
            admin.setAdminPassword(resultSet.getString(6));
            admin.setAdminAddress(resultSet.getString(7));
            admin.setAdminMobile(resultSet.getString(8));
//            if (!"".equals(resultSet.getString(9))) {
            admin.setAdminPic(resultSet.getString(9));
//            }
            return admin;
        }
    };

    public Tadmin login(String adminName, String password) {
        String sql = "SELECT * FROM tadmin WHERE adminName = ? and adminPassword = ?";
        try {
            return jdbcTemplate.queryForObject(sql, adminRowMapper, adminName, password);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Tadmin> queryAllAdmin() {
        String sql = "SELECT * FROM tadmin";
        try {
            return jdbcTemplate.query(sql, adminRowMapper);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Tadmin queryAdminById(int adminId) {
        String sql = "SELECT * FROM tadmin WHERE adminID = ?";
        try {
            return jdbcTemplate.queryForObject(sql, adminRowMapper, adminId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public int updateHeadImg(int adminId, String headImgData) {
        String sql = "UPDATE tadmin SET adminPic = ? WHERE adminID = ?";
        try {
            return jdbcTemplate.update(sql,headImgData,adminId);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
}
