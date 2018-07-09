package com.spring.dao;

import java.util.ArrayList;
import java.util.Map;

import com.spring.dto.BoardDTO;

public interface BoardInter {

	ArrayList<BoardDTO> myWriteList(Map<String, String> params);

	int myWriteListCnt(Map<String, String> params);

}
