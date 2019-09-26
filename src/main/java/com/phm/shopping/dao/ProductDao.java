package com.phm.shopping.dao;

import com.phm.shopping.domain.*;

import java.util.List;

public interface ProductDao {
    List<ProductVO> getAllProducts();
    ProductVO getProductById(int productId);
    void insertProduct(ProductVO productVO);
    int updateProduct(ProductVO productVO);
    void deleteProduct(int productId);
    List<CategoryVO> getCategories();
    List<ProductWithPhotoVO> getProductsLateN(int count);
    List<ProductWithPhotoVO> getProductsTopN(int count);
    List<ProductWithPhotoVO> getProductsByPage(int curPage);
    List<ProductWithPhotoVO> getProductsByCatAndPage(int categoryId, int curPage);
    int getProductCounts();
    int getProductCountsByCategory(int categoryId);
    List<ProductWithCatVO> getProductsWithCat(int curPage, int pageSize);
    ProductWithCatVO getProductDetailById(int productId);
    ProductPhotoVO getProductPhotoById(int productId);
    void insertProductPhoto(ProductPhotoVO productPhotoVO);
    // 카트
    List<CartWithProductInfoVO> getCartByUsername(String username);
    // order_product와 조인된 결과를 return하는 메소드
    List<OrderedProductVO> getProductsByOrderId(int orderId);
}
