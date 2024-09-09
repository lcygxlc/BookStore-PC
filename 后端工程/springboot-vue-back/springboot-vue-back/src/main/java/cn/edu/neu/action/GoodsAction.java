package cn.edu.neu.action;

import java.util.List;
import java.util.Map;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.core.common.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.neu.model.Goods;
import cn.edu.neu.service.GoodsService;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/goods")
public class GoodsAction extends BaseAction {

    @Autowired
    private GoodsService goodsService;

    @RequestMapping("/getGoodsDetailById")
    public R getGoodsDetailById(@RequestParam String goodsId,
                                Map<String, Goods> m) {
        Goods goodsDetail = goodsService.getGoodsDetailById(goodsId);
        m.put("goodsDetail", goodsDetail);
        return R.ok().put("goodsDetail", goodsDetail);
    }

    //  获取新品推荐商品
    @RequestMapping(value = "/getNewGoods", method = RequestMethod.GET)
    public R getNewGoods() {
        List<Goods> newGoods = goodsService.getNewGoods();
        return R.ok().put("newGoods", newGoods);
    }

    // 获取首页热品排行商品
    @RequestMapping(value = "/getSalesGoods", method = RequestMethod.GET)
    public R getSalesGoods() {
        List<Goods> salesGoods = goodsService.getSalesGoods();
        return R.ok().put("salesGoods", salesGoods);
    }
    //   查找商品分类及所属商品
    @RequestMapping(value = "/getGoodsByCate", method = RequestMethod.GET)
    public R getGoodsByCate(@RequestParam String cateId,
                            @RequestParam(required = false) String sort,
                            @RequestParam(required = false) Integer pageNo) {
        Page<Goods> goods = goodsService.getGoodsByCate(cateId, sort, pageNo);
        return R.ok().put("goods", goods);
    }

    // 首页根据关键字搜索商品
    @RequestMapping(value = "/searchGoods", method = RequestMethod.GET)
    public R searchGoods(HttpServletRequest request,
                         @RequestParam String keyword,
                         @RequestParam(required = false) String sort) {
        System.out.println("keyword:" + keyword);
        Page<Goods> searchGoods = goodsService.searchGoods(keyword, sort);
        return R.ok().put("searchGoods", searchGoods);
    }


}
