package com.yang.utils.upload;

import lombok.Data;
import org.json.JSONObject;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
@Data
public class VideoInfo {
	/**
	 * 上传步骤flag
	 */
	private int step = -1;

	/**
	 * 上传token
	 */
	private String upload_token;

	/**
	 * 上传服务器URI
	 */
	private String upload_server_uri;
	
	/**
	 * 上传服务器IP，用于commit、cancel
	 */
	private String upload_server_ip;
	
	/**
	 * 上传服务器IP，用于commit、cancel
	 */
	private JSONObject sliceInfo;
	
	/**
	 * check_result check视频状态返回JSON数据
	 */
	private  JSONObject check_result;
	
	/**
	 * 上传文件信息
	 * 
	 * @param file_name
	 * @param file_md5
	 * @param file_size
	 * @param title
	 * @param tags
	 */
	private HashMap <String,String> uploadInfo;


	/**
	 * 上传服务器的域名和数据中心
	 */
	private String endpoint;

	/**
	 * sts token
	 */
	private String security_token;

	/**
	 * oss bucket名字
	 */
	private String oss_bucket;

	/**
	 * oss key 上传时临时文件的名字
	 */
	private String oss_object;

	/**
	 * oss临时ak
	 */
	private String temp_access_id;

	/**
	 * oss临时as
	 */
	private String temp_access_secret;

	/**
	 * oss临时ak过期时间，换算成北京时间需要+8小时
	 */
	private String expire_time;

	public String getEndpoint() {
		return endpoint;
	}

	public void setEndpoint(String endpoint) {
		this.endpoint = endpoint;
	}

	public String getSecurity_token() {
		return security_token;
	}

	public void setSecurity_token(String security_token) {
		this.security_token = security_token;
	}

	public String getOss_bucket() {
		return oss_bucket;
	}

	public void setOss_bucket(String oss_bucket) {
		this.oss_bucket = oss_bucket;
	}

	public String getOss_object() {
		return oss_object;
	}

	public void setOss_object(String oss_object) {
		this.oss_object = oss_object;
	}

	public String getTemp_access_id() {
		return temp_access_id;
	}

	public void setTemp_access_id(String temp_access_id) {
		this.temp_access_id = temp_access_id;
	}

	public String getTemp_access_secret() {
		return temp_access_secret;
	}

	public void setTemp_access_secret(String temp_access_secret) {
		this.temp_access_secret = temp_access_secret;
	}

	public String getExpire_time() {
		return expire_time;
	}

	public void setExpire_time(String expire_time) {
		this.expire_time = expire_time;
	}

	public VideoInfo(HashMap<String,String> uploadInfo) {
		this.uploadInfo = uploadInfo;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public HashMap <String,String> getUploadInfo() {
		return uploadInfo;
	}

	public String getUploadInfo(String key) {
		
		return uploadInfo.containsKey(key) ? uploadInfo.get(key) : null;
	}

	public String getUploadServerUri() {
		return upload_server_uri;
	}

	public void setUploadServerUri(String upload_server_uri) {
		this.upload_server_uri = upload_server_uri;
	}


	public String getUploadToken() {
		return upload_token;
	}

	public void setUploadToken(String upload_token) {
		this.upload_token = upload_token;
	}

	public Boolean checkUploadInfo(File file) throws IOException, NoSuchAlgorithmException {
		if (file.exists() && file.isFile()) {
            String file_name = uploadInfo.get("file_name");
            uploadInfo.put("file_md5", FileUtil.md5(file_name));
            uploadInfo.put("file_size", String.valueOf(file.length()));
            uploadInfo.put("ext", file_name.substring(file_name.lastIndexOf(".") + 1));
            return true;
		} else {
			return false;
		}
	}

	public String getUploadServerIp() {
		return upload_server_ip;
	}

	public void setUploadServerIp(String upload_server_ip) {
		this.upload_server_ip = upload_server_ip;
	}
	
	public void setSliceInfo(JSONObject sliceInfo) {
		this.sliceInfo = sliceInfo;
	}
	
	public JSONObject getSliceInfo() {
		return sliceInfo;
	}
	
	public void setCheckResult(JSONObject checkResult) {
		this.check_result = checkResult;
	}
	
	public JSONObject getCheckResult() {
		return check_result;
	}
}
