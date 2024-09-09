package cn.edu.neu.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.neu.core.common.Page;

import cn.edu.neu.mapper.GoodsMapper;
import cn.edu.neu.model.Category;
import cn.edu.neu.model.Goods;
import cn.edu.neu.service.GoodsService;

@Service
@Transactional
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsMapper goodsMapper;
	//	查找商品分类及所属商品
	public Page<Goods> getGoodsByCate(String cateId, String sort,Integer pageNo) {
		Page<Goods> page = new Page<Goods>(12);
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("cateId", cateId);
		m.put("sort", sort);
		page.setParams(m);
		if(pageNo!=null){
			page.setPageNo(pageNo);
		}
		List<Goods> goodsList = goodsMapper.findAllGoodsByCateId(page);
		page.setList(goodsList);
		return page;
	}
	//	获取新品推荐轮播商品
	@Override
	public List<Goods> getNewGoods() {
		List<Goods> newGoods = goodsMapper.findNewGoods();
		System.out.println(newGoods);
		return newGoods;
	}
	// 获取首页热品排行商品
	@Override
	public List<Goods> getSalesGoods() {
		// TODO Auto-generated method stub
		List<Goods> salesGoods = goodsMapper.findSalesGoods();
		System.out.println(salesGoods);
		return salesGoods;
	}
	// 首页根据关键字搜索商品
	@Override
	public Page<Goods> searchGoods(String keyword, String sort) {
		System.out.println("GoodsServiceImpl:" + sort);
		Page<Goods> page = new Page<Goods>(12);
		String[] keywords = keyword.split(" ");

		Map<String, Object> m = new HashMap<String, Object>();
		m.put("keywords", keywords);
		m.put("sort", sort);
		page.setParams(m);
		List<Goods> goodsList = goodsMapper.findGoodsByKeyword(page);
		System.out.println("GoodsServiceImpl:" + goodsList);
		page.setList(goodsList);
		return page;
	}

	@Override
	public Goods getGoodsDetailById(String goodsId) {
		Goods goodsDetail = goodsMapper.findGoodsDetailById(goodsId);
		System.out.println(goodsDetail);
		return goodsDetail;
	}

	@Override
	public List<Goods> getAllGoods() {
		List<Goods> allGoods = goodsMapper.findAllGoods();
		return allGoods;
	}
}
