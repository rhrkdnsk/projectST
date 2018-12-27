package com.hk.trip.dto;

public class CheckLikeDto {
	String user_nickname;
	int seq_number;
	int boardcode;
	int board_num;
	public CheckLikeDto() {
		super();
	}
	public CheckLikeDto(String user_nickname, int seq_number, int boardcode, int board_num) {
		super();
		this.user_nickname = user_nickname;
		this.seq_number = seq_number;
		this.boardcode = boardcode;
		this.board_num = board_num;
	}
	@Override
	public String toString() {
		return "CheckLikeDto [user_nickname=" + user_nickname + ", seq_number=" + seq_number + ", boardcode="
				+ boardcode + ", board_num=" + board_num + "]";
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public int getSeq_number() {
		return seq_number;
	}
	public void setSeq_number(int seq_number) {
		this.seq_number = seq_number;
	}
	public int getBoardcode() {
		return boardcode;
	}
	public void setBoardcode(int boardcode) {
		this.boardcode = boardcode;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	
	
	
	
}
