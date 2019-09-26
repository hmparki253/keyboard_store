package com.phm.shopping.controller;


import com.phm.shopping.domain.CategoryVO;
import com.phm.shopping.domain.ProductWithPhotoVO;
import com.phm.shopping.service.ProductService;
import com.phm.shopping.service.UtilService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.logging.Logger;

@Controller
public class HomeController {

    @Autowired
    private UtilService utilServiceImpl;
    @Autowired
    private ProductService productServiceImpl;

    private Logger logger = Logger.getLogger(getClass().getName());

    @GetMapping("/")
    public String index(Model model) {
        List<ProductWithPhotoVO> productsLate5 = productServiceImpl.getProductsLateN(4);
        List<ProductWithPhotoVO> productsTop5 = productServiceImpl.getProductsTopN(4);
        model.addAttribute("productsLate5", productsLate5);
        model.addAttribute("productsTop5", productsTop5);
        return "index";
    }

    @GetMapping("/s3")
    public void s3() { logger.info(utilServiceImpl.getBucketList().toString()); }
}
