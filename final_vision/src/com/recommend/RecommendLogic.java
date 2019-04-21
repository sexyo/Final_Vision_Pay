package com.recommend;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class RecommendLogic {
	Logger logger = Logger.getLogger(RecommendLogic.class);
	@Autowired
	RecommendDao recommendDao = null;
	public List<Map<String, Object>> myRecommendCard(String mem_id) {
		List<Map<String, Object>> recommendList = new ArrayList<Map<String, Object>>();
		recommendList = recommendDao.myRecommendCard(mem_id);
		return recommendList;
	}

}
