package dao;

import bean.Tmessage;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import utils.C3p0Utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class MessageDao {

        private RowMapper<Tmessage> messageRowMapper = new RowMapper<Tmessage>() {
            @Override
            public Tmessage mapRow(ResultSet resultSet, int i) throws SQLException {
                Tmessage message = new Tmessage();
                message.setMesId(resultSet.getInt(1));
                message.setMesSubject(resultSet.getString(2));
                message.setMesText(resultSet.getString(3));
                //message.setMesPhoto(resultSet.getString(4));
                message.setMesDate(resultSet.getDate(4));
                message.setUserId(resultSet.getInt(5));
                message.setCid(resultSet.getInt(6));
                message.setZancount(resultSet.getInt(7));
                return message;
            }
        };

    private RowMapper<Tmessage> messageUserRowMapper = new RowMapper<Tmessage>() {
        @Override
        public Tmessage mapRow(ResultSet resultSet, int i) throws SQLException {
            Tmessage message = new Tmessage();
            message.setMesId(resultSet.getInt(1));
            message.setMesSubject(resultSet.getString(2));
            message.setMesText(resultSet.getString(3));
            //message.setMesPhoto(resultSet.getString(4));
            message.setMesDate(resultSet.getDate(4));
            message.setUserId(resultSet.getInt(5));
            message.setCid(resultSet.getInt(6));
            message.setZancount(resultSet.getInt(7));
            message.setUserName(resultSet.getString(9));
            //message.setCname(resultSet.getString(12));
            return message;
        }
    };

    private JdbcTemplate jdbcTemplate = new JdbcTemplate(C3p0Utils.getDataSource());

    public List<Tmessage> queryAllMessage() {
        String sql = "SELECT * FROM tmessage,tuser WHERE tmessage.userID = tuser.userID AND tmessage.cid = 2 ORDER BY tmessage.mesDate DESC ";
        try {
            return jdbcTemplate.query(sql, messageUserRowMapper);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Tmessage> queryHotMessage() {
        String sql = "SELECT * FROM tmessage,tuser WHERE tmessage.userID = tuser.userID AND tmessage.cid <> 2 ORDER BY tmessage.zancount DESC ";
        try {
            return jdbcTemplate.query(sql, messageUserRowMapper);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Tmessage> queryOriginMessage() {
        String sql = "SELECT * FROM tmessage,tuser WHERE tmessage.userID = tuser.userID AND tmessage.cid = 5 ORDER BY tmessage.mesDate DESC ";
        try {
            return jdbcTemplate.query(sql, messageUserRowMapper);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Tmessage> queryCompareMessage() {
        String sql = "SELECT * FROM tmessage,tuser WHERE tmessage.userID = tuser.userID AND tmessage.cid = 3 ORDER BY tmessage.mesDate DESC ";
        try {
            return jdbcTemplate.query(sql, messageUserRowMapper);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Tmessage> queryFutureMessage() {
        String sql = "SELECT * FROM tmessage,tuser WHERE tmessage.userID = tuser.userID AND tmessage.cid = 4 ORDER BY tmessage.mesDate DESC ";
        try {
            return jdbcTemplate.query(sql, messageUserRowMapper);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Tmessage queryMessageByMesId(int mesID) {
        String sql = "SELECT * FROM tmessage WHERE mesID = ?";
        try {
            return jdbcTemplate.queryForObject(sql,messageRowMapper,mesID);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public int deleteMessage(int mesId) {
        String sql = "DELETE FROM tmessage WHERE mesID = ?";
        try {
            return jdbcTemplate.update(sql, mesId);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public List<Tmessage> queryDevelopByUserId(int userId) {
        String sql = "SELECT * FROM tmessage WHERE userID = ? AND tmessage.cid <> 2";
        try {
            return jdbcTemplate.query(sql, messageRowMapper, userId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Tmessage> queryInvitationByUserId(int userId) {
        String sql = "SELECT * FROM tmessage WHERE userID = ? AND tmessage.cid = 2";
        try {
            return jdbcTemplate.query(sql, messageRowMapper, userId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public int deleteMessageByUserID(int userId) {
        String sql = "DELETE FROM tmessage WHERE userID = ?";
        try {
            return jdbcTemplate.update(sql,userId);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

}



