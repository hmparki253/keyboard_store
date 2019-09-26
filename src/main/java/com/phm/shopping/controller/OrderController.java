package com.phm.shopping.controller;

import com.phm.shopping.domain.*;
import com.phm.shopping.service.CartService;
import com.phm.shopping.service.OrderService;
import com.phm.shopping.service.ProductService;
import com.phm.shopping.util.VarUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Logger;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private CartService cartServiceImpl;

    @Autowired
    private OrderService orderServiceImpl;

    @Autowired
    private ProductService productServiceImpl;

    // 주문 뷰 (카트 인덱스 값이 들어있는 index들)
    // Principal로 인증 유무확인? -> SecurityConfig에서 처리하자
    // 유저회원이라해서 주문에 모두 접근할 수 있게 하면 안됨 -> 카트확인때 다시 한 번 username에 대한 확인절차가 필요하다
    private Logger logger = Logger.getLogger(getClass().getName());

    @GetMapping
    public String orderView(@RequestParam(value = "cartId") long[] cartId, Principal principal, Model model) {
        // 넘겨받은 cartIdx와 로그인한 계정으로 retrieve 시킨다.
        // retrieve 시킬 methods는 cartController 참고하자
        List<CartWithProductInfoVO> orders = new LinkedList<>();
        // 만약 empty list를 원한다면 orders = null이 아닌 위와같이 사용하자
        // stackoverflow에서 null일경우에는 referenced된다고함 그래서 add를 했을경우 null pointer exception이 발생했었다.

        for(long cartTemp : cartId) {
            orders.add(cartServiceImpl.getCartById((int)cartTemp));
        }

        model.addAttribute("orders", orders);
        return "order/process";
    }

    // POST
    // 주문목록에 데이터 넣기
    // 카트목록에서 해당 idx 삭제해주기
    @PostMapping("/placeOrder")
    public String placeOrder(@ModelAttribute OrderVO orderVO,
                             @RequestParam String[] cartId,
                             Principal principal,
                             RedirectAttributes redirectAttributes) {
        int orderId = 0;

        List<CartWithProductInfoVO> cartVOS = new ArrayList<>();
        orderVO.setUsername(principal.getName());
        orderVO.setRegDate(new Date());

        logger.info("전달받은 값을 확인해보자 " + orderVO.toString());

        for(String currentCart : cartId) {
            logger.info("전달받은 값을 확인해보자 " + currentCart);
        }

        for(String currentCart : cartId) {
            CartWithProductInfoVO temporalCartVO = cartServiceImpl.getCartById(Integer.parseInt(currentCart));
            if(temporalCartVO != null) {
                cartVOS.add(temporalCartVO);
            }
        }

        orderId = orderServiceImpl.placeOrder(orderVO, cartVOS);
        redirectAttributes.addAttribute("orderId", orderId);
        return "redirect:/order/complete";
    }

    @GetMapping("/complete")
    public String orderComplete(@RequestParam int orderId, Model model) {

        OrderVO orderVO = new OrderVO();
        List<OrderedProductVO> orderedProductVOS = new ArrayList<>();

        // orderId로 order_info 조회하기
        orderVO = orderServiceImpl.getOrderById(orderId);

        // orderId로 조인되어 걸러진 product List 조회하기
        orderedProductVOS = productServiceImpl.getProductsByOrderId(orderId);
        model.addAttribute("orderVO", orderVO);
        model.addAttribute("orderedProductVOS", orderedProductVOS);
        return "order/complete";
    }

    @GetMapping("/list")
    public String orderList(@RequestParam(value = "curPage", required = false, defaultValue = "1") int curPage, Principal principal, Model model) {
        String username = principal.getName();
        int paginationSize = VarUtil.paginationSize;
        int pageSize = VarUtil.productSize;

        List<TotalOrderInfoVO> totalOrderInfoVOS = orderServiceImpl.getTotalOrderInfoByUsername(username, curPage, paginationSize);
        int totalProductCount = orderServiceImpl.getTotalOrderCountByUsername(username);
        int totalPageCount = 0;
        int startPage = 0;
        int endPage = 0;

        totalPageCount = totalProductCount / pageSize;

        if(totalPageCount % pageSize > 0) {
            totalPageCount++;
        }

        if(totalPageCount < curPage) {
            curPage = totalPageCount;
        }

        startPage = ((curPage - 1) / 10) * 10 + 1;
        endPage = startPage + paginationSize - 1;

        if(endPage > totalPageCount) {
            endPage = totalPageCount;
        }

        model.addAttribute("username", username);
        model.addAttribute("orderInfos", totalOrderInfoVOS);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("curPage", curPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        return "order/list";
    }
}
