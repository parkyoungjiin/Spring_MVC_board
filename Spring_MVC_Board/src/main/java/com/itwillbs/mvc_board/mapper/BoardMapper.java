package com.itwillbs.mvc_board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.mvc_board.vo.BoardVO;

public interface BoardMapper {

	// 1. 게시물 등록
	// => 파라미터 : BoardVO 객체    리턴타입 : int
	int insertBoard(BoardVO board);

	List<BoardVO> getBoardList(
			@Param("searchType") String searchType,
			@Param("keyword") String keyword,
			@Param("startRow") int startRow,
			@Param("listLimit") int listLimit);

	int getBoardListCount(
			@Param("searchType") String searchType,
			@Param("keyword") String keyword);
	
	BoardVO getBoard(int board_num);
	//조회수 증가
	void increaseReadcount(int board_num);
	//삭제 전 비밀번호 확인
	BoardVO selectBoardWriter(@Param("board_num") int board_num,@Param("board_pass") String board_pass);
	//게시물 삭제
	int removeBoard(int board_num);
	//게시물 삭제 전 실제 파일 조회
	String getRealFile(int board_num);

	
}//Mapper 끝
