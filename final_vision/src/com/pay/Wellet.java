package com.pay;

import java.util.List;
import java.util.Map;
//DB에서 불러낸 정보와 결제가 일어날때의 비교 및 결제내역에 뿌리기 위한 정보 위한 지갑 생성
public class Wellet {
	public Map<String,Object> info = null;
	public List<String> hashList=null;
	public Wellet (Map<String,Object> pMap,List<String> hashList) {
		this.info = pMap;
		this.hashList = hashList;
	}
	 
}
	