package cn.edu.neu.service;

import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Order;
import cn.edu.neu.model.OrderDetail;

public interface OrderService {

    // ----------------------------- 8-8 -----------------------------
    int addOrder(Order order,List<OrderDetail> orderDetails);
    // ----------------------------------------------------------

    // ----------------------------- 8-11 -----------------------------
    Order getOrderDetailById(Integer orderId);
    // ----------------------------------------------------------
    // ----------------------------- 8-18 -----------------------------
    List<Order> getMyOrders(int loginUserId,String status);
    // ----------------------------------------------------------



}
