package com.spring.dto;

public class CompanyDTO {

	private int company_no;
	private String company_name;
	private int company_salary;
	private int company_user;
	private int company_money;
	private int company_code;
	private String company_addr;
	private int company_eval;
	private int company_bHit;
	private float evaluatino_nightAVG;//기업평가 야근 평균
	private float evaluatino_restAVG;//기업평가 휴식시간 평균
	private float evaluatino_internAVG; //기업평가 인턴채용률 평균
	private float evaluatino_vacationAVG; //기업평가 연차사용압력 평균
	public int getCompany_bHit() {
		return company_bHit;
	}
	public void setCompany_bHit(int company_bHit) {
		this.company_bHit = company_bHit;
	}
	public int getCompany_no() {
		return company_no;
	}
	public void setCompany_no(int company_no) {
		this.company_no = company_no;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public int getCompany_salary() {
		return company_salary;
	}
	public void setCompany_salary(int company_salary) {
		this.company_salary = company_salary;
	}
	public int getCompany_user() {
		return company_user;
	}
	public void setCompany_user(int company_user) {
		this.company_user = company_user;
	}
	public int getCompany_money() {
		return company_money;
	}
	public void setCompany_money(int company_money) {
		this.company_money = company_money;
	}
	public int getCompany_code() {
		return company_code;
	}
	public void setCompany_code(int company_code) {
		this.company_code = company_code;
	}
	public String getCompany_addr() {
		return company_addr;
	}
	public void setCompany_addr(String company_addr) {
		this.company_addr = company_addr;
	}
	public int getCompany_eval() {
		return company_eval;
	}
	public void setCompany_eval(int company_eval) {
		this.company_eval = company_eval;
	}
	public float getEvaluatino_nightAVG() {
		return evaluatino_nightAVG;
	}
	public void setEvaluatino_nightAVG(float evaluatino_nightAVG) {
		this.evaluatino_nightAVG = evaluatino_nightAVG;
	}
	public float getEvaluatino_restAVG() {
		return evaluatino_restAVG;
	}
	public void setEvaluatino_restAVG(float evaluatino_restAVG) {
		this.evaluatino_restAVG = evaluatino_restAVG;
	}
	public float getEvaluatino_internAVG() {
		return evaluatino_internAVG;
	}
	public void setEvaluatino_internAVG(float evaluatino_internAVG) {
		this.evaluatino_internAVG = evaluatino_internAVG;
	}
	public float getEvaluatino_vacationAVG() {
		return evaluatino_vacationAVG;
	}
	public void setEvaluatino_vacationAVG(float evaluatino_vacationAVG) {
		this.evaluatino_vacationAVG = evaluatino_vacationAVG;
	}
	
	
}
