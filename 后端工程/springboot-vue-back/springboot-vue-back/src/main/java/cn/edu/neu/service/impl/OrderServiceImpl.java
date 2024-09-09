package cn.edu.neu.service.impl;

import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.mapper.OrderMapper;
import cn.edu.neu.model.Order;
import cn.edu.neu.model.OrderDetail;
import cn.edu.neu.service.OrderService;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;


    // ----------------------------- 8-8 -----------------------------
    @Override
    public int addOrder(Order order, List<OrderDetail> orderDetails) {
        Date d = new Date();
        SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String str = sf.format(d);
        Random r = new Random();
        int i = r.nextInt(100);
        String s = "";
        if (i < 10)
            s = "00" + i;
        else if (i >= 10 && i <= 99)
            s = "0" + i;
        String orderCode = str + s;

        order.setOrderCode(orderCode);
        orderMapper.saveOrder(order);
        int orderId = order.getOrderId();
        System.out.println("---------" + order.getOrderId());

        for (int j = 0; j < orderDetails.size(); j++) {
            OrderDetail od = orderDetails.get(j);
            od.setOrderId(orderId);
            orderMapper.saveOrderDetail(od);
        }

        return orderId;
    }
    // ----------------------------------------------------------


    // ----------------------------- 8-11 -----------------------------
    @Override
    public Order getOrderDetailById(Integer orderId) {

        //
        System.out.println( "----------------"+orderId );

        Order orderDetail = orderMapper.findOrderDetailById(orderId);
        return orderDetail;
    }
    // ----------------------------------------------------------
    // ----------------------------- 8-18 -----------------------------
    @Override
    public List<Order> getMyOrders(int loginUserId, String status) {

        List<Order> orderList = orderMapper.findMyOrders(loginUserId,status);

        return orderList;
    }
    // ----------------------------------------------------------

}
