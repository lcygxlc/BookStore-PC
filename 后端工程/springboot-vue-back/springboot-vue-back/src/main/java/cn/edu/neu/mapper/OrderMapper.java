package cn.edu.neu.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Order;
import cn.edu.neu.model.OrderDetail;
@Mapper
public interface OrderMapper {

    // ----------------------------- 8-8 -----------------------
    void saveOrder(Order order);

    void saveOrderDetail(OrderDetail od);
    // ----------------------------------------------------------

    // ----------------------------- 8-11 -----------------------
    Order findOrderDetailById(Integer orderId);
    // ----------------------------------------------------------
    // ----------------------------- 8-18 -----------------------
    List<Order> findMyOrders(int userId,String status);
    // ----------------------------------------------------------


}
