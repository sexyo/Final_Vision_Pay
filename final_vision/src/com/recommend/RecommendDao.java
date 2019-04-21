package com.recommend;

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

import com.membership.MembershipDao;
import com.util.MyBatisCommonFactory;
import com.vo.RecommendVO;

public class RecommendDao {
	Logger logger = Logger.getLogger(RecommendDao.class);
	private SqlSessionTemplate sqlSessionTemplate = null;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public List<Map<String, Object>> myRecommendCard(String mem_id) {
		logger.info("myRecommendCard 호출 성공");
		Map<String,Object> pMap = new HashMap<String,Object>();
		pMap.put("mem_id", mem_id);
		List<Map<String, Object>> recommendList = new ArrayList<Map<String, Object>>();
		sqlSessionTemplate.selectList("myRecommendCard",pMap);
		recommendList = (List<Map<String, Object>>)pMap.get("rec_card");
		logger.info(recommendList.size());
		//logger.info(recommendList.get(0).get("rec_card"));
		return recommendList;
	}
	
}
