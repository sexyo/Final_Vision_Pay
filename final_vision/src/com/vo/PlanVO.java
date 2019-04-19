package com.vo;

import java.util.List;
import java.util.Map;

public class PlanVO {
	private String mem_id    =  "";
	private String p_date 	 =  "";
	private List<Map<String, Object>> r_month = null;
	private List<Map<String, Object>> r_cate = null;
	private List<Map<String, Object>> r_store_sum = null;
	private List<Map<String, Object>> r_store_cnt = null;
	private List<Map<String, Object>> r_day = null;
	private List<Map<String, Object>> r_week = null;
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public List<Map<String, Object>> getR_month() {
		return r_month;
	}
	public void setR_month(List<Map<String, Object>> r_month) {
		this.r_month = r_month;
	}
	public List<Map<String, Object>> getR_cate() {
		return r_cate;
	}
	public void setR_cate(List<Map<String, Object>> r_cate) {
		this.r_cate = r_cate;
	}
	public List<Map<String, Object>> getR_store_sum() {
		return r_store_sum;
	}
	public void setR_store_sum(List<Map<String, Object>> r_store_sum) {
		this.r_store_sum = r_store_sum;
	}
	public List<Map<String, Object>> getR_store_cnt() {
		return r_store_cnt;
	}
	public void setR_store_cnt(List<Map<String, Object>> r_store_cnt) {
		this.r_store_cnt = r_store_cnt;
	}
	public List<Map<String, Object>> getR_day() {
		return r_day;
	}
	public void setR_day(List<Map<String, Object>> r_day) {
		this.r_day = r_day;
	}
	public List<Map<String, Object>> getR_week() {
		return r_week;
	}
	public void setR_week(List<Map<String, Object>> r_week) {
		this.r_week = r_week;
	}

	}
