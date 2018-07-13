package com.spring.dto;

public class MemberDTO {

	private String member_id;
	private String member_pw;
	private String member_email;
	private String member_family;
	private String member_capture;
	private String member_company;
	private String member_div;
	private String member_cert;
	private String member_eval;
	private int job_no;
	private String job_name;
	private int rnum;
	
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	private String div;	// 회원가입 요청 구분(0712 추가_성원)
	
	public String getDiv() {
		return div;
	}
	public void setDiv(String div) {
		this.div = div;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_family() {
		return member_family;
	}
	public void setMember_family(String member_family) {
		this.member_family = member_family;
	}
	public String getMember_capture() {
		return member_capture;
	}
	public void setMember_capture(String member_capture) {
		this.member_capture = member_capture;
	}
	public String getMember_company() {
		return member_company;
	}
	public void setMember_company(String member_company) {
		this.member_company = member_company;
	}
	public String getMember_div() {
		return member_div;
	}
	public void setMember_div(String member_div) {
		this.member_div = member_div;
	}
	public String getMember_cert() {
		return member_cert;
	}
	public void setMember_cert(String member_cert) {
		this.member_cert = member_cert;
	}
	public String getMember_eval() {
		return member_eval;
	}
	public void setMember_eval(String member_eval) {
		this.member_eval = member_eval;
	}
	public int getJob_no() {
		return job_no;
	}
	public void setJob_no(int job_no) {
		this.job_no = job_no;
	}
	public String getJob_name() {
		return job_name;
	}
	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}
	
	
	
	
}
