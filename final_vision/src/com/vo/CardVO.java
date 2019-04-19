package com.vo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CardVO {


String mem_id = "";
String p_mem_id = "";
String card_num = "";
List<Map<String,String>> r_list = new ArrayList<Map<String,String>>();

public String getP_mem_id() {
	return p_mem_id;
}

public void setP_mem_id(String p_mem_id) {
	this.p_mem_id = p_mem_id;
}

public List<Map<String, String>> getR_list() {
	return r_list;
}

public void setR_list(List<Map<String, String>> r_list) {
	this.r_list = r_list;
}

public String getMem_id() {
	return mem_id;
}

public void setMem_id(String mem_id) {
	this.mem_id = mem_id;
}

public String getCard_num() {
	return card_num;
}

public void setCard_num(String card_num) {
	this.card_num = card_num;
}





	
	
}
