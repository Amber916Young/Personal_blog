//package com.yang.utils.upload;
//
//import org.apache.log4j.Logger;
//import org.json.JSONException;
//import org.json.JSONObject;
//
//import java.io.File;
//import java.io.IOException;
//import java.net.URISyntaxException;
//import java.util.HashMap;
//
//public class YoukuUploader {
//
//	private Logger logger = Logger.getLogger(YoukuUploader.class);
//
//	private final int STEP_CREATE = 1;
//	private final int STEP_CREATE_FILE = 2;
//	private final int STEP_NEW_SLICE = 3;
//	private final int STEP_UPLOAD_SLICE = 4;
//	private final int STEP_CHECK = 5;
//	private final int STEP_COMMIT = 6;
//
//	/**
//	 * OAuth2 授权
//	 */
//	private String access_token = null;
//
//	private Api api = null;
//
//	private VideoInfo videoInfo = null;
//
//	private Util uploadUtil = new Util();
//
//	public YoukuUploader(String client_id, String client_secret) {
//		api = new Api(client_id, client_secret);
//	}
//
//	private void uploadToken(HashMap<String, String> params, HashMap<String, String> uploadInfo, File file) {
//		String result = "";
//		JSONObject jsonResult = null;
//		try {
//			if (params.isEmpty() || uploadInfo.isEmpty()) {
//				logger.error(uploadUtil.getErrorMsg(Config.ERROR_TYPE_SYSTEM, Config.ERROR_10017, 10017));
//				return;
//			}
//			if (params.get("access_token") == null && (params.get("username") == null || params.get("password") == null)) {
//				logger.error(uploadUtil.getErrorMsg(Config.ERROR_TYPE_SYSTEM, Config.ERROR_10017, 10017));
//				return;
//			}
//			if (uploadInfo.get("title") == null || uploadInfo.get("tags") == null || uploadInfo.get("file_name") == null) {
//				logger.error(uploadUtil.getErrorMsg(Config.ERROR_TYPE_SYSTEM, Config.ERROR_10017, 10017));
//				return;
//			}
//			//使用oss上传方式
//			uploadInfo.put("isnew", "1");
//			videoInfo = new VideoInfo(uploadInfo);
//			// 文件不存在
//			if (!videoInfo.checkUploadInfo(file)) {
//				logger.error(uploadUtil.getErrorMsg(Config.ERROR_TYPE_FILE_NOT_FOUND, Config.ERROR_20028, 20028));
//				return;
//			}
//			if (params.get("access_token") != null && params.get("access_token") != "") {
//				access_token = params.get("access_token");
//			} else {
//			    logger.error(uploadUtil.getErrorMsg(Config.ERROR_TYPE_SYSTEM, Config.ERROR_10017, 10017));
//                return;
//			}
//			if (access_token != null) {
//				// create
//				videoInfo.setStep(STEP_CREATE);
//				result = api.create(access_token, uploadInfo);
//				jsonResult = new JSONObject(result);
//				videoInfo.setEndpoint("http://" + jsonResult.getString("endpoint"));
//				videoInfo.setSecurity_token(jsonResult.getString("security_token"));
//				videoInfo.setOss_bucket(jsonResult.getString("oss_bucket"));
//				videoInfo.setOss_object(jsonResult.getString("oss_object"));
//				videoInfo.setTemp_access_id(jsonResult.getString("temp_access_id"));
//				videoInfo.setTemp_access_secret(jsonResult.getString("temp_access_secret"));
//				videoInfo.setExpire_time(jsonResult.getString("expire_time"));
//				videoInfo.setUploadToken(jsonResult.getString("upload_token"));
////				videoInfo.setUploadServerUri(uploadUtil.getIp(jsonResult.getString("upload_server_uri")));
//				logger.info("create to Youku, result:" + result);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			logger.error("create to Youku occur JSONException:" + e);
//		}
//	}
//
//	private String createFile() throws IOException {
//		videoInfo.setStep(STEP_CREATE_FILE);
//		String result = api.create_file(videoInfo.getUploadToken(), videoInfo.getUploadInfo("file_size"), videoInfo.getUploadInfo("ext"), videoInfo.getUploadServerUri());
//		logger.info("create_file to Youku, result:" + result);
//		return result;
//	}
//
//	private String newSlice() throws IOException, URISyntaxException, JSONException {
//		JSONObject jsonResult;
//		videoInfo.setStep(STEP_NEW_SLICE);
//		String result = api.new_slice(videoInfo.getUploadToken(), videoInfo.getUploadServerUri());
//		logger.info("new_slice to Youku, result:" + result);
//		jsonResult = new JSONObject(result);
//		videoInfo.setSliceInfo(jsonResult);
//		return result;
//	}
//
//	private boolean uploadSlice(String filename, boolean progress) {
//		String result = "", checkR = "";
//		JSONObject jsonResult, sliceInfo, checkResult;
//		HashMap<String, String> slice = new HashMap<String, String>();
//		byte[] data;
//		boolean finished = false;
//		Integer slice_task_id = 0, status;
//		Integer length = 0, i=0;
//		long transferred = 0, offset = 0;
//		videoInfo.setStep(STEP_UPLOAD_SLICE);
//		try {
//			do {
//			    i++;
//				sliceInfo = videoInfo.getSliceInfo();
//				System.out.println("upload slice:" + sliceInfo);
//				slice_task_id = sliceInfo.getInt("slice_task_id");
//				transferred = getProgress(videoInfo.getUploadInfo("file_size"), sliceInfo.getLong("transferred"));
//				offset = sliceInfo.getLong("offset");
//				length = sliceInfo.getInt("length");
//
//				data = FileUtil.getSliceBytes(filename, offset, length);
//				slice.put("slice_task_id", slice_task_id + "");
//				slice.put("offset", offset + "");
//				slice.put("length", length + "");
//				result = api.upload_slice(videoInfo.getUploadToken(), videoInfo.getUploadServerUri(), slice, data);
//				logger.info("upload_slice to Youku, result:" + result);
//				jsonResult = new JSONObject(result);
//				videoInfo.setSliceInfo(jsonResult);
//				if (jsonResult.getInt("slice_task_id") == 0) {
//					videoInfo.setStep(STEP_CHECK);
//					do {
//						checkR = api.check(videoInfo.getUploadToken(), videoInfo.getUploadServerUri());
//						checkResult = new JSONObject(checkR);
//						videoInfo.setUploadServerIp(checkResult.getString("upload_server_ip"));
//						videoInfo.setCheckResult(checkResult);
//						status = checkResult.getInt("status");
//						finished = checkResult.getBoolean("finished");
//						if (status == 1) {
//							transferred = 100;
//							break;
//						} else if (status == 2 || status == 3) {
//							transferred = checkResult.getInt("confirmed_percent");
//							try {
//								Thread.sleep(Config.SLEEPTIME);
//							} catch (Exception e) {
//								logger.error(e.getMessage() + "Sleep");
//							}
//						}
//						logger.info("upload progress:" + transferred + "%");
//					} while (true);
//				}
//				if (progress && i>1) {
//					System.out.println("Upload progress: " + transferred + "%");
//				}
//			} while (!finished);
//		} catch (Exception e) {
//			logger.error("upload_slice error:" + e);
//		}
//		return finished;
//	}
//
//	private String commit() {
//		String result = "";
//		try {
//			videoInfo.setStep(STEP_COMMIT);
//			result = api.commit(access_token, videoInfo.getUploadToken());
//			//result = api.commit(access_token, videoInfo.getUploadToken(), videoInfo.getUploadServerIp());
//			logger.info("commit to Youku, result:" + result);
//		} catch (Exception e) {
//			e.printStackTrace();
//			logger.error("commit error:", e);
//		}
//		return result;
//	}
//
//	private int getProgress(String file_size, long transferred) {
//		return (int) (transferred * 100 / Long.valueOf(file_size));
//	}
//
//	private void shutdown() {
//		uploadUtil.shutdown();
//	}
//
//	private void updateVersion() {
//		String result = "";
//		try {
//			result = api.update_version(Config.CATEGORY, Config.TYPE, Config.VERSION);
//			logger.info("update version of sdk, result:" + result);
//		} catch (Exception e) {
//			e.printStackTrace();
//			logger.error("updateVersion error:", e);
//		}
//
//	}
//
//	public String upload(HashMap<String, String> params, HashMap<String, String> uploadInfo, String filename, boolean progress) {
//		String result = "";
//		JSONObject jsonResult;
//		try {
//			//updateVersion();
//			File uploadFile = new File(filename);
//			uploadToken(params, uploadInfo, uploadFile);
//			result = videoInfo.getUploadToken();
//			if (null != result && !result.isEmpty()) {
//				//初始化OSS，开始上传
//				new MultipartUpload().start(videoInfo);
//				//commit
//				result = commit();
//
////				result = createFile();
////				jsonResult = new JSONObject(result);
////				if (!jsonResult.has("error")) {
////					result = newSlice();
////					jsonResult = new JSONObject(result);
////					if (!jsonResult.has("error")) {
////						if (uploadSlice(filename, progress)) {
////						    result = commit();
////						}
////					}
////				}
//			}
//			shutdown();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			logger.error("upload error:", e);
//		}
//		return result;
//	}
//
//    public static void main(String[] args) {
//    }
//}
