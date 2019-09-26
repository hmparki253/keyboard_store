package com.phm.shopping.test;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.phm.shopping.config.AppConfig;
import com.phm.shopping.config.DataConfig;
import com.phm.shopping.config.S3Config;
import com.phm.shopping.dao.CartDao;
import com.phm.shopping.dao.OrderDao;
import com.phm.shopping.dao.OrderProductDao;
import com.phm.shopping.dao.ProductDao;
import com.phm.shopping.domain.OrderVO;
import com.phm.shopping.domain.ProductPhotoVO;
import com.phm.shopping.domain.ProductVO;
import com.phm.shopping.service.OrderService;
import com.phm.shopping.service.ProductService;
import com.phm.shopping.service.UtilService;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import java.io.InputStream;
import java.util.Date;
import java.util.logging.Logger;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {AppConfig.class, DataConfig.class})
//@PropertySource("classpath*:aws-s3-configuration.properties")
@WebAppConfiguration
public class DatabaseTest {

    private Logger logger = Logger.getLogger(getClass().getName());

//    @Value("${aws.credentials.accessKey}")
//    private String accessKey;
//
//    @Value("${aws.credentials.secretKey}")
//    private String secretKey;
//
//    private BasicAWSCredentials basicAWSCredentials = new BasicAWSCredentials(accessKey, secretKey);
//    private AmazonS3Client amazonS3Client = (AmazonS3Client) AmazonS3ClientBuilder.standard()
//            .withRegion(Regions.AP_NORTHEAST_2)
//            .withCredentials(new AWSStaticCredentialsProvider(basicAWSCredentials))
//            .build();

    @Autowired
    private OrderProductDao orderProductDaoImpl;

    @Autowired
    private ProductService productService;

    @Autowired
    private CartDao cartDaoImpl;

    @Autowired
    private OrderService orderService;
//
//    @Autowired
//    private ProductDao productDaoImpl;
//
//    @Autowired
//    private ProductService productServiceImpl;

//    @Test
//    public void patchMethodTest() {
//        OrderVO orderVO = new OrderVO(21,1,1,"523514905512");
//        logger.info("=========================================");
//        logger.info("=========================================");
//        logger.info(orderVO.toString());
//        logger.info("=========================================");
//        logger.info("=========================================");
//        orderService.orderUpdate(orderVO);
//    }

//    @Test
//    public void insertProductAndPhoto() {
//        ProductVO productVO = new ProductVO("레오폴드 키캡풀러", "레오폴드에서 제작한 키캡풀러입니다.", 15000, 100, new Date(), 4, 10);
//        ProductPhotoVO productPhotoVO = new ProductPhotoVO("tvUwRcF.png", 1, "nautilus.png");
//        productService.insertProductAndPhoto(productVO, productPhotoVO);
//    }




    // aws connection test
//    @Test
//    public void awsConnectionTest() {
//        logger.info(amazonS3Client.listBuckets().toString());
//    }


//    @Test
//    public void testMybatis() {
        // 해당 코드를 java config로 변경해서 처리를 해보자
//        String resource = "mybatis/config/mybatis-config.xml";
//        InputStream inputStream = Resources.getResourceAsStream(resource);
//        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
//
//        SqlSession session = sqlSessionFactory.openSession();
//          List<ProductVO> product = productServiceImpl.getAllProducts();
//          logger.info("hello: "+product);
//    }

    // order insert 테스트
//    @Test
//    public void testInsertOrder() throws Exception {
//        OrderVO orderVO = new OrderVO("hmparki253",
//                "박현민","01050685345","강원 춘천시 삼천동","장고개길 7","24428","부재시 연락주세요",500000,0,0,0, new Date());
//        orderDaoImpl.insert(orderVO);
//        logger.info("이놈의 아이디값은 : "+orderVO.getId());
//    }

    // orderProduct insert 테스트
//    @Test
//    public void testInsertOrderProduct() throws Exception {
//        orderProductDaoImpl.insert(5,12,3);
//    }

    // 해당하는 카트 삭제하기
    @Test
    public void testDeleteCartById() throws Exception {
        cartDaoImpl.deleteCartById(3);
    }


//    @Test
//    public void testMybatisInsert() throws Exception {
//        String resource ="mybatis/config/mybatis-config.xml";
//        InputStream inputStream = Resources.getResourceAsStream(resource);
//        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
//
//        SqlSession session = sqlSessionFactory.openSession();
//
//        try {
//            session.insert("ProductMapper.insertProduct",
//                    new ProductVO("이젠 한글이 될 때도...","이건 젠장할놈의 키보드라고!",150000,100));
//            session.commit();
//        } catch(Exception e) {
//            logger.info("어이 씨벌 이거 뭐여 ㅡㅡ");
//        } finally {
//            session.close();
//        }
//    }
}
