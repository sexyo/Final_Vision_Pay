package com.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.util.HangulConversion;
import com.vo.MemberVO;


@Controller
@RequestMapping("/member/")
public class MemberController {
	Logger logger = Logger.getLogger(MemberController.class);
	@Autowired
	MemberLogic memberLogic = null;
	HttpSession session = null;
	String path = "";

	@GetMapping("index")
	public String index(@RequestParam Map<String, Object> pMap, HttpServletRequest req, Model model) {
		session = req.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		if (mem_id == null) {
			path = "member/main";
		} else if (mem_id != null) {
			pMap.put("mem_id", mem_id);
			Map<String, Object> refresh = null;
			refresh = memberLogic.refresh(pMap);
			String r_card = String.valueOf(refresh.get("R_CARD"));
			String r_account = String.valueOf(refresh.get("R_ACCOUNT"));
			String r_point = String.valueOf(refresh.get("R_POINT"));
			String r_mship = String.valueOf(refresh.get("R_MSHIP"));
			String r_coupon = String.valueOf(refresh.get("R_COUPON"));
			model.addAttribute("r_card", r_card);
			model.addAttribute("r_account", r_account);
			model.addAttribute("r_point", r_point);
			model.addAttribute("r_mship", r_mship);
			model.addAttribute("r_coupon", r_coupon);
			logger.info(refresh);
			path = "member/main";
		}
		return path;

	}

	@RequestMapping(value = "login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(@RequestParam Map<String, Object> pMap, HttpServletRequest req, Model model) {
		path = "member/login";
		return path;
	}

	@ResponseBody
	@RequestMapping(value = "com", method = RequestMethod.POST)
	public int main(@RequestParam Map<String, Object> pMap, HttpServletRequest req, Model model) {
		session = req.getSession();
		int result = 0;
		logger.info(pMap);
		Map<String, Object> login = null;
		login = memberLogic.login(pMap);
		if (login == null) {
			result = 0;
		} else if (login != null) {
			result = 1;
			session.setAttribute("mem_id", pMap.get("mem_id"));
		}
		logger.info(result);
		return result;
	}

	@RequestMapping(value = "register", method = { RequestMethod.GET, RequestMethod.POST })
	public String register(@ModelAttribute MemberVO memberVO, HttpServletRequest req, Model model) {
		path = "member/register";
		return path;
	}

	@GetMapping("crew")
	public String crew(@RequestParam Map<String, Object> pMap, HttpServletRequest req, Model model) {
		path = "member/crew";
		return path;

	}

	@GetMapping("logout")
	public String logout(@RequestParam Map<String, Object> pMap, HttpServletRequest req, Model model) {
		session = req.getSession();
		if (session.getAttribute("mem_id") != null) {
			session.invalidate();
		} else if (session.getAttribute("mem_id") == null) {
		}
		path = "member/main";
		return path;

	}

	@ResponseBody
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String memberIns(@ModelAttribute MemberVO memberVO, HttpServletRequest req, Model model) {

		logger.info("join호출");
		memberVO.setMem_id(req.getParameter("mem_id"));
		memberVO.setMem_pw(req.getParameter("mem_pw"));
		memberVO.setMem_addr(req.getParameter("mem_addr1") + req.getParameter("mem_addr2"));
		memberVO.setMem_birthday(req.getParameter("mem_birth"));
		memberVO.setMem_email(req.getParameter("mem_email"));
		memberVO.setMem_name(req.getParameter("mem_name"));
		memberVO.setMem_phone(
				req.getParameter("phon1") + "-" + req.getParameter("phon2") + "-" + req.getParameter("phon3"));
		if (req.getParameter("chk_info").equals("남")) {
			memberVO.setMem_gen("1");
		} else if (req.getParameter("chk_info").equals("여")) {
			memberVO.setMem_gen("0");
		}
		int result = memberLogic.join(memberVO);
		logger.info(result);
		return String.valueOf(result);

	}

	@ResponseBody
	@RequestMapping(value = "check_id", method = RequestMethod.POST)
	public String check_id(@RequestParam Map<String, Object> pMap, HttpServletRequest req, Model model) {
		String id = req.getParameter("mem_id");
		logger.info(id);
		int rowcount = memberLogic.check_id(id);
		return String.valueOf(rowcount);
	}

	@GetMapping("account")
	public String account(@RequestParam Map<String, Object> pMap, HttpServletRequest req, Model model) {
		path = "account/account";
		return path;
	}

	@GetMapping("card")
	public String card(@RequestParam Map<String, Object> pMap, HttpServletRequest req, Model model) {
		path = "card/card";
		return path;
	}

	@GetMapping("recommend")
	public String recommend(@RequestParam Map<String, Object> pMap, HttpServletRequest req, Model model) {
		path = "recommend/recommend";
		return path;
	}

	@GetMapping("plan")
	public String plan(@RequestParam Map<String, Object> pMap, HttpServletRequest req, Model model) {
		path = "plan/plan";
		return path;
	}

	@GetMapping("rewards")
	public String rewards(@RequestParam Map<String, Object> pMap, HttpServletRequest req, Model model) {
		path = "rewards/rewards";
		return path;
	}

}
