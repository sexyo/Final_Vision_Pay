package com.pay;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping(value="/pay/")
public class PayController {
	String path = "";
	@RequestMapping(value = "payment", method = {RequestMethod.GET, RequestMethod.POST})
	public String payment(Model model, HttpServletRequest req, @RequestParam Map<String,Object> pMap) throws ServletException, IOException {
		path = "pay/payment";
		return path;
	}
	@RequestMapping(value = "paymentPW", method = {RequestMethod.GET, RequestMethod.POST})
	public String paymentPW(Model model, HttpServletRequest req, @RequestParam Map<String,Object> pMap) throws ServletException, IOException {
		path = "pay/paymentPW";
		return path;
	}
	@RequestMapping(value = "paris", method = {RequestMethod.GET, RequestMethod.POST})
	public String paris(Model model, HttpServletRequest req, @RequestParam Map<String,Object> pMap) throws ServletException, IOException {
		path = "pay/PARIS";
		return path;
	}
}
