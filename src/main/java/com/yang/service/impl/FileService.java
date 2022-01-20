package com.yang.service.impl;

import com.yang.entity.FileRecode;
import com.yang.mapper.slave.FileMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileService {
    @Autowired
    FileMapper fileMapper;

    public void insertFile(FileRecode fileupload) {
        fileMapper.insertFile(fileupload);
    }
}
