package com.phm.shopping.service;

import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.Bucket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UtilServiceImpl implements UtilService {

    @Autowired
    private AmazonS3Client amazonS3Client;

    // 버킷 리스트 조회
    public List<Bucket> getBucketList() {
        return amazonS3Client.listBuckets();
    }
}
