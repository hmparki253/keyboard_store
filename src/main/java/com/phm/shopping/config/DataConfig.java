package com.phm.shopping.config;


import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.mchange.v2.c3p0.PooledDataSource;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.TransactionManagementConfigurer;

import javax.sql.DataSource;
import java.beans.PropertyVetoException;
import java.io.InputStream;
import java.util.Properties;

@Configuration
@PropertySource("classpath:myconnection-mysql.properties")
@EnableTransactionManagement
public class DataConfig implements TransactionManagementConfigurer {

    @Value("${jdbc.driver}")
    private String driver;
    @Value("${jdbc.url}")
    private String url;
    @Value("${jdbc.user}")
    private String user;
    @Value("${jdbc.password}")
    private String password;
    @Value("${connection.pool.initialPoolSize}")
    private int initialPoolSize;
    @Value("${connection.pool.minPoolSize}")
    private int minPoolSize;
    @Value("${connection.pool.maxPoolSize}")
    private int maxPoolSize;
    @Value("${connection.pool.maxIdleTime}")
    private int maxIdleTime;

    private String resource = "mybatis/config/mybatis-config.xml";
    private String mappers = "classpath*:mybatis/mapper/*.xml";

    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        // 수정 후

        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource());
        Resource[] mapperResources = new PathMatchingResourcePatternResolver().getResources(mappers);
        sqlSessionFactoryBean.setMapperLocations(mapperResources);
        Resource configResource = new PathMatchingResourcePatternResolver().getResource(resource);
        sqlSessionFactoryBean.setConfigLocation(configResource);

        // 필요한 것들
        // 1. mapUnderscoreToCamelCase : true
        // 2. datasource
        // 3. mapper설정

        // -- 수정 전의 부분
//        InputStream inputStream = Resources.getResourceAsStream(resource);
//        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
//        return sqlSessionFactory;
        // -------------------
        // 수정전의 부분이 문제였던 이유는 아래에 빈으로 명시한 dataSource를 사용하는 것이 아니라
        // xml상에 표기된 datasource를 사용하고 있었기 때문으로 추측된다.


        return sqlSessionFactoryBean.getObject();
    }
    // -- 해결에 대한 실마리 --
    // 내가 쓰고있는 sqlSessionFactory는 전혀 내가 아래에 명시한 datasource를 이용하지 않는다
    // 사실 이 곳에 명시한 datasource를 이용해야 transaction이 작동할것같은데
    // 참고할곳
    // https://stackoverflow.com/questions/40080121/how-can-i-convert-mybatis-setting-to-java-base-config
    // https://www.baeldung.com/mybatis

    @Bean
    public SqlSession sqlSession() throws Exception {
        return sqlSessionFactory().openSession();
    }

    // 스프링 시큐리티를 위한 datasource
    // 추후에는 mybatis도 java config로 변경해주자...
    @Bean
    public DataSource dataSource() {
        ComboPooledDataSource dataSource = new ComboPooledDataSource();

        try {
            dataSource.setDriverClass(driver);
        } catch (PropertyVetoException exc){
            throw new RuntimeException(exc);
        }

        dataSource.setJdbcUrl(url);
        dataSource.setUser(user);
        dataSource.setPassword(password);

        dataSource.setInitialPoolSize(initialPoolSize);
        dataSource.setMinPoolSize(minPoolSize);
        dataSource.setMaxPoolSize(maxPoolSize);
        dataSource.setMaxIdleTime(maxIdleTime);

        // MySql의 끊기는 문제를 해결하기 위하여 넣은 구문
        dataSource.setIdleConnectionTestPeriod(300);
        dataSource.setTestConnectionOnCheckout(true);
        dataSource.setPreferredTestQuery("SELECT 1");

        return dataSource;
    }

    @Override
    public PlatformTransactionManager annotationDrivenTransactionManager() {
        return new DataSourceTransactionManager(dataSource());
    }
}
