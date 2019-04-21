package com.pay;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.util.HangulConversion;


@Controller
@RequestMapping(value="/pay/")
public class PayController {
	Logger logger = Logger.getLogger(PayController.class);
	@Autowired
	PayLogic payLogic = null;
	String path = "";
	String card_num = "4077851424567894";
	
	@RequestMapping(value = "payment", method = {RequestMethod.GET, RequestMethod.POST})
	public String payment(Model model, HttpServletRequest req) throws ServletException, IOException {
		logger.info("payment 호출 성공");
		card_num = req.getParameter("card_num");
		logger.info("card정보값"+card_num);
		model.addAttribute("cardInfo", card_num);
		path = "pay/payment";
		return path;
	}
	
	@RequestMapping(value = "paymentPW", method = {RequestMethod.GET, RequestMethod.POST})
	public String paymentPW(Model model, HttpServletResponse res, @RequestParam Map<String,Object> pMap) throws ServletException, IOException {
		logger.info("paymentPW 호출 성공");
		logger.info(pMap);
		String card_pw = payLogic.card_pw(pMap);
		logger.info(card_pw);
		path = "pay/paymentPW";
		model.addAttribute("card_pw",card_pw);
		return path;
	}
	@RequestMapping(value = "qrCode", method = {RequestMethod.GET, RequestMethod.POST})
	public String qrCode(Model model, HttpServletRequest req) throws ServletException, IOException {
		logger.info("qrCode 호출 성공");
		path = "naversearchapp://search?qmenu=qrcode&version=3";
		return path;
	}
	@RequestMapping(value = "store", method = {RequestMethod.GET, RequestMethod.POST})
	public String store(Model model, HttpServletRequest req) throws ServletException, IOException {
		logger.info("storeInfo 호출 성공");
		req.getParameter("store_name");
		req.getParameter("amount");
		req.getParameter("product");
		logger.info(req.getParameter("store_name")+req.getParameter("amount")+req.getParameter("product"));
		Map<String,Object> rMap = new HashMap<String,Object>();
		rMap.put("store_name", req.getParameter("store_name"));
		rMap.put("amount", req.getParameter("amount"));
		rMap.put("product", req.getParameter("product"));
		logger.info("rMap"+rMap);
		Map<String,Object>store = payLogic.store(rMap);
		store.put("card_num", card_num);
		logger.info(store);
		path="pay/store";
		model.addAttribute("store",store); //카드번호, 상품명, 상품금액, 카테고리명, 브랜드이름, 매장번호
		return path;
	}
	@RequestMapping(value = "complete", method = {RequestMethod.GET, RequestMethod.POST})
	public String complete(Model model, HttpServletRequest req,HttpServletResponse res, @RequestParam Map<String,Object> pMap) throws ServletException, IOException {
		logger.info("complete 호출 성공");
		pMap.put("store_name", HangulConversion.toUTF(pMap.get("store_name").toString()));
		pMap.put("product", HangulConversion.toUTF(pMap.get("product").toString()));
		pMap.put("brand_name", HangulConversion.toUTF(pMap.get("brand_name").toString()));
		pMap.put("cate_name", HangulConversion.toUTF(pMap.get("cate_name").toString()));
		logger.info(pMap);
//		pMap.put("amount", gmap.get("amount"));
		String complete =payLogic.complete(pMap);
		String completes[] = complete.split("\0");
		complete=complete.replace('\0', '!');
		String chainno = completes[0];
		logger.info(chainno);
		logger.info(complete);
		int result=payLogic.insertPay(completes);
		if(result==1) {
			logger.info("결제성공");
		if(chainno!=null&&chainno.length()>0) {
			Cookie cook = new Cookie("bk_"+chainno,complete);
			cook.setPath("/");
			cook.setMaxAge(60*60);
			res.addCookie(cook);
		}
		}else {
			logger.info("결제 실패");
		}
		model.addAttribute("complete",pMap);
		path="pay/complete";
		return path;
	}
	@RequestMapping(value = "info", method = {RequestMethod.GET, RequestMethod.POST})
	public String info(Model model, HttpServletRequest req, @RequestParam Map<String,Object> pMap) throws ServletException, IOException {
		logger.info(" 쿠키 값 확인하는 창 호출");
//		pMap.put("", );
//		pMap.put("", );
		model.addAttribute("idcard",pMap);
		path="pay/info";
		return path;
	}
}
