package com.phm.shopping.dao;

import com.phm.shopping.domain.OrderVO;
import com.phm.shopping.domain.OrderWithCountVO;
import com.phm.shopping.domain.TotalOrderInfoVO;

import java.util.List;

public interface OrderDao {
    int insert(OrderVO orderVO);
    void update(OrderVO orderVO);
    OrderVO getOrderById(int orderId);
    List<TotalOrderInfoVO> getTotalOrderInfoByUsername(String username, int curPage, int pageSize);
    List<OrderWithCountVO> getOrderWithCountPerPage(int curPage, int pageSize);
    int getTotalOrderCount();
    int getTotalOrderCountByUsername(String username);
}
