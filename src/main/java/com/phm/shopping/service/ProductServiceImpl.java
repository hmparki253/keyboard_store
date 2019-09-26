package com.phm.shopping.service;

import com.phm.shopping.dao.ProductDao;
import com.phm.shopping.domain.*;
import com.phm.shopping.util.S3Uploader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Date;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService{

    @Autowired
    private ProductDao productDaoImpl;

    @Autowired
    private S3Uploader s3Uploader;

    public List<ProductVO> getAllProducts() {
        return productDaoImpl.getAllProducts();
    }

    public ProductVO getProductById(int productId) {
        return productDaoImpl.getProductById(productId);
    }

    // 상품 + - 버튼에서 주로 사용하는 service function
    public boolean checkProductQuantity(int productId, int quantity) {
        boolean quantityFlag = false;

        ProductVO productVO = new ProductVO();
        productVO = productDaoImpl.getProductById(productId);
        int inventory = productVO.getInventory();
        if(quantity <= 5) {
            if(inventory >= 1 && inventory >= quantity) quantityFlag = true;
        }

        return quantityFlag;
    }

    public int updateProduct(ProductVO productVO) {
        return productDaoImpl.updateProduct(productVO);
    }

    public List<CategoryVO> getCategories() {
        return productDaoImpl.getCategories();
    }

    @Override
    public List<ProductWithPhotoVO> getProductsLateN(int count) {
        return productDaoImpl.getProductsLateN(count);
    }

    @Override
    public List<ProductWithPhotoVO> getProductsTopN(int count) {
        return productDaoImpl.getProductsTopN(count);
    }

    public List<ProductWithPhotoVO> getProductsByPage(int curPage) {
        return productDaoImpl.getProductsByPage(curPage);
    }

    public List<ProductWithPhotoVO> getProductsByCatAndPage(int categoryId, int curPage) {
        return productDaoImpl.getProductsByCatAndPage(categoryId, curPage);
    }

    public int getProductCounts() {
        return productDaoImpl.getProductCounts();
    }

    public int getProductCountsByCategory(int categoryId) {
        return productDaoImpl.getProductCountsByCategory(categoryId);
    }

    public ProductWithCatVO getProductDetailById(int productId) {
        return productDaoImpl.getProductDetailById(productId);
    }

    @Override
    public List<ProductWithCatVO> getProductsWithCat(int curPage, int pageSize) {
        return productDaoImpl.getProductsWithCat(curPage, pageSize);
    }

    @Override
    public ProductPhotoVO getProductPhotoById(int productId) {
        return productDaoImpl.getProductPhotoById(productId);
    }

    @Override
    public List<OrderedProductVO> getProductsByOrderId(int orderId) {
        return productDaoImpl.getProductsByOrderId(orderId);
    }

    @Override
    @Transactional
    public void insertProductAndPhoto(ProductVO productVO, MultipartFile multipartFile, String dirName) throws IOException {
        String changedName = s3Uploader.randNameGenerator(multipartFile.getOriginalFilename());
        ProductPhotoVO productPhotoVO = new ProductPhotoVO();
        productVO.setRegDate(new Date());
        productDaoImpl.insertProduct(productVO);

        productPhotoVO.setOriginName(multipartFile.getOriginalFilename());
        productPhotoVO.setTitleCk(1);
        productPhotoVO.setProductId(productVO.getId()); // generated key 값을 넣어주자 1:n 관계이므로
        productPhotoVO.setRandName(changedName);
        productDaoImpl.insertProductPhoto(productPhotoVO);

        s3Uploader.upload(multipartFile, dirName, changedName);
    }
}
