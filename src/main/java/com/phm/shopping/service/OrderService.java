package com.phm.shopping.service;

import com.phm.shopping.domain.*;

import java.util.List;

public interface OrderService {
    int placeOrder(OrderVO orderVO, List<CartWithProductInfoVO> cartVOS);
    void orderUpdate(OrderVO orderVO);
    OrderVO getOrderById(int orderId);

    List<TotalOrderInfoVO> getTotalOrderInfoByUsername(String username, int curPage, int pageSize);

    List<OrderWithCountVO> getOrderWithCountPerPage(int curPage, int pageSize);

    int getTotalOrderCount();
    int getTotalOrderCountByUsername(String username);
}
