package com.phm.shopping.dao;

import com.phm.shopping.domain.*;
import com.phm.shopping.util.VarUtil;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ProductDaoImpl implements ProductDao {

    @Autowired
    private SqlSession sqlSession;

    public List<ProductVO> getAllProducts() {
        return sqlSession.selectList("ProductMapper.getAllProducts");
    }

    public ProductVO getProductById(int productId) {
        Map<String, Integer> parameter = new HashMap<String, Integer>();
        parameter.put("productId", productId);
        return sqlSession.selectOne("ProductMapper.getProductById", parameter);
    }

    @Override
    public void insertProduct(ProductVO productVO) {
        sqlSession.insert("ProductMapper.insertProduct", productVO);
    }

    @Override
    public int updateProduct(ProductVO productVO) {
        return sqlSession.update("ProductMapper.updateProduct", productVO);
    }

    @Override
    public void deleteProduct(int productId) {
        sqlSession.delete("ProductMapper.deleteProduct", productId);
    }

    public List<CategoryVO> getCategories() {
        return sqlSession.selectList("ProductMapper.getCategories");
    }

    @Override
    public List<ProductWithPhotoVO> getProductsLateN(int count) {
        HashMap<String, Integer> parameter = new HashMap<>();
        parameter.put("count", count);
        return sqlSession.selectList("ProductMapper.getProductsLateN", parameter);
    }

    @Override
    public List<ProductWithPhotoVO> getProductsTopN(int count) {
        HashMap<String, Integer> parameter = new HashMap<>();
        parameter.put("count", count);
        return sqlSession.selectList("ProductMapper.getProductsTopN", parameter);
    }

    public List<ProductWithPhotoVO> getProductsByPage(int curPage) {
        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("limit", VarUtil.productSize);
        parameter.put("offset", (curPage - 1) * VarUtil.productSize);
        return sqlSession.selectList("ProductMapper.getProductsByPage", parameter);
    }

    public List<ProductWithPhotoVO> getProductsByCatAndPage(int categoryId, int curPage) {
        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("categoryId", categoryId);
        parameter.put("limit", VarUtil.productSize);
        parameter.put("offset", (curPage - 1) * VarUtil.productSize);
        return sqlSession.selectList("ProductMapper.getProductsByCatAndPage", parameter);
    }

    public int getProductCounts() {
        return sqlSession.selectOne("ProductMapper.getProductCounts");
    }

    public int getProductCountsByCategory(int categoryId) {
        Map<String, Integer> parameter = new HashMap<String, Integer>();
        parameter.put("categoryId", categoryId);
        return sqlSession.selectOne("ProductMapper.getProductCountsByCategory", parameter);
    }

    @Override
    public List<ProductWithCatVO> getProductsWithCat(int curPage, int pageSize) {
        Map<String, Integer> parameter = new HashMap<>();
        parameter.put("start", (curPage - 1) * pageSize);
        parameter.put("pageSize", pageSize);
        return sqlSession.selectList("ProductMapper.getProductsWithCat", parameter);
    }

    public ProductWithCatVO getProductDetailById(int productId) {
        Map<String, Integer> parameter = new HashMap<String, Integer>();
        parameter.put("productId", productId);
        return sqlSession.selectOne("ProductMapper.getProductDetailById", parameter);
    }

    @Override
    public ProductPhotoVO getProductPhotoById(int productId) {
        Map<String, Integer> parameter = new HashMap<String, Integer>();
        parameter.put("productId", productId);
        return sqlSession.selectOne("ProductMapper.getProductPhotoById", parameter);
    }

    @Override
    public void insertProductPhoto(ProductPhotoVO productPhotoVO) {
        sqlSession.insert("ProductMapper.insertProductPhoto", productPhotoVO);
    }

    @Override
    public List<CartWithProductInfoVO> getCartByUsername(String username) {
        Map<String, String> parameter = new HashMap<>();
        parameter.put("username", username);
        return sqlSession.selectList("ProductMapper.getCartByUsername", parameter);
    }

    @Override
    public List<OrderedProductVO> getProductsByOrderId(int orderId) {
        Map<String, Integer> parameter = new HashMap<>();
        parameter.put("orderId", orderId);
        return sqlSession.selectList("ProductMapper.getProductsByProductId", parameter);
    }

}
