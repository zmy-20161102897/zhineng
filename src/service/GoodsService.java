package service;

import bean.Tgoods;
import bean.Tnotice;
import dao.GoodsDao;

import java.util.List;

public class GoodsService {
    private GoodsDao goodsDao = new GoodsDao();

    public List<Tgoods> queryAllGoods() {
        return goodsDao.queryAllGoods();
    }

    public int deleteGoods(int goodsId) {
        return goodsDao.deleteGoods(goodsId);
    }

    public List<Tgoods> queryGoodsByAdminId(int userId) {
        return goodsDao.queryGoodsByAdminId(userId);
    }

    public int insertGoods(int adminId, String productName, String recommendedReason, String commodityPrice, String brand, String model, List<String> coverList, List<String> introList) {
        return goodsDao.insertGoods(adminId, productName, recommendedReason, commodityPrice
                , brand, model, coverList, introList);
    }
}
