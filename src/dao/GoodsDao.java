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
            goods.setUserId(resultSet.getInt(5));
            goods.setCoverImg1(resultSet.getString(6));
            goods.setCoverImg2(resultSet.getString(7));
            goods.setCoverImg3(resultSet.getString(8));
            goods.setCoverImg4(resultSet.getString(9));
            goods.setCoverImg5(resultSet.getString(10));
            goods.setIntroImg1(resultSet.getString(11));
            goods.setIntroImg2(resultSet.getString(12));
            goods.setIntroImg3(resultSet.getString(13));
            goods.setIntroImg4(resultSet.getString(14));
            goods.setIntroImg5(resultSet.getString(15));
            goods.setGoodsBrand(resultSet.getString(16));
            goods.setGoodsModel(resultSet.getString(17));
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

    public List<Tgoods> queryGoodsByAdminId(int userId) {
        String sql = "SELECT * FROM tgoods WHERE userID = ?";
        try {
            return jdbcTemplate.query(sql, goodsShowRowMapper, userId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public int insertGoods(int adminId, String productName, String recommendedReason, String commodityPrice, String brand, String model, List<String> coverList, List<String> introList) {
        int coverSize = coverList.size();
        int introSize = introList.size();
        StringBuilder sqlBuilder = new StringBuilder("INSERT INTO tgoods VALUES(null,?,?,?,?,");
        sqlBuilder.append("?,".repeat(coverSize));
        sqlBuilder.append("null,".repeat(Math.max(0, 5 - coverSize)));
        sqlBuilder.append("?,".repeat(introSize));
        sqlBuilder.append("null,".repeat(Math.max(0, 5 - introSize)));
        sqlBuilder.append("?,?)");
        String sql = sqlBuilder.toString();

        try {
            switch (coverSize) {
                case 1: {
                    switch (introSize) {
                        case 1: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0),
                                    introList.get(0),
                                    brand, model);
                        }
                        case 2: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0),
                                    introList.get(0), introList.get(1),
                                    brand, model);
                        }
                        case 3: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0),
                                    introList.get(0), introList.get(1), introList.get(2),
                                    brand, model);
                        }
                        case 4: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0),
                                    introList.get(0), introList.get(1), introList.get(2),
                                    introList.get(3),
                                    brand, model);
                        }
                        case 5: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0),
                                    introList.get(0), introList.get(1), introList.get(2),
                                    introList.get(3), introList.get(4),
                                    brand, model);
                        }
                        default: {
                            return 0;
                        }
                    }
                }
                case 2: {
                    switch (introSize) {
                        case 1: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0), coverList.get(1),
                                    introList.get(0),
                                    brand, model);
                        }
                        case 2: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0), coverList.get(1),
                                    introList.get(0), introList.get(1),
                                    brand, model);
                        }
                        case 3: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0), coverList.get(1),
                                    introList.get(0), introList.get(1), introList.get(2),
                                    brand, model);
                        }
                        case 4: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0), coverList.get(1),
                                    introList.get(0), introList.get(1), introList.get(2),
                                    introList.get(3),
                                    brand, model);
                        }
                        case 5: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0), coverList.get(1),
                                    introList.get(0), introList.get(1), introList.get(2),
                                    introList.get(3), introList.get(4),
                                    brand, model);
                        }
                        default: {
                            return 0;
                        }
                    }
                }
                case 3: {
                    switch (introSize) {
                        case 1: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0), coverList.get(1), coverList.get(2),
                                    introList.get(0),
                                    brand, model);
                        }
                        case 2: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0), coverList.get(1), coverList.get(2),
                                    introList.get(0), introList.get(1),
                                    brand, model);
                        }
                        case 3: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0), coverList.get(1), coverList.get(2),
                                    introList.get(0), introList.get(1), introList.get(2),
                                    brand, model);
                        }
                        case 4: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0), coverList.get(1), coverList.get(2),
                                    introList.get(0), introList.get(1), introList.get(2),
                                    introList.get(3),
                                    brand, model);
                        }
                        case 5: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0), coverList.get(1), coverList.get(2),
                                    introList.get(0), introList.get(1), introList.get(2),
                                    introList.get(3), introList.get(4),
                                    brand, model);
                        }
                        default: {
                            return 0;
                        }
                    }
                }
                case 4: {
                    switch (introSize) {
                        case 1: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0), coverList.get(1), coverList.get(2),
                                    coverList.get(3),
                                    introList.get(0),
                                    brand, model);
                        }
                        case 2: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0), coverList.get(1), coverList.get(2),
                                    coverList.get(3),
                                    introList.get(0), introList.get(1),
                                    brand, model);
                        }
                        case 3: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0), coverList.get(1), coverList.get(2),
                                    coverList.get(3),
                                    introList.get(0), introList.get(1), introList.get(2),
                                    brand, model);
                        }
                        case 4: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0), coverList.get(1), coverList.get(2),
                                    coverList.get(3),
                                    introList.get(0), introList.get(1), introList.get(2),
                                    introList.get(3),
                                    brand, model);
                        }
                        case 5: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0), coverList.get(1), coverList.get(2),
                                    coverList.get(3),
                                    introList.get(0), introList.get(1), introList.get(2),
                                    introList.get(3), introList.get(4),
                                    brand, model);
                        }
                        default: {
                            return 0;
                        }
                    }
                }
                case 5: {
                    switch (introSize) {
                        case 1: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0), coverList.get(1), coverList.get(2),
                                    coverList.get(3), coverList.get(4),
                                    introList.get(0),
                                    brand, model);
                        }
                        case 2: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0), coverList.get(1), coverList.get(2),
                                    coverList.get(3), coverList.get(4),
                                    introList.get(0), introList.get(1),
                                    brand, model);
                        }
                        case 3: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0), coverList.get(1), coverList.get(2),
                                    coverList.get(3), coverList.get(4),
                                    introList.get(0), introList.get(1), introList.get(2),
                                    brand, model);
                        }
                        case 4: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0), coverList.get(1), coverList.get(2),
                                    coverList.get(3), coverList.get(4),
                                    introList.get(0), introList.get(1), introList.get(2),
                                    introList.get(3),
                                    brand, model);
                        }
                        case 5: {
                            return jdbcTemplate.update(sql, productName, commodityPrice,
                                    recommendedReason, adminId,
                                    coverList.get(0), coverList.get(1), coverList.get(2),
                                    coverList.get(3), coverList.get(4),
                                    introList.get(0), introList.get(1), introList.get(2),
                                    introList.get(3), introList.get(4),
                                    brand, model);
                        }
                        default: {
                            return 0;
                        }
                    }
                }
                default: {
                    return 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
}
