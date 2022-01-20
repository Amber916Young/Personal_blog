package com.yang.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yang.mapper.master.SysLoginLogMapper;
import com.yang.entity.SysLoginLog;
import com.yang.service.SysLoginLogService;
import com.yang.page.MybatisPageHelper;
import com.yang.page.PageRequest;
import com.yang.page.PageResult;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SysLoginLogServiceImpl  implements SysLoginLogService {

	@Autowired
	private SysLoginLogMapper sysLoginLogMapper;

	@Override
	public int save(SysLoginLog record) {
		if(record.getId() == null || record.getId() == 0) {
			return sysLoginLogMapper.insertSelective(record);
		}
		return sysLoginLogMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int delete(SysLoginLog record) {
		return sysLoginLogMapper.deleteByPrimaryKey(record.getId());
	}

	@Override
	public int delete(List<SysLoginLog> records) {
		for(SysLoginLog record:records) {
			delete(record);
		}
		return 1;
	}

	@Override
	public SysLoginLog findById(Long id) {
		return sysLoginLogMapper.selectByPrimaryKey(id);
	}

	@Override
	public PageResult findPage(PageRequest pageRequest) {
		Object userName = pageRequest.getParamValue("userName");
		Object status = pageRequest.getParamValue("status");
		if(userName != null && status != null) {
			return MybatisPageHelper.findPage(pageRequest, sysLoginLogMapper, "findPageByUserNameAndStatus", userName, status);
		} else if(status != null) {
			return MybatisPageHelper.findPage(pageRequest, sysLoginLogMapper, "findPageByStatus", status);
		} else if(userName != null) {
			return MybatisPageHelper.findPage(pageRequest, sysLoginLogMapper, "findPageByUserName", userName);
		}
		return MybatisPageHelper.findPage(pageRequest, sysLoginLogMapper);
	}
	@Transactional
	@Override
	public int writeLoginLog(String userName, String ip) {
		List<SysLoginLog> sysLoginLogs = sysLoginLogMapper.findByUserNameAndStatus(userName, SysLoginLog.STATUS_ONLINE);
		for(SysLoginLog sysLoginLog:sysLoginLogs) {
			sysLoginLog.setStatus(SysLoginLog.STATUS_LOGIN);
			sysLoginLogMapper.updateByPrimaryKey(sysLoginLog);
		}
		SysLoginLog record = new SysLoginLog();
//		TimeParse timeParse = new TimeParse();
//		String create_time = timeParse.convertDate2String(new Date(),"yyyy-MM-dd HH:mm:ss");

		record.setUserName(userName);
		record.setIp(ip);
		record.setLastUpdateTime(new Date());
		record.setStatus(SysLoginLog.STATUS_LOGOUT);
		sysLoginLogMapper.insertSelective(record);
		record.setStatus(SysLoginLog.STATUS_ONLINE);
		sysLoginLogMapper.insertSelective(record);
		return 0;
	}
	
}
