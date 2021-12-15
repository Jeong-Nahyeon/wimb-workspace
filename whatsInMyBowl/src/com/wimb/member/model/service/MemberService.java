package com.wimb.member.model.service;

import static com.wimb.common.JDBCTemplate.*;

import java.sql.Connection;

import com.wimb.common.JDBCTemplate;
import com.wimb.member.model.dao.MemberDao;
import com.wimb.member.model.vo.Member;

public class MemberService {
	
	// 관리자 로그인
	public Member loginMember(String mId, String mPwd) {
		
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, mId, mPwd);
		
		close(conn);
		return m;	
	}
	
	
	
	
	
	
	
	

}
