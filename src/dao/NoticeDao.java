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
            notice.setAdminId(resultSet.getInt(4));
            notice.setNoticeDate(resultSet.getDate(5));
            return notice;
        }
    };

    private RowMapper<Tnotice> noticeAdminRowMapper = new RowMapper<Tnotice>() {
        @Override
        public Tnotice mapRow(ResultSet resultSet, int i) throws SQLException {
            Tnotice notice = new Tnotice();
            notice.setNoticeId(resultSet.getInt(1));
            notice.setNoticeTitle(resultSet.getString(2));
            notice.setNoticeText(resultSet.getString(3));
            notice.setAdminId(resultSet.getInt(4));
            notice.setNoticeDate(resultSet.getDate(5));
            notice.setAdminName(resultSet.getString(7));
            return notice;
        }
    };

    private JdbcTemplate jdbcTemplate = new JdbcTemplate(C3p0Utils.getDataSource());

    public List<Tnotice> queryNoticeByAdminId(int adminId) {
        String sql = "SELECT * FROM tnotice WHERE adminID = ?";
        try {
            return jdbcTemplate.query(sql, noticeRowMapper, adminId);
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
        String sql = "SELECT MIN(noticeID) FROM tnotice WHERE noticeID > ?";
        try {
            return jdbcTemplate.queryForObject(sql, Integer.class, noticeId);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public int findNextNoticeId(int noticeId) {
        String sql = "SELECT MAX(noticeID) FROM tnotice WHERE noticeID < ?";
        try {
            return jdbcTemplate.queryForObject(sql, Integer.class, noticeId);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public List<Tnotice> queryAllNotice() {
        String sql = "SELECT * FROM tnotice,tadmin WHERE tnotice.adminID = tadmin.adminID ORDER BY tnotice.noticeDate DESC ";
        try {
            return jdbcTemplate.query(sql, noticeAdminRowMapper);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public int insertNotice(String title, String text, long adminId, Date date) {
        String sql = "INSERT INTO tnotice VALUES (null,?,?,?,?)";
        try {
            return jdbcTemplate.update(sql, title, text, adminId, date);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public List<String> queryNoticeTitleByTerm(String term) {
        String sql = "SELECT LEFT(noticetitle,50) FROM tnotice WHERE noticeTitle LIKE ? LIMIT 0,6";
        try {
            return jdbcTemplate.queryForList(sql, String.class, "%" + term + "%");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
