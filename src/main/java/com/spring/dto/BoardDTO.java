package com.spring.dto;

import java.sql.Timestamp;

public class BoardDTO {

	//추천 테이블의 컬럼은 board 테이블의 컬럼과 동일 따로 만들지 x
	private int board_no;
	private String member_id;
	private int job_no;
	private String job_name;
	private String board_title;
	private String board_content;
	private String board_photo;
	private String board_category;
	private int board_bHit;
	private Timestamp board_date;
	private int board_recom;
	private int board_reply;
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
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
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_photo() {
		return board_photo;
	}
	public void setBoard_photo(String board_photo) {
		this.board_photo = board_photo;
	}
	public String getBoard_category() {
		return board_category;
	}
	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}
	public int getBoard_bHit() {
		return board_bHit;
	}
	public void setBoard_bHit(int board_bHit) {
		this.board_bHit = board_bHit;
	}
	public Timestamp getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Timestamp board_date) {
		this.board_date = board_date;
	}
	public int getBoard_recom() {
		return board_recom;
	}
	public void setBoard_recom(int board_recom) {
		this.board_recom = board_recom;
	}
	public int getBoard_reply() {
		return board_reply;
	}
	public void setBoard_reply(int board_reply) {
		this.board_reply = board_reply;
	}
	
	
	
	
}
