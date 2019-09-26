package com.phm.shopping.dao;

import com.phm.shopping.domain.AuthorityVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AuthorityDaoImpl implements AuthorityDao {

    @Autowired
    private SqlSession sqlSession;

    public void insertAuthority(AuthorityVO authorityVO) {
        sqlSession.insert("UserMapper.insertAuthority", authorityVO);
    }
}
