package com.membership;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.vo.MembershipVO;

@Controller
@RequestMapping(value="/membership/")
public class MembershipController {
	Logger logger = Logger.getLogger(MembershipController.class);
	@Autowired
	MembershipLogic membershipLogic = null;
	String path;
	@GetMapping("mshipList")
	public String mshipList(@RequestParam Map<String,Object> pMap, HttpServletRequest req, Model model) throws ServletException, IOException {
		//insert here
		//메소드이름으로 알맞게 타입정하고		
		//메소드이름=로직.같은이름메소드(VO);
		
		path = "";
		return path;
	}
	@GetMapping("mshipHistory")
	public String mshipHistory(@RequestParam Map<String,Object> pMap, HttpServletRequest req, Model model) throws ServletException, IOException {
		//insert here
		//메소드이름으로 알맞게 타입정하고		
		//메소드이름=로직.같은이름메소드(VO);
		
		path = "";
		return path;
	}
	@GetMapping("mshipAdd")
	public String mshipAdd(@RequestParam Map<String,Object> pMap, HttpServletRequest req, Model model) throws ServletException, IOException {
		//insert here
		//메소드이름으로 알맞게 타입정하고		
		//메소드이름=로직.같은이름메소드(VO);
		
		path = "";
		return path;
	}
	@GetMapping("mshipBenefit")
	public String mshipBenefit(@RequestParam Map<String,Object> pMap, HttpServletRequest req, Model model) throws ServletException, IOException {
		//insert here
		//메소드이름으로 알맞게 타입정하고		
		//메소드이름=로직.같은이름메소드(VO);
		
		path = "";
		return path;
	}
}
