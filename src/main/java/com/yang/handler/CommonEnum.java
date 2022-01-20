package com.yang.handler;


public enum CommonEnum implements BaseErrorInfoInterface {
    // 数据操作错误定义
    SUCCESS("200", "successful!"),
    BODY_NOT_MATCH("400", "The requested data format is not correct!"),
    SIGNATURE_NOT_MATCH("401", "The requested digital signature does not match!"),
    NOT_FOUND("404", "The resource was not found!"),
    INTERNAL_SERVER_ERROR("500", "Server internal error!"),
    SERVER_BUSY("503", "The server is busy. Please try again later!");

    /**
     * 错误码
     */
    private String resultCode;

    /**
     * 错误描述
     */
    private String resultMsg;

    CommonEnum(String resultCode, String resultMsg) {
        this.resultCode = resultCode;
        this.resultMsg = resultMsg;
    }

    @Override
    public String getResultCode() {
        return resultCode;
    }

    @Override
    public String getResultMsg() {
        return resultMsg;
    }

}

