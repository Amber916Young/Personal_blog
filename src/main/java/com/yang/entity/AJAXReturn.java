package com.yang.entity;

import com.alibaba.fastjson.JSONObject;
import com.yang.handler.BaseErrorInfoInterface;
import com.yang.handler.CommonEnum;
import lombok.Data;

import java.util.HashMap;
import java.util.List;

@Data
public class AJAXReturn extends HashMap<String, Object> {
    /**
     * 响应代码
     */
    private String code;

    /**
     * 响应消息
     */
    private String msg;

    /**
     * 响应结果
     */
    private Object result;
    private int count;

    public AJAXReturn() {
    }

    public AJAXReturn(BaseErrorInfoInterface errorInfo) {
        this.code = errorInfo.getResultCode();
        this.msg = errorInfo.getResultMsg();
    }
    /**
     * 成功
     * @return
     */
    public static AJAXReturn success() {
        return success(null);
    }

    /**
     * 成功
     * @param data
     * @return
     */
    public static AJAXReturn success(Object data) {
        AJAXReturn rb = new AJAXReturn();
        rb.setCode(CommonEnum.SUCCESS.getResultCode());
        rb.setMsg(CommonEnum.SUCCESS.getResultMsg());
        rb.setResult(data);
        return rb;
    }
    public static AJAXReturn success(Object data,String msg) {
        AJAXReturn rb = new AJAXReturn();
        rb.setCode(CommonEnum.SUCCESS.getResultCode());
        rb.setMsg(msg);
        rb.setResult(data);
        return rb;
    }
    /**
     * 失败
     */
    public static AJAXReturn error(BaseErrorInfoInterface errorInfo) {
        AJAXReturn rb = new AJAXReturn();
        rb.setCode(errorInfo.getResultCode());
        rb.setMsg(errorInfo.getResultMsg());
        rb.setResult(null);
        return rb;
    }

    /**
     * 失败
     */
    public static AJAXReturn error(String code, String message) {
        AJAXReturn rb = new AJAXReturn();
        rb.setCode(code);
        rb.setMsg(message);
        rb.setResult(null);
        return rb;
    }

    /**
     * 失败
     */
    public static AJAXReturn error( String message) {
        AJAXReturn rb = new AJAXReturn();
        rb.setCode("-1");
        rb.setMsg(message);
        rb.setResult(null);
        return rb;
    }


    @Override
    public String toString() {
        return JSONObject.toJSONString(this);
    }

    public static AJAXReturn success(String msg,Object data,int count) {
        AJAXReturn rb = new AJAXReturn();
        rb.setCode(CommonEnum.SUCCESS.getResultCode());
        rb.setMsg(msg);
        rb.setResult(data);
        rb.setCount(count);
        return rb;
    }
}
