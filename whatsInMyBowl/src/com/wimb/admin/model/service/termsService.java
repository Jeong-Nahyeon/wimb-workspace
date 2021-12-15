package com.wimb.admin.model.service;

import static com.wimb.common.JDBCTemplate.*;

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
	
	
	
	
	
	
	
	
	
	
	
}
