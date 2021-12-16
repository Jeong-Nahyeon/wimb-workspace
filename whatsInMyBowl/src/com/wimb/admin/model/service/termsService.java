package com.wimb.admin.model.service;

import static com.wimb.common.JDBCTemplate.close;
import static com.wimb.common.JDBCTemplate.commit;
import static com.wimb.common.JDBCTemplate.getConnection;
import static com.wimb.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.admin.model.dao.termsDao;
import com.wimb.admin.model.vo.Terms;

public class termsService {
	
	// 이용약관 리스트를 가져오는 service
	public ArrayList<Terms> selectTermsList() {
		Connection conn = getConnection();
		
		ArrayList<Terms> list = new termsDao().selectTermsList(conn);
		close(conn);
		
		return list;
	}
	
	// 이용약관 등록하는 service
	public int insertTerms(String termsContent) {
		Connection conn = getConnection();
		
		int result = new termsDao().insertTerms(conn, termsContent);

		if(result > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	// 수정하기 클릭 시 선택한 이용약관의 내용을 불러오는 Service
	public Terms selectTerms(int termsCode) {
		Connection conn = getConnection();
		Terms t = new termsDao().selectTerms(conn, termsCode);
		
		close(conn);
		return t;
	}
	
	// 수정하기 창에서 수정 시 기존의 이용약관 내용을 변경하는 Service
	public int updateTerms(Terms t) {
		Connection conn = getConnection();
		int result = new termsDao().updateTerms(conn, t);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 이용약관, 개인정보처리방침 글을 삭제하는 Service
	public int deleteTerms(int termsCode) {
		Connection conn = getConnection();
		int result = new termsDao().deleteTerms(conn, termsCode);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
				
	}
	
	// 개인정보처리방침 리스트를 가져오는 Service
	public ArrayList<Terms> selectPersonalInformationTermsList() {
		Connection conn = getConnection();
		
		ArrayList<Terms> list = new termsDao().selectPersonalInformationTermsList(conn);
		close(conn);
		
		return list;
	}
	
	// 개인정보처리방침 등록하는 service
	public int insertPersonalInformationTerms(String termsContent) {
		Connection conn = getConnection();
		
		int result = new termsDao().insertPersonalInformationTerms(conn, termsContent);

		if(result > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
}
