package dao;

import bean.Tgoods;
import bean.Tnotice;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import utils.C3p0Utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class GoodsDao {

    private JdbcTemplate jdbcTemplate = new JdbcTemplate(C3p0Utils.getDataSource());

    private RowMapper<Tgoods> goodsShowRowMapper = new RowMapper<Tgoods>() {
        @Override
        public Tgoods mapRow(ResultSet resultSet, int i) throws SQLException {
            Tgoods goods = new Tgoods();
            goods.setGoodsId(resultSet.getInt(1));
            goods.setGoodsName(resultSet.getString(2));
            goods.setGoodsPrice(resultSet.getDouble(3));
            goods.setGoodsText(resultSet.getString(4));
            goods.setAdminId(resultSet.getInt(5));
            goods.setCoverImg1(resultSet.getString(6));
            goods.setCoverImg2(resultSet.getString(7));
            goods.setCoverImg3(resultSet.getString(8));
            goods.setIntroImg1(resultSet.getString(9));
            goods.setIntroImg2(resultSet.getString(10));
            goods.setIntroImg3(resultSet.getString(11));
            goods.setIntroImg4(resultSet.getString(12));
            goods.setIntroImg5(resultSet.getString(13));
            goods.setIntroImg6(resultSet.getString(14));
            return goods;
        }
    };

    public List<Tgoods> queryAllGoods() {
        String sql = "SELECT * FROM tgoods";
        try {
            return jdbcTemplate.query(sql, goodsShowRowMapper);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public int deleteGoods(int goodsId) {
        String sql = "DELETE FROM tgoods WHERE goodsID = ?";
        try {
            return jdbcTemplate.update(sql, goodsId);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public List<Tgoods> queryGoodsByAdminId(int adminId) {
        String sql = "SELECT * FROM tgoods WHERE adminID = ?";
        try {
            return jdbcTemplate.query(sql, goodsShowRowMapper, adminId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
