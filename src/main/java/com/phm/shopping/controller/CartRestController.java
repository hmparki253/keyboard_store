package com.phm.shopping.controller;

import com.phm.shopping.domain.CartVO;
import com.phm.shopping.service.CartService;
import com.phm.shopping.service.ProductAndCartService;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.Date;

@RestController
public class CartRestController {

    @Autowired
    private CartService cartServiceImpl;
    @Autowired
    private ProductAndCartService productAndCartServiceImpl;

    @GetMapping("/getCartCount")
    public int getCartCount(Principal principal) {
        return (cartServiceImpl.getCartByUsername(principal.getName())).size();
    }

    // 자원의 일부를 바꾸는 proc이므로 patch가 맞다
    @GetMapping("/cartQuantityProc")
    public boolean cartQuantityProc(int cartId, boolean flag) {
        return productAndCartServiceImpl.updateProductAndCart(cartId, flag);
    }

    // patch는 자원의 일부만 바꿀때 쓰자
    @PatchMapping("/changeOrderCheck")
    public boolean changeOrderCheck(int cartId, int orderCheck) {
        boolean flag = false;
        if(orderCheck == 1) {
            orderCheck = 0;
        } else {
            orderCheck = 1;
        }
        int updateResult = cartServiceImpl.updateCartOrderCheck(cartId, orderCheck);
        if(updateResult != 0) {
            flag = true;
        }
        return flag;
    }

    @PostMapping("/addCart")
    public boolean addCart(CartVO cartVO, Principal principal) {
        // 간과한것
        // product_info에서 해당 quantity만큼 inventory에서 빼기

        boolean flag = false;

        cartVO.setUsername(principal.getName());
        cartVO.setRegDt(new Date());

        int insertResult = cartServiceImpl.insertCartAndMinusProduct(cartVO);
        if(insertResult != 0) {
            flag = true;
        }
        return flag;
    }


    @DeleteMapping("/deleteCart")
    public boolean deleteCart(CartVO cartVO, Principal principal) {

        boolean flag = false;

        cartVO.setUsername(principal.getName());

        int deleteResult = cartServiceImpl.deleteCartAndAddProduct(cartVO);
        if(deleteResult != 0) {
            flag = true;
        }

        return flag;
        // return 하면서 해당 page reload가 맞는지 아니면 해당 row를 바로 삭제하는것을 보여줄지를 확인해봐야한다
        // 알라딘 같은 사이트는 reload 없이 바로 해당 행을 삭제하는 방식으로 가져가므로 나도 그렇게 하자
    }
}
