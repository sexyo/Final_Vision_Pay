package com.account;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vo.AccountVO;

@Controller
@RequestMapping(value="/account/")
public class AccountController {
	Logger logger = Logger.getLogger(AccountController.class);
	@Autowired
	AccountLogic accountLogic = null;
	String path = "";
	String openKey;
	String timestamp;
	Map<String,Object> tList = new HashMap<String,Object>();
	String hash;
	int nonce;
	HttpSession session = null;

	@PostMapping("accountList3")
	@ResponseBody
	public List<Map<String,Object>> accountList3(HttpServletRequest req) throws ServletException, IOException {
		logger.info("accountList3 호출 성공");
		HttpSession session = req.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		List<Map<String,Object>> accountList = null;
		logger.info("mem_id:"+mem_id);
		accountList = accountLogic.accountList3(mem_id);
		logger.info(accountList.size());
		return accountList;
	}
	@GetMapping("account")
	public String accountList(Model model, HttpServletRequest req, @RequestParam Map<String,Object> pMap) throws ServletException, IOException {
		logger.info("accountList 호출 성공");
		List<Map<String,Object>> accountList = null;
		session = req.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		pMap.put("mem_id", mem_id);
		String path = "";
		logger.info("mem_id:"+pMap.get("mem_id"));
		accountList = accountLogic.accountList(pMap);
		model.addAttribute("accountList", accountList);
		//insert here - 응답페이지 호출 하기
		//jsonBoardList.jsp페이지의 생성 위치는 어디인가요?
		//WebContent이면 반환타입은 String
		//WEB-INF이면 반환타입은 void, ModelAndView 이겠지.....
		
		path = "account/account";
		//path = "forward:./accountList.jsp";
		return path;
		//return path;
	}
	@RequestMapping(value = "accHistory", method = RequestMethod.POST)
	public String accHistory(@ModelAttribute AccountVO accountVO, Model model, HttpServletRequest req, @RequestParam Map<String,Object> pMap) throws ServletException, IOException {
		logger.info("accHistory 호출 성공");
		Map<String,List<Map<String,Object>>> accHistory = null;
		String path = "";
		session = req.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		pMap.put("mem_id", mem_id);
		accHistory = accountLogic.accHistory(pMap);
		model.addAttribute("accHistory", accHistory);
		//insert here - 응답페이지 호출 하기
		//jsonBoardList.jsp페이지의 생성 위치는 어디인가요?
		//WebContent이면 반환타입은 String
		//WEB-INF이면 반환타입은 void, ModelAndView 이겠지.....
		path = "account/accHistory";
		//path = "forward:./accountList.jsp";
		return path;
		//return path;
	}
	@ResponseBody
    @RequestMapping(value = "accountAdd", method = RequestMethod.POST)
	public int accountAdd(Model model, HttpServletRequest req, @RequestParam Map<String,Object> pMap) throws ServletException, IOException {
		logger.info("accountAdd 호출 성공");
		int result = 0;
		
		String wallet = calculateHash(req.getParameter("p_acc_num"));
		pMap.put("p_wallet", wallet);
		logger.info("mem_id:"+pMap.get("p_mem_id"));
		logger.info("acc_num:"+pMap.get("p_acc_num"));
		logger.info("acc_bank:"+pMap.get("p_acc_bank"));
		logger.info("acc_name:"+pMap.get("p_acc_name"));
		logger.info("wallet:"+pMap.get("p_wallet"));
		logger.info(pMap);
		
		//accountVO.set//조회버튼을 눌렀을 때|입력처리 후 결과 처리페이지인지
		result = accountLogic.accountAdd(pMap);
		//insert here - 응답페이지 호출 하기
		//jsonBoardList.jsp페이지의 생성 위치는 어디인가요?
		//WebContent이면 반환타입은 String
		//WEB-INF이면 반환타입은 void, ModelAndView 이겠지.....
		
		//path = "forward:./accountList.jsp";
		return result;
	}
	@ResponseBody
    @RequestMapping(value = "accTransfer", method = RequestMethod.POST)
	public int accTransfer(@RequestParam Map<String,Object> pMap, HttpServletRequest req,	Model model) {
		
		logger.info("이체 시도");
		session = req.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		block(pMap, mem_id);
		
		String hash = this.hash;
		pMap.put("hash", hash);
		logger.info(pMap);
		int accTransfer = accountLogic.accTransfer(pMap);

		return accTransfer;
	}
	public void block(String mem_id) { //파라미터 string 브랜드 or 회원 pk
		this.openKey = mem_id;
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss a");
		this.timestamp = date.format(today);
		this.hash = calculateHash(mem_id);
	}
	public void block(Map<String,Object> tList, String key) { //파라미터 string 브랜드 or 회원 pk
		this.openKey = key;
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss a");
		this.timestamp = date.format(today);
		this.tList = tList;
		this.hash = calculateHash(openKey, timestamp, tList);
	}
	
	//회원or브랜드 pk , 거래되는 현재 시간 , 보내는사람(회원) , 받는사람(브랜드) , 금액 ,
	public String calculateHash(String mem_id) {
		return DigestUtils.sha256Hex(mem_id);
	}
	public String calculateHash(String openKey, String timestamp, Map<String,Object> tList) {
		return DigestUtils.sha256Hex(openKey+timestamp+tList);
	}
	
		

}



















