package com.member;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

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
import com.vo.MemberVO;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


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
	@ResponseBody
	@RequestMapping(value = "cert", method = {RequestMethod.GET,RequestMethod.POST})
	public String cert(@RequestParam Map<String, Object> pMap, HttpServletRequest req, Model model){
		int result = 0;
		logger.info(pMap);
		String phone_num = (String)pMap.get("mem_phone");
		if(phone_num.length()==11) {
			String mem_phone = phone_num.substring(0, 3)+"-"+phone_num.substring(3, 7)+"-"+phone_num.substring(7, 11);
			logger.info(mem_phone);
			pMap.put("mem_phone", mem_phone);
		}
		else if(phone_num.length()==12) {
			if(phone_num.substring(4).equals("-")) {}
			else {
				String mem_phone = phone_num.substring(0, 3)+"-"+phone_num.substring(3, 6)+"-"+phone_num.substring(7, 10);
				pMap.put("mem_phone", mem_phone);
			}
		}
		else if(phone_num.length()==13) {
			phone_num = phone_num.substring(0, 3)+phone_num.substring(4, 8)+phone_num.substring(10, 13);
		}
		int cert = memberLogic.cert(pMap);
		logger.info("cert:"+cert);
		String cert_no = "";
		if(cert==1) {
			String api_key = "NCSCONUE69XGPXDK";
			String api_secret = "KBPIIIIIP54LLTL7D7VT3XLL9AYO0PMZ";
			Message coolsms = new Message(api_key, api_secret);
			String certno[] = new String[6];
			Random random = new Random();
			for(int i=0;i<certno.length;i++) {
				certno[i] = String.valueOf(random.nextInt(8)+1);
				System.out.println(certno[i]);
				cert_no=cert_no+certno[i];
			}
			
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("to", phone_num);
			params.put("from", "0220258523");
			params.put("type", "SMS");
			params.put("text", "인증번호는 ["+String.valueOf(cert_no)+"] 입니다.  -VISIONPAY-");
			params.put("app_version", "test app 1.2"); // application name and version
			logger.info(cert_no);
			
			try {
				JSONObject obj = (JSONObject) coolsms.send(params);
				System.out.println(obj.toString());
			} catch (CoolsmsException e) {
				System.out.println(e.getMessage());
				System.out.println(e.getCode());
			}
		}
		else if(cert==0) {
			cert_no = "0";
		}
		return cert_no;
	}
	@RequestMapping(value = "findId", method = {RequestMethod.GET,RequestMethod.POST})
	public String findId(@RequestParam Map<String, Object> pMap, HttpServletRequest req, Model model) {
		path = "member/findId";
		return path;
	}
	@ResponseBody
	@RequestMapping(value = "cert_findId", method = {RequestMethod.GET,RequestMethod.POST})
	public String cert_findId(@RequestParam Map<String, Object> pMap, HttpServletRequest req, Model model) {
		String phone_num = (String)pMap.get("mem_phone");
		if(phone_num.length()==11) {
			String mem_phone = phone_num.substring(0, 3)+"-"+phone_num.substring(3, 7)+"-"+phone_num.substring(7, 11);
			logger.info(mem_phone);
			pMap.put("mem_phone", mem_phone);
		}
		else if(phone_num.length()==12) {
			if(phone_num.substring(4).equals("-")) {}
			else {
				String mem_phone = phone_num.substring(0, 3)+"-"+phone_num.substring(3, 6)+"-"+phone_num.substring(7, 10);
				pMap.put("mem_phone", mem_phone);
			}
		}
		else if(phone_num.length()==13) {
			phone_num = phone_num.substring(0, 3)+phone_num.substring(4, 8)+phone_num.substring(10, 13);
		}
		String findId = memberLogic.findId(pMap);
		return findId;
	}
	@ResponseBody
	@RequestMapping(value = "findPw_idcheck", method = {RequestMethod.GET,RequestMethod.POST})
	public int findPw_idcheck(@RequestParam Map<String, Object> pMap, HttpServletRequest req, Model model) {
		int result = 0;
		String findPw_idcheck = memberLogic.findPw_idcheck(pMap);
		logger.info(findPw_idcheck);
		if(findPw_idcheck.equals("0")) {
			result = 0;
		}
		else {
			result = 1;
			session = req.getSession();
			session.setAttribute("r_mem_id", findPw_idcheck);
		}
		
		return result;
	}
	@GetMapping("findPw")
	public String findPw(@RequestParam Map<String, Object> pMap, HttpServletRequest req, Model model) {
		path = "member/findPw";
		return path;
	}
	@GetMapping("changePw")
	public String changePw(@RequestParam Map<String, Object> pMap, HttpServletRequest req, Model model) {
		path = "member/changePw";
		return path;
	}
	@GetMapping("findPw_cert")
	public String findPw_cert(@RequestParam Map<String, Object> pMap, HttpServletRequest req, Model model) {
		path = "member/findPw_cert";
		return path;
	}
	
	@ResponseBody
	@RequestMapping(value = "pwChange", method = {RequestMethod.GET,RequestMethod.POST})
	public int pwChange(@RequestParam Map<String, Object> pMap, HttpServletRequest req, Model model) {
		session = req.getSession();
		String mem_id = (String)session.getAttribute("r_mem_id");
		pMap.put("p_mem_id", mem_id);
		int result = memberLogic.pwChange(pMap);
		return result;
	}

}
