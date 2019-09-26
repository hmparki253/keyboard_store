package com.phm.shopping.controller;

import com.phm.shopping.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class ProductRestController {

    @Autowired
    ProductService productServiceImpl;

    @GetMapping("/quantityCheck")
    public Map<String, Object> quantityCheck(@RequestParam(value = "productId", required = true) int productId,
                                                @RequestParam(value = "quantity", required = true) int quantity) {
        Map<String, Object> map = new HashMap<>();
        boolean quantityFlag = productServiceImpl.checkProductQuantity(productId, quantity);
        map.put("quantityFlag", quantityFlag);
        return map;
    }
}
