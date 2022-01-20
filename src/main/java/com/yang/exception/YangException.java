package com.yang.exception;

import lombok.Data;

/**
 * 自定义异常
 * @author yang
 * @date Jan 12, 2022
 */
@Data
public class YangException extends RuntimeException {
	private static final long serialVersionUID = 1L;
	
    private String msg;
    private int code = 500;
    
    public YangException(String msg) {
		super(msg);
		this.msg = msg;
	}
	
	public YangException(String msg, Throwable e) {
		super(msg, e);
		this.msg = msg;
	}
	
	public YangException(String msg, int code) {
		super(msg);
		this.msg = msg;
		this.code = code;
	}
	
	public YangException(String msg, int code, Throwable e) {
		super(msg, e);
		this.msg = msg;
		this.code = code;
	}


}
