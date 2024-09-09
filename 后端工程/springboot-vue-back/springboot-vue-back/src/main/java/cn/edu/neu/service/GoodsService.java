package cn.edu.neu.service;


import java.util.List;
import java.util.Map;

import cn.edu.neu.core.common.Page;

import cn.edu.neu.model.Goods;


public interface GoodsService {

	//Page<Goods> getGoodsByCate(String cateId,String sort);
	//	查找商品分类及所属商品
	Page<Goods> getGoodsByCate(String cateId, String sort, Integer pageNo);
	//	获取新品推荐轮播商品
	List<Goods> getNewGoods();
	// 获取首页热品排行商品
	List<Goods> getSalesGoods();
	//	首页根据关键字搜索商品
	Page<Goods> searchGoods(String keyword,String sort);

	Goods getGoodsDetailById(String goodsId);

	List<Goods> getAllGoods();


}
