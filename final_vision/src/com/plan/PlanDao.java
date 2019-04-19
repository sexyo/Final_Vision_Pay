package com.plan;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

import com.vo.PlanVO;

public class PlanDao {
	Logger logger = Logger.getLogger(PlanDao.class);
	private SqlSessionTemplate sqlSessionTemplate = null;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public PlanVO planList(PlanVO planVO) {
		logger.info("planList 호출 성공");
		sqlSessionTemplate.selectList("spendingMonth",planVO);
		List<Map<String, Object>> r_result = planVO.getR_month();
		logger.info("spendingMonth : "+r_result.get(0).get("R_SUM1"));
		sqlSessionTemplate.selectList("spendingCategory",planVO);
		r_result = planVO.getR_cate();
		logger.info("spendingCategory : "+r_result.get(0).get("R_CNT1"));
		sqlSessionTemplate.selectList("total_Week",planVO);
		r_result = planVO.getR_week();
		logger.info("total_Week : "+r_result.get(0).get("R_CNT1"));
		sqlSessionTemplate.selectList("total_Day",planVO);
		r_result = planVO.getR_day();
		logger.info("total_Day : "+r_result.get(0).get("R_CNT1"));
		return planVO;
	}
	

	
	public List<Map<String, Object>> spendingMonth(PlanVO planVO) {//달 기준 지출 내역 평균 및 6개월 r_ever & r1~r6 
		logger.info("spendingMonth 호출 성공");
		 sqlSessionTemplate.selectList("spendingMonth",planVO);
		 List<Map<String, Object>> r_result  = planVO.getR_month();
		return  r_result;
	}
	
	public List<Map<String, Object>> spendingCategory(PlanVO planVO) {//카테고리 기준 지출 내역 6개월 건수및 합계 r1~r12
		logger.info("spendingCategory 호출 성공");
		 sqlSessionTemplate.selectList("spendingCategory",planVO);
		 List<Map<String, Object>> r_result = planVO.getR_cate();
		return  r_result;
	}

	public PlanVO spendingStore(PlanVO planVO) {
		logger.info("spendingStore 호출 성공");
		logger.info("spendingstore month memid : "+planVO.getP_date()+" , "+planVO.getMem_id());
		sqlSessionTemplate.selectList("spendingStore",planVO);
		return planVO;
	}

	public List<Map<String, Object>> total_Week(PlanVO planVO) {
		logger.info("total_Week 호출성공");
		sqlSessionTemplate.selectList("total_Week",planVO);
		List<Map<String,Object>>r_result = planVO.getR_week();
		return r_result;
	}
	
	public List<Map<String, Object>> total_Day(PlanVO planVO) {
		logger.info("total_Day 호출 성공");
		sqlSessionTemplate.selectList("total_Day",planVO);
		List<Map<String,Object>>r_result = planVO.getR_day();
		return r_result;
	}

	public PlanVO mainCarousel(PlanVO planVO) {
		logger.info("mainCarousel 호출 성공");
		sqlSessionTemplate.selectList("spendingMonth",planVO);
		List<Map<String, Object>> r_result = planVO.getR_month();
		logger.info("spendingMonth : "+r_result.get(0).get("R_SUM1"));
		sqlSessionTemplate.selectList("spendingCategory",planVO);
		r_result = planVO.getR_cate();
		logger.info("spendingCategory : "+r_result.get(0).get("R_CNT1"));
		sqlSessionTemplate.selectList("total_Week",planVO);
		r_result = planVO.getR_week();
		logger.info("total_Week : "+r_result.get(0).get("R_CNT1"));
		return planVO;
	}






}
