package com.pay;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pay.Wellet;
import com.vo.CardVO;

@Service
public class PayLogic {
	Logger logger = Logger.getLogger(PayLogic.class);
	@Autowired
	PayDao payDao = null;
	Map<String,Object> payment;
	
	List<Wellet> wellList = new ArrayList<Wellet>();
	List<String> dayList = new ArrayList<String>();
	Wellet w = null;
	public Map<String,Object> store(Map<String, Object> pMap){
		Map<String,Object> storeNum = payDao.storeNum(pMap);
		storeNum.put("product", pMap.get("product"));
		storeNum.put("amount", pMap.get("amount"));
		storeNum.put("store_name", pMap.get("store_name"));
		logger.info(storeNum);
		return storeNum;
	}
	public String complete(Map<String, Object> pMap) {
logger.info("complete 호출 성공");
logger.info(pMap);//store_name, product, amount, brand_name care_name card_num store_num
		Map<String,Object> paypw = payDao.complete(pMap); // 결제비번,아이디,카드번호,카드한도,시퀀스
logger.info(paypw);
		int balance = Integer.parseInt(paypw.get("CARD_LIMIT").toString())-Integer.parseInt(pMap.get("amount").toString());
logger.info("남은 금액 "+ balance);
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd\0hh:mm:ss");
		String day = date.format(today);
		dayList.add(day);
		String n_hash = DigestUtils.sha256Hex(paypw.get("MEM_ID").toString()+ day);
		pMap.put("hash", n_hash);
		pMap.put("chainno", paypw.get("CHAINNO"));
		pMap.put("mem_id", paypw.get("MEM_ID"));
logger.info(pMap);
		List<String> hashList = payDao.hashList(pMap.get("card_num").toString());
logger.info(hashList);
		w = new Wellet(pMap,hashList);
		wellList.add(w);
		if(wellList.size()!=0) {
logger.info("info :" + wellList.get(wellList.size()-1).info.get("store_name"));
logger.info("info :" + wellList.get(wellList.size()-1).info.get("product"));
logger.info("info :" + wellList.get(wellList.size()-1).info.get("amount"));
logger.info("info :" + wellList.get(wellList.size()-1).info.get("brand_name"));
logger.info("info :" + wellList.get(wellList.size()-1).info.get("care_name"));
logger.info("info :" + wellList.get(wellList.size()-1).info.get("card_num"));
logger.info("info :" + wellList.get(wellList.size()-1).info.get("store_num"));
logger.info("info :" + wellList.get(wellList.size()-1).info.get("hash"));
logger.info("info :" + wellList.get(wellList.size()-1).info.get("chainno"));
logger.info("info :" + wellList.get(wellList.size()-1).info.get("mem_id"));
		}
logger.info(paypw.get("CHAINNO").toString());
		
		StringBuilder sb = new StringBuilder();
		sb.append(pMap.get("chainno").toString()+"\0");
		sb.append(n_hash+"\0");
		sb.append(pMap.get("mem_id").toString()+"\0");
		sb.append(pMap.get("store_name").toString()+"\0");
		sb.append(balance+"\0");
		sb.append(pMap.get("amount").toString()+"\0");
		sb.append(day+"\0");
		sb.append(pMap.get("card_num")+"\0");
		if(hashList.size()>0) {
			sb.append(hashList.get(hashList.size()-1)+"\0");
		}
		
logger.info(sb.toString());
		return sb.toString();
	}
	public int insertPay(String[] completes) {
		logger.info("insertPay 호출 성공");
		for(int y=0;y<completes.length;y++) {
			logger.info(y+"   "+completes[y]);
		}
		String p_hash="";
		int insertPay=0;
		
		if(dayList.size()>0) {
			logger.info(wellList.get(wellList.size()-1).info);
			logger.info(wellList.get(wellList.size()-1).info.get("mem_id").toString());
			logger.info(dayList.get(dayList.size()-1));
			p_hash = DigestUtils.sha256Hex(wellList.get(wellList.size()-1).info.get("mem_id").toString()+dayList.get(dayList.size()-1));
		}else {
			p_hash = "";
		}
		if(wellList.get(wellList.size()-1).hashList.size()==0) {
			logger.info("첫 결제 완료");
			insertPay =payDao.insertPay(wellList.get(wellList.size()-1).info);
		} else if(wellList.get(wellList.size()-1).hashList.size()>0) { 
			if(wellList.get(wellList.size()-1).hashList.get(wellList.get(wellList.size()-1).hashList.size()-1).equals(completes[9])) {
				logger.info("블럭 비교 후 결제 완료");
				logger.info(wellList.get(wellList.size()-1).hashList.get(wellList.get(wellList.size()-1).hashList.size()-1));
				logger.info(completes[9]);
				insertPay =payDao.insertPay(wellList.get(wellList.size()-1).info);
			} else {
				logger.info("해쉬값이 다릅니다. 결제 실패");
				logger.info(wellList.get(wellList.size()-1).hashList.get(wellList.get(wellList.size()-1).hashList.size()-1));
				logger.info(p_hash);
			}
		}
		return insertPay;
	}

	public String card_pw(Map<String, Object> pMap) {
		logger.info("card_pw 호출 성공");
		String card_pw = payDao.card_pw(pMap);
		return card_pw;
	}
	public List<Map<String, Object>> allCard(CardVO cardVO) {
		List<Map<String,Object>> allCard = null;
		allCard = payDao.allCard(cardVO);
		return allCard;
	}
	public void payListDel(String[] addValue) {
		if(addValue!=null) {
			for(int i=0;i<addValue.length;i++) {
				String[] payHash = addValue[i].split("!");
				if (wellList.get(wellList.size()-1).hashList.get(wellList.get(wellList.size()-1).hashList.size()-1).equals(payHash[9])) {
					
				}
			}
		}
	}

}
