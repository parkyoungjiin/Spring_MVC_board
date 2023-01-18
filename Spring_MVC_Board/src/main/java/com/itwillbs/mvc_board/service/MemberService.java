package com.itwillbs.mvc_board.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//서비스 클래스 역할 -> @Service 지정해야 함.

import com.itwillbs.mvc_board.mapper.MemberMapper;
import com.itwillbs.mvc_board.vo.MemberVO;

@Service
public class MemberService {
	@Autowired
	private MemberMapper mapper;
	public int joinMember(MemberVO member) {
		//Mapper 객체 메서드 호출하여 SQL 구문 실행 요청
		
		return mapper.insertMember(member);
	}//joinMember
	
	//BCryptPasswordEncoder 활용한 로그인 작업 - getPasswd()
	// -> 파라미터 : 아이디 , 리턴타입 : String
	public String getPasswd(String id) {
		
		return mapper.selectPasswd(id);
	}//getPasswd
	
	public MemberVO getMemberInfo(String id) {
		
		return mapper.selectMemberInfo(id);
	}//getMemberInfo
	
	public List<MemberVO> getMemberList() {
		
		return mapper.selectMemberList();
	}//getMemberList

	public int modifyMemberInfo(MemberVO member, String newPasswd) {
		return mapper.updateMemberInfo(member, newPasswd);
	}

}
