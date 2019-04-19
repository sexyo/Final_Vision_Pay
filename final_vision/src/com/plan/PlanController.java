package com.plan;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vo.PlanVO;

@Controller
@RequestMapping(value = "/plan/")
public class PlanController {
	Logger logger = Logger.getLogger(PlanController.class);
	@Autowired
	PlanLogic planLogic = null;

	@GetMapping("planList")
	public String planList(@ModelAttribute PlanVO planVO, HttpServletRequest req) throws ServletException, IOException {
		logger.info("planList 호출 성공");
		HttpSession session = req.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		planVO.setMem_id(mem_id);
		logger.info("회원 아이디 : "+mem_id);
		planVO = planLogic.planList(planVO); 
		session.setAttribute("planVO", planVO);
		session.setMaxInactiveInterval(60 * 60);
		return "plan/planner";
	}

	@PostMapping("spendingMonth") // URL예시 : http://localhost:9000/plan/spendingMonth?mem_id=Piper
									// Rich&month=20190101
	public String spendingMonth(@ModelAttribute PlanVO planVO, Model model) throws ServletException, IOException {
		model.addAttribute("month", planVO.getP_date());
		return "plan/spendingMonth";
	}

	@PostMapping("spendingCategory")
	public String spendingCategory(@ModelAttribute PlanVO planVO, Model model) throws ServletException, IOException {
		model.addAttribute("month", planVO.getP_date());
		return "plan/spendingCategory";
	}
	
	@PostMapping("spendingCategory1")
	public String spendingCategory1(@ModelAttribute PlanVO planVO, Model model) throws ServletException, IOException {
		model.addAttribute("month", planVO.getP_date());
		return "plan/spendingCategory1";
	}

	@PostMapping("spendingStore")
	public String spendingStore(@ModelAttribute PlanVO planVO, Model model) throws ServletException, IOException {
		// 매장별 지출 (결제 많은순(건 기준) | 지출순(지출합계기준))
		// 이것도 6개월치를 뽑아야 한다.
		logger.info("memid : " + planVO.getMem_id() + " , month :" + planVO.getP_date());
		planVO = planLogic.spendingStore(planVO);
		model.addAttribute("planVO", planVO);
		logger.info(planVO.getR_store_cnt().size());
		return "plan/spendingStore";
	}

	@PostMapping("total_Week")
	public String total_Week(@ModelAttribute PlanVO planVO, Model model) throws ServletException, IOException {
		model.addAttribute("month", planVO.getP_date());
		return "plan/total_Week";
	}

	@PostMapping("total_Week1")
	public String total_Week1(@ModelAttribute PlanVO planVO, Model model) throws ServletException, IOException {
		model.addAttribute("month", planVO.getP_date());
		return "plan/total_Week1";
	}

	@PostMapping("total_Day")
	public String total_Day(@ModelAttribute PlanVO planVO, Model model) throws ServletException, IOException {
		model.addAttribute("month", planVO.getP_date());
		return "plan/total_Day";
	}

	@GetMapping("mainCarousel")
	public String mainCarousel(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("planList 호출 성공");
		HttpSession session = req.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		logger.info("회원 아이디 : " + mem_id);
		PlanVO planVO = new PlanVO();
		planVO.setMem_id(mem_id);
		planVO = planLogic.mainCarousel(planVO);
		session.setAttribute("planVO", planVO);
		session.setMaxInactiveInterval(60 * 60);
		return "member/mainCarousel";
	}

	@GetMapping("total_Budget")
	public ModelAndView total_Budget(@ModelAttribute PlanVO planVO, Model model, HttpServletRequest req)
			throws ServletException, IOException {
		// insert here
		// 메소드이름으로 알맞게 타입정하고
		// 메소드이름=로직.같은이름메소드(VO);

		ModelAndView mav = new ModelAndView();
		// mav.addObject("total_Budget", total_Budget);
		mav.setViewName("plan/total_Budget");
		return mav;
	}

	@GetMapping("card_Budget")
	public ModelAndView card_Budget(@ModelAttribute PlanVO planVO, Model model, HttpServletRequest req)
			throws ServletException, IOException {
		// insert here
		// 메소드이름으로 알맞게 타입정하고
		// 메소드이름=로직.같은이름메소드(VO);

		ModelAndView mav = new ModelAndView();
		// mav.addObject("card_Budget", card_Budget);
		mav.setViewName("common/UI_common");
		return mav;
	}

	@GetMapping("otherUsersSpending")
	public ModelAndView otherUsersSpending(@ModelAttribute PlanVO planVO, Model model, HttpServletRequest req)
			throws ServletException, IOException {
		// insert here
		// 메소드이름으로 알맞게 타입정하고
		// 메소드이름=로직.같은이름메소드(VO);

		ModelAndView mav = new ModelAndView();
		// mav.addObject("otherUsersSpending", otherUsersSpending);
		mav.setViewName("member/main");
		return mav;
	}

}
