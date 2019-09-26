package com.phm.shopping.controller;

import com.phm.shopping.domain.*;
import com.phm.shopping.service.OrderService;
import com.phm.shopping.service.ProductService;
import com.phm.shopping.util.VarUtil;
import com.sun.tools.corba.se.idl.constExpr.Or;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private ProductService productServiceImpl;

    @Autowired
    private OrderService orderServiceImpl;

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    // 마지막에 개발
    @GetMapping
    public String main(Model model) {
        // 대시보드 메인
        // 그래프로 보여주기
        // 보여줄 것 오늘 발생한 주문 건 수 -> order_info table 조회로 확인하기
        // 오늘 방문자 수 -> 우선은 메인 화면에 접근한 건수들을 체크하는 식으로 계산하기
        return "admin/index";
    }

    // 가장 처음
    @GetMapping("/product")
    public String product(@RequestParam(value = "curPage", defaultValue = "1", required = false) int curPage, Model model) {
        // 할 수 있어야 하는것
        // 상품목록보기
        int paginationSize = VarUtil.paginationSize; // 한 페이지에서 보여질 페이지네이션의 사이즈
        int pageSize = VarUtil.ADMIN_PRODUCT_SIZE; // 한 페이지에서 보여질 상품갯수
        int totalProductCount = 0;
        int totalPageCount = 0;
        int startPage = 0;
        int endPage = 0;

        List<ProductWithCatVO> productWithCatVOList = productServiceImpl.getProductsWithCat(curPage, pageSize);
        totalProductCount = productServiceImpl.getProductCounts();

        totalPageCount = totalProductCount / pageSize; // 전체 상품을 페이지당 보여질 상품수로 나눈다.

        if(totalPageCount % pageSize > 0) { // 만약 나머지가 있다면 페이지 값 증가
            totalPageCount++;
        }

        if(totalPageCount < curPage) { // 만약 현재페이지가 최대 페이지보다 크다면?
            curPage = totalPageCount; // 현재페이지를 최대페이지값으로 치환한다.
        }

        startPage = ((curPage - 1) / 10) * 10 + 1; // curPage에서 -1을 해주는 이유는 예를들어 curPage가 10일때를 가정하면
        // 10 / 10 -> 1 * 10 + 1 -> 11이 됨
        // 10 - 1 / 10 -> 0 * 1 + 1 -> 1이 됨
        endPage = startPage + paginationSize - 1;

        if(endPage > totalPageCount) {
            endPage = totalPageCount;
        }

        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("curPage", curPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("products", productWithCatVOList);
        return "admin/product/index";
    }

    // 1. 상품추가
    // - 상품 내용 적어서 업로드 및 파일 업로드 같이해주기
    // product / product_photo / category -> 총 3개의 테이블 조작 필요


    @GetMapping("/product/registration")
    public String registration(Model model) {
        // 상품등록 페이지
        // 카테고리 호출
        List<CategoryVO> categoryVOS = productServiceImpl.getCategories();
        model.addAttribute("categories", categoryVOS);
        return "admin/product/registration";
    }

    @PostMapping("/product/registration")
    public String registrationProc(ProductVO productVO,
                                   @RequestParam(value = "photoFile", required = false) MultipartFile multipartFile) throws IOException {
        String dirName = "shopping/product";
        logger.info("productVO넘어온값은? : " + productVO);
        logger.info("multipartFile의 값은? : " + multipartFile);
        productServiceImpl.insertProductAndPhoto(productVO, multipartFile, dirName);
        return "redirect:/admin/product";
    }

    // 두 번째
    @GetMapping("/order")
    public String order(@RequestParam(value = "curPage", defaultValue = "1", required = false) int curPage, Model model) {

        int paginationSize = VarUtil.paginationSize;
        int pageSize = VarUtil.ADMIN_PRODUCT_SIZE;
        List<OrderWithCountVO> orderWithCountVOS = orderServiceImpl.getOrderWithCountPerPage(curPage, pageSize);
        int totalOrderCount = orderServiceImpl.getTotalOrderCount();
        int totalPageCount = 0;
        int startPage = 0;
        int endPage = 0;

        totalPageCount = totalOrderCount / pageSize;

        if(totalPageCount % pageSize > 0) { // 만약 나머지가 있다면 페이지 값 증가
            totalPageCount++;
        }

        if(totalPageCount < curPage) { // 만약 현재페이지가 최대 페이지보다 크다면?
            curPage = totalPageCount; // 현재페이지를 최대페이지값으로 치환한다.
        }

        startPage = ((curPage - 1) / 10) * 10 + 1; // curPage에서 -1을 해주는 이유는 예를들어 curPage가 10일때를 가정하면
        // 10 / 10 -> 1 * 10 + 1 -> 11이 됨
        // 10 - 1 / 10 -> 0 * 1 + 1 -> 1이 됨
        endPage = startPage + paginationSize - 1;

        if(endPage > totalPageCount) {
            endPage = totalPageCount;
        }

        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("curPage", curPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("orders", orderWithCountVOS);
        return "admin/order/index";
    }

    @PutMapping("/order")
    @ResponseBody
    public Map<String, Boolean> orderUpdate(@RequestBody OrderVO orderVO) {
        orderServiceImpl.orderUpdate(orderVO);
        return Collections.singletonMap("success", true);
    }
}
