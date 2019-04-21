package com.card;

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

import com.recommend.RecommendDao;
import com.util.MyBatisCommonFactory;
import com.vo.CardVO;
import com.vo.RecommendVO;

public class CardDao {

	Logger logger = Logger.getLogger(CardDao.class);
	private SqlSessionTemplate sqlSessionTemplate = null;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public List<Map<String,String>> cardList(CardVO cardVO){
		  String p_mem_id = cardVO.getP_mem_id();	
		  List<Map<String,String>> cardList = new ArrayList<Map<String,String>>();
		  System.out.println(cardVO.getR_list());
		  sqlSessionTemplate.selectList("cardList",cardVO);
		  System.out.println(cardVO.getR_list());
		  cardList.add(cardVO.getR_list().get(0));
		  return cardList;
	}
	public int cardAdd(Map<String, Object> pMap) {
		sqlSessionTemplate.selectOne("cardAdd",pMap);
		int result = (Integer) pMap.get("RESULT");
		return result;
	}
	public List<Map<String, Object>> cardAllList(CardVO cardVO) {
		logger.info("cardAllList 나옴");
		List<Map<String,Object>> cardAllList = new ArrayList<Map<String,Object>>();
		cardAllList = sqlSessionTemplate.selectList("cardAllList",cardVO);
		logger.info(cardAllList);
		return cardAllList;
	}
	public List<Map<String, Object>> cardAllList2(CardVO cardVO) {
		logger.info("cardAllList2 나옴");
		List<Map<String,Object>> cardAllList2 = new ArrayList<Map<String,Object>>();
		cardAllList2 = sqlSessionTemplate.selectList("cardAllList2",cardVO);
		return cardAllList2;
	}
	public List<Map<String, Object>> allCard(CardVO cardVO) {
		List<Map<String,Object>> allCard = new ArrayList<Map<String,Object>>();
		allCard = sqlSessionTemplate.selectList("allCard",cardVO);
		
		return allCard;
	}
	public List<Map<String,Object>>detail_card(CardVO cardVO){
		List<Map<String,Object>>detail_card = new ArrayList<Map<String,Object>>();
		detail_card = sqlSessionTemplate.selectList("detail_card",cardVO);
		logger.info(detail_card);
		return detail_card;
	}
	public int visionCardAdd(Map<String, Object> pMap) {
		logger.info("visionCardAdd 호출 성공");
		int r_result = 0 ;
		sqlSessionTemplate.selectOne("visionCardAdd",pMap); 
		r_result = (Integer)pMap.get("r_result");
		logger.info("r_result"+r_result);
		return r_result;
	}


}