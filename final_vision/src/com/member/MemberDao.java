package com.member;

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
import com.vo.MemberVO;

public class MemberDao {
	Logger logger = Logger.getLogger(CardDao.class);
	private SqlSessionTemplate sqlSessionTemplate = null;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public Map<String, Object> login(Map<String,Object> pMap) {
		logger.info("다오호출성공");
		Map<String, Object> login = new HashMap<String,Object>();
		login = sqlSessionTemplate.selectOne("login",pMap);
		logger.info(login);
		return login;
	}
	public int check_id(String id) {
		int rowcount = sqlSessionTemplate.selectOne("check_id",id);
		return rowcount;
	}
	public int join(Map<String, Object> pMap) {
		sqlSessionTemplate.insert("proc_register",pMap);
		int result = (Integer)pMap.get("R_RESULT");
		return result;
	}
	public Map<String, Object> refresh(Map<String, Object> pMap) {
		Map<String, Object> refresh = new HashMap<String,Object>();
		refresh = sqlSessionTemplate.selectOne("refresh",pMap);
		return refresh;
	}

}
