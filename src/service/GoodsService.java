package service;

import bean.Tgoods;
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
}
