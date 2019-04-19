package com.rewards;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vo.RewardsVO;
@Service
public class RewardsLogic {
	Logger logger = Logger.getLogger(RewardsLogic.class);
	@Autowired
	RewardsDao rewardsDao = null;
	public int myPoint(RewardsVO rewardsVO) {
		int myPoint=0;
		myPoint = rewardsDao.myPoint(rewardsVO);
				
		return myPoint;
	}
	public List<Map<String, Object>> couponShop(Map<String, Object> pMap) {
		List<Map<String, Object>> couponShop =rewardsDao.couponShop(pMap);
	
		logger.info(couponShop+"couponShop 호출성공");
		return couponShop;
	}
	public int exCoupon(Map<String, Object> pMap) {
		int exCoupon =rewardsDao.exCoupon(pMap);
		
		return exCoupon;
	}
	public List<Map<String, Object>> couponInven(Map<String, Object> pMap) {
		List<Map<String,Object>> couponInven = null;
		couponInven = rewardsDao.couponInven(pMap); 
		logger.info("쿠폰함 호출성공");
		return couponInven;
	}

}
