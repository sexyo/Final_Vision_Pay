package com.membership;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.card.CardDao;
import com.member.MemberDao;
import com.util.MyBatisCommonFactory;

public class MembershipDao {
	Logger logger = Logger.getLogger(MembershipDao.class);
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public List<Map<String, Object>> mshipList(Map<String, Object> pMap) {
		List<Map<String, Object>> mshipList = new ArrayList<Map<String,Object>>();
		mshipList = sqlSessionTemplate.selectList("mshipList",pMap);
		logger.info("멤버쉽 다오 호출성공"+pMap);
		logger.info("멤버쉽 다오 호출성공"+mshipList);
		
		
		return mshipList;
	}
	public int mshipAdd(Map<String, Object> pMap) {
		sqlSessionTemplate.selectOne("mshipAdd",pMap);
		int result = (Integer) pMap.get("RESULT");
		return result;
	}
	public List<Map<String, Object>> mshipAllList(Map<String, Object> pMap) {
		List<Map<String, Object>> mshipAllList = new ArrayList<Map<String,Object>>();
		mshipAllList = sqlSessionTemplate.selectList("mshipAllList", pMap);
		logger.info(mshipAllList);
		return mshipAllList;
	}
	

}
