package com.card;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.vo.CardVO;
@Service
public class CardLogic {
	Logger logger = Logger.getLogger(CardLogic.class);
	@Autowired
	CardDao cardDao = null;
	
	public List<Map<String,Object>> cardAllList(CardVO cardVO){
		List<Map<String,Object>>cardAllList = null;
				cardAllList =cardDao.cardAllList(cardVO);
				return cardAllList;
	}
	public List<Map<String,Object>> cardAllList2(CardVO cardVO){
		List<Map<String,Object>>cardAllList2 = null;
				cardAllList2 =cardDao.cardAllList2(cardVO);
				return cardAllList2;
	}
	
	
	public List<Map<String, String>> cardList(CardVO cardVO) {
		List<Map<String, String>> cardList = null; 
				cardList = cardDao.cardList(cardVO);
		   return cardList;
	}
	public int cardAdd(Map<String, Object> pMap) {
		int result=cardDao.cardAdd(pMap);
		return result;
	}
	public List<Map<String, Object>> allCard(CardVO cardVO) {
		List<Map<String,Object>> allCard = null;
		allCard = cardDao.allCard(cardVO);
		return allCard;
	}
	public List<Map<String, Object>> detail_card(CardVO cardVO) {
		List<Map<String,Object>>detail_card = null;
		detail_card = cardDao.detail_card(cardVO);
		return detail_card;
	}
	public int visionCardAdd(Map<String, Object> pMap) {
		return cardDao.visionCardAdd(pMap);
	}

}