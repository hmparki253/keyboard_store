package com.phm.shopping.controller;

import com.phm.shopping.domain.CartWithProductInfoVO;
import com.phm.shopping.service.CartService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {
    // cart url 이하의 path들은 모두 로그인이 필요하다

    @Autowired
    private CartService cartServiceImpl;

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @GetMapping
    public String cart(Model model, Principal principal) {
        List<CartWithProductInfoVO> carts = cartServiceImpl.getCartByUsername(principal.getName());
        model.addAttribute("carts", carts);
        return "cart/list";
    }

    // spring security 접근제어가 필요
    @PostMapping("/{productId}")
    public void saveCart(@PathVariable(value = "productId", required = true) int productId,
                         @RequestParam(value = "quantity", required = false, defaultValue = "1") int quantity) {
        // 해당 제품의 id와 quantity를 cart 테이블에 저장한다
        // 해당 제품에서 뺄 수 있는지 체크해본다
        // 가능하다면
        // 해당 quantity 만큼 해당 제품의 stock에서 뺀다
        // 불가능하다면
        // err 메세지를 리턴해준다
    }
}
