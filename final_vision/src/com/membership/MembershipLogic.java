package com.membership;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class MembershipLogic {
	Logger logger = Logger.getLogger(MembershipLogic.class);
	@Autowired
	MembershipDao membershipDao = null;

	public List<Map<String, Object>> mshipList(Map<String, Object> pMap) {
		
		List<Map<String, Object>> mshipList = null;
		mshipList =	membershipDao.mshipList(pMap);
		return mshipList;
	}

	public int mshipAdd(Map<String, Object> pMap) {
		int result=membershipDao.mshipAdd(pMap);
		return result;
	}

	public List<Map<String, Object>> mshipAllList(Map<String, Object> pMap) {
		List<Map<String, Object>> mshipAllList = null;
		mshipAllList = membershipDao.mshipAllList(pMap);
		
		return mshipAllList;
	}
	

}
