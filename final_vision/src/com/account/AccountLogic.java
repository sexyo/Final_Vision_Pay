package com.account;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vo.AccountVO;
@Service
public class AccountLogic {
	@Autowired
	AccountDao accountDao = null;

	public List<Map<String, Object>> accountList(Map<String, Object> pMap) {//계좌리스트
		List<Map<String,Object>> accountList = null;
		accountList = accountDao.accountList(pMap);
		return accountList;
	}
	public int accountAdd(Map<String, Object> pMap) {
		int accountAdd = accountDao.accountAdd(pMap);
		return accountAdd;
	}
	public Map<String, List<Map<String, Object>>> accHistory(Map<String, Object> pMap) {
		
		Map<String, List<Map<String, Object>>> accHistory = accountDao.accHistory(pMap);
		return accHistory;
	}
	public int accTransfer(Map<String, Object> pMap) {
		 int accTransfer = accountDao.accTransfer(pMap);
		return accTransfer;
	}
	public List<Map<String, Object>> accountList3(String mem_id) {
	List<Map<String,Object>> accountList = accountDao.accountList3(mem_id);
	return accountList;
}
	

}
