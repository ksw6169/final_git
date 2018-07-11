package com.spring.dao;

import java.util.ArrayList;

import com.spring.dto.BoardDTO;

public interface BoardInter {

	ArrayList<BoardDTO> kimSayList();

	BoardDTO kimSayDetail(String board_no);

}
