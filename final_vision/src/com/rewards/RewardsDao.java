package com.rewards;

import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.card.CardDao;
import com.util.MyBatisCommonFactory;
import com.vo.RecommendVO;
import com.vo.RewardsVO;

public class RewardsDao {
	Logger logger = Logger.getLogger(RewardsDao.class);
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public int myPoint(RewardsVO rewardsVO) {
		String mem_id = rewardsVO.getMem_id();
		int myPoint = sqlSessionTemplate.selectOne("myPoint",mem_id);
		
		return myPoint;
	}
	public List<Map<String, Object>> couponShop(Map<String, Object> pMap) {
		List<Map<String,Object>> couponShop = new ArrayList<Map<String,Object>>();
		couponShop = sqlSessionTemplate.selectList("couponShop");
		logger.info(couponShop);
	    return couponShop;
	}
	public int exCoupon(Map<String, Object> pMap) {
		sqlSessionTemplate.selectOne("exCoupon",pMap);
		int exCoupon = (Integer)pMap.get("RESULT");
		
		logger.info(exCoupon);
	    return exCoupon;
	}
	public List<Map<String, Object>> couponInven(Map<String, Object> pMap) {
		List<Map<String, Object>> couponInven = new ArrayList<Map<String,Object>>();
		couponInven = sqlSessionTemplate.selectList("couponInven",pMap);
		return couponInven;
	}


	
}
