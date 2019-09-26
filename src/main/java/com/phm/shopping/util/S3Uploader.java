package com.phm.shopping.util;

import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Component
public class S3Uploader {

    @Autowired
    private AmazonS3Client amazonS3Client;

    @Value("${aws.credentials.bucket}")
    private String bucketName;

    private String uuid = UUID.randomUUID().toString();

    public void upload(MultipartFile multipartFile, String dirName, String changedName) throws IOException {
        changedName = dirName + File.separator + changedName;
        try {
            // 메타데이터에 대한 확실한 이해가 더 필요함
            ObjectMetadata objectMetadata = new ObjectMetadata();
            objectMetadata.setContentType(multipartFile.getContentType());
            objectMetadata.setContentLength(multipartFile.getSize());
            objectMetadata.setHeader("filename", changedName);
            PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, changedName, multipartFile.getInputStream(), objectMetadata);
            amazonS3Client.putObject(putObjectRequest);
        } catch (IOException ioe) {
            ioe.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String randNameGenerator(String originalFilename) {
        return uuid + "_" + originalFilename;
    }
}
