package com.yang.vo;

import lombok.Data;

/**
 * 登录接口封装对象
 * @date Oct 29, 2018
 */
@Data
public class LoginBean {
	private String account;
	private String password;
	private String captcha;
}
