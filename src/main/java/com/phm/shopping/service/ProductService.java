package com.phm.shopping.service;

import com.phm.shopping.domain.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface ProductService {
    List<ProductVO> getAllProducts();
    ProductVO getProductById(int productId);
    boolean checkProductQuantity(int productId, int quantity);
    int updateProduct(ProductVO productVO);
    List<CategoryVO> getCategories();
    List<ProductWithPhotoVO> getProductsLateN(int count);
    List<ProductWithPhotoVO> getProductsTopN(int count);
    List<ProductWithPhotoVO> getProductsByPage(int curPage);
    List<ProductWithPhotoVO> getProductsByCatAndPage(int categoryId, int curPage);
    int getProductCounts();
    int getProductCountsByCategory(int categoryId);
    ProductWithCatVO getProductDetailById(int productId);
    List<ProductWithCatVO> getProductsWithCat(int curPage, int pageSize);
    ProductPhotoVO getProductPhotoById(int productId);
    // order_product와 조인된 결과를 return하는 메소드
    List<OrderedProductVO> getProductsByOrderId(int orderId);
    void insertProductAndPhoto(ProductVO productVO, MultipartFile multipartFile, String dirName) throws IOException;
}
