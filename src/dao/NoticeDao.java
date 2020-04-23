package dao;

import bean.Tnotice;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import utils.C3p0Utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public class NoticeDao {

    private RowMapper<Tnotice> noticeRowMapper = new RowMapper<Tnotice>() {
        @Override
        public Tnotice mapRow(ResultSet resultSet, int i) throws SQLException {
            Tnotice notice = new Tnotice();
            notice.setNoticeId(resultSet.getInt(1));
            notice.setNoticeTitle(resultSet.getString(2));
            notice.setNoticeText(resultSet.getString(3));
            notice.setUserId(resultSet.getInt(4));
            notice.setNoticeDate(resultSet.getDate(5));
            return notice;
        }
    };

    private RowMapper<Tnotice> noticeUserRowMapper = new RowMapper<Tnotice>() {
        @Override
        public Tnotice mapRow(ResultSet resultSet, int i) throws SQLException {
            Tnotice notice = new Tnotice();
            notice.setNoticeId(resultSet.getInt(1));
            notice.setNoticeTitle(resultSet.getString(2));
            notice.setNoticeText(resultSet.getString(3));
            notice.setUserId(resultSet.getInt(4));
            notice.setNoticeDate(resultSet.getDate(5));
            notice.setUserName(resultSet.getString(7));
            return notice;
        }
    };

    private JdbcTemplate jdbcTemplate = new JdbcTemplate(C3p0Utils.getDataSource());

    public List<Tnotice> queryNoticeByUserId(int userId) {
        String sql = "SELECT * FROM tnotice WHERE userID = ?";
        try {
            return jdbcTemplate.query(sql, noticeRowMapper, userId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Tnotice queryNoticeByNoticeId(int noticeId) {
        String sql = "SELECT * FROM tnotice WHERE noticeID = ?";
        try {
            return jdbcTemplate.queryForObject(sql, noticeRowMapper, noticeId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public int deleteNotice(int noticeId) {
        String sql = "DELETE FROM tnotice WHERE noticeID = ?";
        try {
            return jdbcTemplate.update(sql, noticeId);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public int findLastNoticeId(int noticeId) {
        String sql = "SELECT MAX(noticeID) FROM tnotice WHERE noticeID < ?";
        try {
            return jdbcTemplate.queryForObject(sql, Integer.class, noticeId);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public int findNextNoticeId(int noticeId) {
        String sql = "SELECT MIN(noticeID) FROM tnotice WHERE noticeID > ?";
        try {
            return jdbcTemplate.queryForObject(sql, Integer.class, noticeId);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public List<Tnotice> queryAllNotice() {
        String sql = "SELECT * FROM tnotice,tuser WHERE tnotice.userID = tuser.userID ORDER BY tnotice.noticeDate DESC ";
        try {
            return jdbcTemplate.query(sql, noticeUserRowMapper);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public int insertNotice(String title, String text, long userId, Date date) {
        String sql = "INSERT INTO tnotice VALUES (null,?,?,?,?)";
        try {
            return jdbcTemplate.update(sql, title, text, userId, date);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

}
