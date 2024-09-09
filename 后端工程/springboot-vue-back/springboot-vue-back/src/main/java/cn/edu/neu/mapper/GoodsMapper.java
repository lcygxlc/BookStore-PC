package cn.edu.neu.mapper;

import java.util.List;
import java.util.Map;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Goods;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GoodsMapper {
	// 查找商品分类及所属商品
	List<Goods> findAllGoodsByCateId(Page<Goods> page);
	//	获取新品推荐轮播商品
	List<Goods> findNewGoods();
	// 获取首页热品排行商品
	List<Goods> findSalesGoods();
	//首页根据关键字搜索商品
	List<Goods> findGoodsByKeyword(Page<Goods> page);

	Goods findGoodsDetailById(String goodsId);

	List<Goods> findAllGoods();
}
