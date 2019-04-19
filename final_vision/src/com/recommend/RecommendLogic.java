package com.recommend;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class RecommendLogic {
	Logger logger = Logger.getLogger(RecommendLogic.class);
	@Autowired
	RecommendDao recommendDao = null;

}
