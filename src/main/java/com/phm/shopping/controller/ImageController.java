package com.phm.shopping.controller;

import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.GeneratePresignedUrlRequest;
import com.amazonaws.util.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.logging.Logger;

@Controller
public class ImageController {
    // 이 클래스를 컨트롤러로 뺀게 잘한것인지 잘 모르겠음
    private Logger logger = Logger.getLogger(getClass().getName());

    @Autowired
    private AmazonS3Client amazonS3Client;

    @ResponseBody
    @RequestMapping(value = "/displayImage")
    public ResponseEntity<byte[]> displayImage(String fileName, String directory) throws Exception {
        InputStream inputStream = null;
        ResponseEntity<byte[]> entity = null;
        HttpURLConnection httpURLConnection = null;

        if(directory.equals("product")) {
            directory = "shopping/product/";
        }
        // 1. 해당 파일의 url 얻기
        // 2. HttpUrlConnection을 이용해서 openConnection 시키기
        // 3. inputStream에 해당하는 스트림 넣어주기
        try {
            HttpHeaders httpHeaders = new HttpHeaders();
            URL url;
            try {
                url = new URL(getFileUrl("hmparki253bucket",directory + fileName,amazonS3Client));
                httpURLConnection = (HttpURLConnection) url.openConnection();
                inputStream = httpURLConnection.getInputStream();
            } catch(Exception e) {
                e.printStackTrace();
            }
            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(inputStream), httpHeaders, HttpStatus.CREATED);
        } catch(Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        } finally {
            inputStream.close();
        }
        // 4. Entity에 byteArray로 데이터 담고 헤더 설정해주기
        // 5. 엔티티 리턴해주기
        return entity;
    }

    public String getFileUrl(String bucketName, String fileName, AmazonS3Client amazonS3Client) {
        String imgName = (fileName).replace(File.separatorChar, '/');
        return amazonS3Client.generatePresignedUrl(new GeneratePresignedUrlRequest(bucketName, imgName)).toString();
    }
}
