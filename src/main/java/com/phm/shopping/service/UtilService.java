package com.phm.shopping.service;

import com.amazonaws.services.s3.model.Bucket;

import java.util.List;

public interface UtilService {
    public List<Bucket> getBucketList(); // 버킷 리스트 조회
}
