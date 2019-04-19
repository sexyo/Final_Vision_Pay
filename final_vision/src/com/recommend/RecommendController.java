package com.recommend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vo.RecommendVO;

@Controller
@RequestMapping(value="/recommend/")
public class RecommendController {
	Logger logger = Logger.getLogger(RecommendController.class);
	@Autowired
	RecommendLogic recommendLogic = null;
	String path = "";
	@GetMapping("allCards")
	public String otherUsersSpending(@ModelAttribute RecommendVO recommendVO, Model model, HttpServletRequest req) throws ServletException, IOException {
		//insert here
		//메소드이름으로 알맞게 타입정하고		
		//메소드이름=로직.같은이름메소드(VO);
		
		
		//mav.addObject("allCards", allCards);
		return path;
	}
	@GetMapping("eatCard")
	public String eatCard(@ModelAttribute RecommendVO recommendVO, Model model, HttpServletRequest req) throws ServletException, IOException {
		//insert here
		//메소드이름으로 알맞게 타입정하고		
		//메소드이름=로직.같은이름메소드(VO);
		
		
		//mav.addObject("allCards", allCards);
		return path;
	}
	@GetMapping("communityCard")
	public String communityCard(@ModelAttribute RecommendVO recommendVO, Model model, HttpServletRequest req) throws ServletException, IOException {
		//insert here
		//메소드이름으로 알맞게 타입정하고		
		//메소드이름=로직.같은이름메소드(VO);
		
		
		//mav.addObject("allCards", allCards);
		return path;
	}
	@GetMapping("cultureCard")
	public String cultureCard(@ModelAttribute RecommendVO recommendVO, Model model, HttpServletRequest req) throws ServletException, IOException {
		//insert here
		//메소드이름으로 알맞게 타입정하고		
		//메소드이름=로직.같은이름메소드(VO);
		
		
		//mav.addObject("allCards", allCards);
		return path;
	}
	@GetMapping("tripCard")
	public String tripCard(@ModelAttribute RecommendVO recommendVO, Model model, HttpServletRequest req) throws ServletException, IOException {
		//insert here
		//메소드이름으로 알맞게 타입정하고		
		//메소드이름=로직.같은이름메소드(VO);
		
		
		//mav.addObject("allCards", allCards);
		return path;
	}
	@GetMapping("convenCard")
	public String convenCard(@ModelAttribute RecommendVO recommendVO, Model model, HttpServletRequest req) throws ServletException, IOException {
		//insert here
		//메소드이름으로 알맞게 타입정하고		
		//메소드이름=로직.같은이름메소드(VO);
		
		
		//mav.addObject("allCards", allCards);
		return path;
	}
	@GetMapping("oilCard")
	public String oilCard(@ModelAttribute RecommendVO recommendVO, Model model, HttpServletRequest req) throws ServletException, IOException {
		//insert here
		//메소드이름으로 알맞게 타입정하고		
		//메소드이름=로직.같은이름메소드(VO);
		
		
		//mav.addObject("allCards", allCards);
		return path;
	}
	@GetMapping("myRecommendCard")
	public String myRecommendCard(@ModelAttribute RecommendVO recommendVO, Model model, HttpServletRequest req) throws ServletException, IOException {
		//insert here
		//메소드이름으로 알맞게 타입정하고		
		//메소드이름=로직.같은이름메소드(VO);
		
		
		//mav.addObject("allCards", allCards);
		return path;
	}

}
