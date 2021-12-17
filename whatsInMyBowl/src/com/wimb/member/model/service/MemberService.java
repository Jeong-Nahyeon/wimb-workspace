package com.wimb.member.model.service;


import static com.wimb.common.JDBCTemplate.*;

import java.sql.Connection;

import com.wimb.member.model.dao.MemberDao;
import com.wimb.member.model.vo.Member;

public class MemberService {
	
	// 관리자 로그인
	public Member loginMember(String userId, String userPwd) {
		
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		close(conn);
		return m;	
	}
	
	// 아이디 더블체크
	public int idCheck(String checkId) {
		
		Connection conn = getConnection();
		int count = new MemberDao().idCheck(conn, checkId);
		
		close(conn);
		return count;
	}
	
	public int emailCheck(String checkEmail) {
			
		Connection conn = getConnection();
		int count = new MemberDao().emailCheck(conn, checkEmail);
		
		close(conn);
		return count;
	}
	
	public int insertMember(Member m) {
		
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn, m);
		
		close(conn);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
		
	}
	
	

}
