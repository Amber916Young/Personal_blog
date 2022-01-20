package com;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@MapperScan("com.yang.mapper")
@EnableDiscoveryClient
@SpringBootApplication(scanBasePackages={"com.yang"})
public class YangApplication {

    public static void main(String[] args) {
        SpringApplication.run(YangApplication.class, args);
    }

}
