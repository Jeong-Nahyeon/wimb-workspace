package com.wimb.member.model.service;


import static com.wimb.common.JDBCTemplate.*;


import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.common.model.vo.PageInfo;
import com.wimb.member.model.dao.MemberDao;
import com.wimb.member.model.vo.Member;
import com.wimb.member.model.vo.Point;
import com.wimb.member.model.vo.PointCategory;

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
	
	public int pwdCheck(String userId, String checkPwd) {
		
		Connection conn = getConnection();
		int count = new MemberDao().pwdCheck(conn, userId, checkPwd);
		
		close(conn);
		return count;
	}
	
	public int deleteMember(String userId, String userPwd, String reason) {
		
		Connection conn = getConnection();
		int result = new MemberDao().deleteMember(conn, userId, userPwd, reason);
		
		close(conn);
		return result;
		
	}
	
	public Member updateMember(Member m) {
		
		Connection conn = getConnection();
		int result = new MemberDao().updateMember(conn, m);
		
		Member updateMem = null;
		
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, m.getmId());
		}else {
			rollback(conn);
		}
		
		return updateMem;
	}
	
	public int selectMemberCount() {
		Connection conn = getConnection();
		int listCount = new MemberDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	public ArrayList<Member> selectAllMember(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().selectAllMember(conn, pi);
		close(conn);
		return list;
		
	}
	
	public ArrayList<Point> selectPoint(String userId, String startDate, String endDate){
		Connection conn = getConnection();
		ArrayList<Point> list = new MemberDao().selectPoint(conn, userId, startDate, endDate);
		close(conn);
		return list;
	}
	
	public String searchIdEmail(String userEmail, String userName) {
		Connection conn = getConnection();
		String userId = new MemberDao().searchIdEmail(conn, userEmail, userName);
		close(conn);
		return userId;
	}
	
	public String searchIdPhone(String userPhone, String userName) {
		Connection conn = getConnection();
		String userId = new MemberDao().searchIdPhone(conn, userPhone, userName);
		close(conn);
		return userId;
	}

	public int searchPwd(String userId, String userName, String userEmail) {
		Connection conn = getConnection();
		int count = new MemberDao().searchPwd(conn, userId, userName, userEmail);
		close(conn);
		return count;
	}
	
	
	public int changePwd(String userId, String userPwd) {
		Connection conn = getConnection();
		int result = new MemberDao().changePwd(conn, userId, userPwd);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public ArrayList<PointCategory> selectPointCategory(){
		Connection conn = getConnection();
		ArrayList<PointCategory> list = new MemberDao().selectPointCategory(conn);
		close(conn);
		return list;
	}
	
	public int pointCategoryCount() {
		Connection conn = getConnection();
		int count = new MemberDao().pointCategoryCount(conn);
		close(conn);
		return count;
	}
	
	public ArrayList<PointCategory> addPointCategory(String pointName, int pointAmount) {
		Connection conn = getConnection();
		int result = new MemberDao().addPointCategory(conn, pointName, pointAmount);
		ArrayList<PointCategory> updateList = new ArrayList<>();
		
		if(result > 0) {
			commit(conn);
			
			updateList = new MemberDao().selectPointCategory(conn);
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return updateList;
		
	}
	
	public Member selectMember(String userId) {
		Connection conn = getConnection();
		Member m = new MemberDao().selectMember(conn, userId);
		close(conn);
		return m;
	}
	
	public Member updateMemberA(Member m) {
		
		Connection conn = getConnection();
		int result = new MemberDao().updateMemberA(conn, m);
		
		Member updateMem = null;
		
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, m.getmId());
		}else {
			rollback(conn);
		}
		
		return updateMem;
	}
	
	public int deleteMemberA(int userNo) {
		
		Connection conn = getConnection();
		int result = new MemberDao().deleteMemberA(conn, userNo);
		close(conn);
		return result;
	}
}
