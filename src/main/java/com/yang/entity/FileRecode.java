package com.yang.entity;

import lombok.Data;

@Data
public class FileRecode {
    private String fileType;
    private String fileName;
    private String fileUrl;
    private String mineType;
    private String originalName;
    private String upload_time;
    private String directory;
    private int aid;
}
