package com.membership;

import java.io.IOException;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vo.CardVO;
import com.vo.MembershipVO;

@Controller
@RequestMapping(value="/membership/")
public class MembershipController {
	Logger logger = Logger.getLogger(MembershipController.class);
	@Autowired
	MembershipLogic membershipLogic = null;
	String path;
	@RequestMapping(value = "mshipList", method = {RequestMethod.GET,RequestMethod.POST})
	public String mshipList(@RequestParam Map<String,Object> pMap, Model model, HttpServletRequest req) throws ServletException, IOException {
		logger.info("멤버쉽리스트 호출성공");
		HttpSession session = req.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		pMap.put("mem_id",mem_id);
		
		
		List<Map<String, Object>> mshipList = membershipLogic.mshipList(pMap);
		logger.info("멤버쉽리스트 호출"+pMap);
		logger.info(mshipList);
		model.addAttribute("mshipList",mshipList);
		path = "membership/mshipList";
		return path;
	}
	@RequestMapping(value = "mshipAllList", method = {RequestMethod.GET,RequestMethod.POST})
	public String mshipAllList(@RequestParam Map<String,Object> pMap, Model model, HttpServletRequest req) throws ServletException, IOException {
		logger.info("멤버쉽 전체리스트 호출성공");
		HttpSession session = req.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		pMap.put("mem_id",mem_id);
		
		
		List<Map<String, Object>> mshipAllList = membershipLogic.mshipAllList(pMap);
		logger.info("멤버쉽리스트 호출"+pMap);
		logger.info(mshipAllList);
		model.addAttribute("mshipAllList",mshipAllList);
		path = "membership/mshipAllList";
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
	@ResponseBody
	@RequestMapping(value = "mshipAdd", method = {RequestMethod.GET,RequestMethod.POST})
	public int mshipAdd(Model model, HttpServletRequest req)
			throws ServletException, IOException {
		logger.info("mshipAdd 나옴");

		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("P_MEM_ID", req.getParameter("mem_id"));
		pMap.put("P_MSHIP_NUM", req.getParameter("mship_num"));
		logger.info(req.getParameter("mem_id"));

		int result = membershipLogic.mshipAdd(pMap);
		logger.info(result);
		return result;
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
