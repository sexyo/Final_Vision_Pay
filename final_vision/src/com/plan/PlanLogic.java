package com.plan;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vo.PlanVO;
@Service
public class PlanLogic {
	Logger logger = Logger.getLogger(PlanLogic.class);
	@Autowired
	PlanDao planDao = new PlanDao();
	
	public PlanVO planList(PlanVO planVO) {
		logger.info("planVO 호출 성공");
		return planDao.planList(planVO);
	}

	public List<Map<String, Object>> spendingMonth(PlanVO planVO) {
		logger.info("spendingMonth 호출성공");
		return planDao.spendingMonth(planVO);
	}

	public List<Map<String, Object>> spendingCategory(PlanVO planVO) {
		logger.info("spendingCategory 호출성공");
		return planDao.spendingCategory(planVO);
	}

	public PlanVO spendingStore(PlanVO planVO) {
		logger.info("spendingStore 호출성공");
		return planDao.spendingStore(planVO);
	}

	public List<Map<String, Object>> total_Week(PlanVO planVO) {
		logger.info("total_Week 호출 성공");
		return planDao.total_Week(planVO);
	}

	public List<Map<String, Object>> total_Day(PlanVO planVO) {
		logger.info("total_Day 호출 성공");
		return planDao.total_Day(planVO);
	}

	public PlanVO mainCarousel(PlanVO planVO) {
		logger.info("mainCarousel 호출 성공");
		return planDao.mainCarousel(planVO);
	}


	


}
