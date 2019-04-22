package com.recommend;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/recommend/")
public class RecommendController {
	Logger logger = Logger.getLogger(RecommendController.class);
	@Autowired
	RecommendLogic recommendLogic = null;
	String path = "";
	@GetMapping("myRecommendCard")
	public String myRecommendCard(Model model, HttpServletRequest req) throws ServletException, IOException {
		//나의 추천카드 추천
		logger.info("myRecommendCard 호출 성공");
		HttpSession session = req.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		List<Map<String,Object>> recommendList = null;
		logger.info("mem_id:"+mem_id);
		recommendList = recommendLogic.myRecommendCard(mem_id);
		logger.info(recommendList.size());
		model.addAttribute("recommendList", recommendList);
		return "card/myRecommendCard";
	}

	@RequestMapping("recommendCard")
	public String recommendCard() throws ServletException, IOException {
		//모든 카드 추천
		logger.info("recommendCard");
		
		return "card/recommendCard";
	}

}
