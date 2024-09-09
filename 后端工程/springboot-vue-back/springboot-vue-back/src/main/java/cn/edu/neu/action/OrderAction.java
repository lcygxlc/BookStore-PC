package cn.edu.neu.action;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.core.common.R;
import cn.edu.neu.model.Order;
import cn.edu.neu.model.OrderDetail;
import cn.edu.neu.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/order")
//@SessionAttributes(types = String[].class) // 将String数组类型的属性添加到session中
public class OrderAction extends BaseAction {

    @Autowired
    private OrderService orderService;


    @RequestMapping("/buyGoods")
    public R buyGoods(
            @RequestParam(required = false) String[] goodsId,
            @RequestParam(required = false) String[] goodsName,
            @RequestParam(required = false) String[] goodsDiscount,
            @RequestParam(required = false) String[] num,
            @RequestParam(required = false) String[] pic,
            Map<String, Object> map, HttpSession session) {

        String SessionId = getSession().getId();
        System.out.println( "SessionId 1= " + SessionId );

        System.out.println( "goodsId.length = " + goodsId.length );
        System.out.println( "goodsName.length = " + goodsName.length );
        System.out.println( "goodsDiscount.length = " + goodsDiscount.length );
        System.out.println( "num.length = " + num.length );
        System.out.println( "pic.length = " + pic.length );

        // 将请求参数放入map中
        map.put("goodsId", goodsId);
        map.put("goodsName", goodsName);
        map.put("goodsDiscount", goodsDiscount); // 注意这里应该是goodsDiscount而不是qoodsDiscount
        map.put("num", num); // 注意这里应该是num而不是nun
        map.put("pic", pic);

        session.setAttribute("goodsId", goodsId);
        session.setAttribute("goodsName", goodsName);
        session.setAttribute("goodsDiscount", goodsDiscount);
        session.setAttribute("num", num);
        session.setAttribute("pic", pic);

        // 返回成功响应
        return R.ok();
    }
    //    商城提交订单接口实现
    /* 该方法进行单元测试比较困难 */
    @RequestMapping("/addOrder")
    public R addOrder(@RequestParam String address,
                      @RequestParam String orderPostalfee, HttpSession session) {

        //
        String SessionId = getSession().getId();
        System.out.println( "SessionId 2= " + SessionId );

        Order order = new Order();
        order.setUserId(this.getLoginUserId());
        order.setOrderAddress(address);
        order.setOrderPostalfee(Float.parseFloat(orderPostalfee));

        List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
        for (int i = 0; i < ((String[]) session.getAttribute("goodsId")).length; i++) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setGoodsId(Integer.parseInt(((String[]) session.getAttribute("goodsId"))[i]));
            orderDetail.setOdetailName(((String[]) session.getAttribute("goodsName"))[i]);
            orderDetail.setOdetailPrice(Float.parseFloat(((String[]) session.getAttribute("goodsDiscount"))[i]));
            orderDetail.setOdetailNum(Integer.parseInt(((String[]) session.getAttribute("num"))[i]));
            orderDetail.setOdetailPic(((String[]) session.getAttribute("pic"))[i]);
            orderDetails.add(orderDetail);
        }
        Integer orderId = orderService.addOrder(order, orderDetails);
        return R.ok().put("orderId", orderId);
    }
    // ---------------------------------------------------------
    // ----------------------------- 8-11 -----------------------------

    @RequestMapping(value="/getOrderDetailById", method = RequestMethod.GET)
    public R getOrderDetailById(@RequestParam Integer orderId,
                                Map<String, Order> m) {
        Order orderDetail = orderService.getOrderDetailById(orderId);
        m.put("orderDetail", orderDetail);

        //
        System.out.println( "----------------"+orderId );

        return R.ok().put("orderDetail", orderDetail);
    }
    // ---------------------------------------------------------

    // ----------------------------- 8-18 -----------------------------
    @RequestMapping(value = "/getMyOrders",method = RequestMethod.GET)
    public R getMyOrders(@RequestParam(required = false) String status,
                         Map<String, Page<Order>> m) {
        System.out.println("OrderAction:" + status);
        List<Order> orders = orderService.getMyOrders(this.getLoginUserId(),
                status);
        return R.ok().put("orders", orders);
    }
}
