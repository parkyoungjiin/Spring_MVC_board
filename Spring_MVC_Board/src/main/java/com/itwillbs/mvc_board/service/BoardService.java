package com.itwillbs.mvc_board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.mvc_board.mapper.BoardMapper;
import com.itwillbs.mvc_board.vo.BoardVO;

@Service
public class BoardService {
	@Autowired
	private BoardMapper mapper;

	// 게시물 등록 작업 수행
	// => 파라미터 : BoardVO 객체    리턴타입 : int(insertCount)
	public int registBoard(BoardVO board) {
		return mapper.insertBoard(board);
	}

	//게시물 목록 조회
	public List<BoardVO> getBoardList(String searchType, String keyword, int startRow, int listLimit) {
		return mapper.getBoardList(searchType, keyword, startRow, listLimit);
	}

	//전체 게시물 수 조회
	
	public int getBoardListCount(String searchType, String keyword) {
		return  mapper.getBoardListCount(searchType, keyword);
	}

	public BoardVO getBoard(int board_num) {
		return mapper.getBoard(board_num);
	}

	public void increaseReadcount(int board_num) {
		mapper.increaseReadcount(board_num);
	}

	public BoardVO selectBoardWriter(int board_num, String board_pass) {
		return mapper.selectBoardWriter(board_num, board_pass);
	}

	public String getRealFile(int board_num) {
		return mapper.getRealFile(board_num);
	}

	public int removeBoard(int board_num) {
//		return mapper.removeBoard(board_num);
		return 1;
	}

	
}	











