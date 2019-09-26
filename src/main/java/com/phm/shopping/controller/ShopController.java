package com.phm.shopping.controller;

import com.phm.shopping.domain.*;
import com.phm.shopping.service.ProductService;
import com.phm.shopping.util.VarUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/shop")
public class ShopController {

    @Autowired
    private ProductService productServiceImpl;

    @GetMapping("/list")
    public String productList(@RequestParam(value = "category", required = false, defaultValue = "0") int category,
                              @RequestParam(value = "curPage", required = false, defaultValue = "1") int curPage,
                              Model model) {
        int pagenationSize = VarUtil.paginationSize;    // 한 페이지에서 보여질 pagenation의 사이즈
        int productSize = VarUtil.productSize;          // 한 페이지에서 보여질 물품들의 사이즈

        List<CategoryVO> categories = productServiceImpl.getCategories();
        List<ProductWithPhotoVO> products = null;
        int totalCount = 0;                             // 총 물품 수

        if(category == 0) {
            products = productServiceImpl.getProductsByPage(curPage);
            totalCount = productServiceImpl.getProductCounts();
        } else {
            products = productServiceImpl.getProductsByCatAndPage(category, curPage);
            totalCount = productServiceImpl.getProductCountsByCategory(category);
        }

        int categorySum = categories.stream().mapToInt(obj -> obj.getCnt()).sum();

        int totalPageCount = (int) (((totalCount - 1) / productSize) + 1);

        int startPage = ((curPage - 1) / pagenationSize) * pagenationSize + 1;
        int endPage = Math.min(startPage + pagenationSize - 1, totalPageCount);

        boolean isPre = startPage != 1;
        boolean isNext = endPage < totalPageCount;

        model.addAttribute("categories", categories);
        model.addAttribute("categorySum", categorySum);
        model.addAttribute("category", category+"");
        model.addAttribute("products", products);
        model.addAttribute("totalCount", totalCount);

        // pagenation 관련 attribute
        model.addAttribute("curPage", curPage);
        model.addAttribute("startPage",startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("isPre", isPre);
        model.addAttribute("isNext", isNext);

        return "shop/list";
    }

//    @GetMapping("/description/{productId}")
    // 전달될 값 : 제품번호, 현재 selected되어있는 카테고리 id, 현재 페이지 값 curPage
    @GetMapping("/description/{productId}")
    public String description(@PathVariable(value = "productId", required = true) int productId,
                              @RequestParam(value = "category", required = false, defaultValue = "0") int category,
                              @RequestParam(value = "curPage", required = false, defaultValue = "1") int curPage,
                              Model model) {
        List<CategoryVO> categories = productServiceImpl.getCategories(); // 카테고리 obj들
        int categorySum = categories.stream().mapToInt(obj -> obj.getCnt()).sum();  // 전체 합
        ProductWithCatVO product = productServiceImpl.getProductDetailById(productId);
        ProductPhotoVO productPhoto = productServiceImpl.getProductPhotoById(productId);

        model.addAttribute("categories", categories);
        model.addAttribute("categorySum", categorySum);
        model.addAttribute("product", product);
        model.addAttribute("category",category+"");
        model.addAttribute("productPhoto", productPhoto);

        return "shop/description";
    }

}
