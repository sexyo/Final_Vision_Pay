package com.pay;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

import com.vo.CardVO;

public class PayDao {
	Logger logger = Logger.getLogger(PayDao.class);
	
	private SqlSessionTemplate sqlSessionTemplate = null;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	Map<String,Object> payment = new HashMap<String,Object>();
	
	public Map<String,Object> complete(Map<String,Object> pMap){
		logger.info("paypw 호출 성공");
		Map<String,Object> paypw = sqlSessionTemplate.selectOne("card",pMap);
		return paypw;
	}

	public Map<String,Object> storeNum(Map<String,Object> pMap) {
		logger.info("complete 호출 성공");
		Map<String,Object> storeNum = sqlSessionTemplate.selectOne("store", pMap);
		logger.info(storeNum);
		return storeNum;
	}

	public String card_pw(Map<String, Object> pMap) {
		logger.info("card_pw 호출 성공");
		String card_pw = sqlSessionTemplate.selectOne("paypw",pMap);
		return card_pw;
	}

	public int insertPay(Map<String, Object> pMap) {
		logger.info("card_pw 호출 성공");
		int amount=Integer.parseInt(pMap.get("amount").toString());
		pMap.put("amount", amount);
		logger.info(pMap);
		sqlSessionTemplate.selectOne("PROC_PAYMENT",pMap);
		int insertPay = Integer.parseInt(pMap.get("result").toString());
		logger.info("결제 성공 여부"+insertPay);
		return insertPay;
	}

	public List<String> hashList(String hash) {
		logger.info("hashList 호출 성공");
		List<String> hashList = new ArrayList<String>();
		hashList = sqlSessionTemplate.selectList("hashList", hash);
		logger.info("hashList"+hashList);
		return hashList;
	}
	public List<Map<String, Object>> allCard(CardVO cardVO) {
		List<Map<String,Object>> allCard = new ArrayList<Map<String,Object>>();
		allCard = sqlSessionTemplate.selectList("allCard",cardVO);
		
		return allCard;
	}
}
