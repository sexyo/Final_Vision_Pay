package com.member;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.vo.MemberVO;

@Service
public class MemberLogic {
	Logger logger = Logger.getLogger(MemberLogic.class);
	@Autowired
	MemberDao memberDao = null;
	String path = "";
	
	public Map<String, Object> login (Map<String,Object> pMap) {
		Map<String, Object> login = memberDao.login(pMap);
		return login;
	}

	public int check_id(String id) {
		int rowcount = memberDao.check_id(id);
		return rowcount;
	}

	public int join(MemberVO memberVO) {
		Map<String,Object> pMap = new HashMap<String,Object>();
		pMap.put("P_MEM_ID", memberVO.getMem_id());
		pMap.put("P_MEM_PW", memberVO.getMem_pw());
		pMap.put("P_MEM_BIRTHDAY", memberVO.getMem_birthday());
		pMap.put("P_MEM_PHONE", memberVO.getMem_phone());
		pMap.put("P_MEM_ADDR", memberVO.getMem_addr());
		pMap.put("P_MEM_MAIL", memberVO.getMem_email());
		pMap.put("P_MEM_NAME", memberVO.getMem_name());
		pMap.put("P_MEM_GEN", memberVO.getMem_gen());
		pMap.put("P_MEM_JOB", "무직");
		
		int result = memberDao.join(pMap);
		return result;
	}

	public Map<String, Object> refresh(Map<String, Object> pMap) {
		Map<String, Object> refresh = memberDao.refresh(pMap);
		return refresh;
	}
	

	

}
