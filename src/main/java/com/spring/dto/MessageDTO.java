package com.spring.dto;

import java.sql.Timestamp;

public class MessageDTO {

	private int message_no;
	private String member_id;
	private String message_receive;
	private String message_content;
	private String message_read;
	private Timestamp message_date;
	public int getMessage_no() {
		return message_no;
	}
	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMessage_receive() {
		return message_receive;
	}
	public void setMessage_receive(String message_receive) {
		this.message_receive = message_receive;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public String getMessage_read() {
		return message_read;
	}
	public void setMessage_read(String message_read) {
		this.message_read = message_read;
	}
	public Timestamp getMessage_date() {
		return message_date;
	}
	public void setMessage_date(Timestamp message_date) {
		this.message_date = message_date;
	}
	
	
	
}
