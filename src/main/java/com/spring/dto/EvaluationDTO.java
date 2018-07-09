package com.spring.dto;

import java.sql.Timestamp;

public class EvaluationDTO {

	private int evaluation_no;
	private int company_no;
	private String member_id;
	private int evaluation_year;
	private int evaluation_salary;
	private int evaluation_night;
	private int evaluation_rest;
	private int evaluation_intern;
	private int evaluation_vacation;
	private String evaluation_comment;
	private Timestamp evaluation_date;
	public Timestamp getEvaluation_date() {
		return evaluation_date;
	}
	public void setEvaluation_date(Timestamp evaluation_date) {
		this.evaluation_date = evaluation_date;
	}
	public int getEvaluation_no() {
		return evaluation_no;
	}
	public void setEvaluation_no(int evaluation_no) {
		this.evaluation_no = evaluation_no;
	}
	public int getCompany_no() {
		return company_no;
	}
	public void setCompany_no(int company_no) {
		this.company_no = company_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getEvaluation_year() {
		return evaluation_year;
	}
	public void setEvaluation_year(int evaluation_year) {
		this.evaluation_year = evaluation_year;
	}
	public int getEvaluation_salary() {
		return evaluation_salary;
	}
	public void setEvaluation_salary(int evaluation_salary) {
		this.evaluation_salary = evaluation_salary;
	}
	public int getEvaluation_night() {
		return evaluation_night;
	}
	public void setEvaluation_night(int evaluation_night) {
		this.evaluation_night = evaluation_night;
	}
	public int getEvaluation_rest() {
		return evaluation_rest;
	}
	public void setEvaluation_rest(int evaluation_rest) {
		this.evaluation_rest = evaluation_rest;
	}
	public int getEvaluation_intern() {
		return evaluation_intern;
	}
	public void setEvaluation_intern(int evaluation_intern) {
		this.evaluation_intern = evaluation_intern;
	}
	public int getEvaluation_vacation() {
		return evaluation_vacation;
	}
	public void setEvaluation_vacation(int evaluation_vacation) {
		this.evaluation_vacation = evaluation_vacation;
	}
	public String getEvaluation_comment() {
		return evaluation_comment;
	}
	public void setEvaluation_comment(String evaluation_comment) {
		this.evaluation_comment = evaluation_comment;
	}
	
	
}
