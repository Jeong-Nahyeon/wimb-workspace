package com.wimb.admin.model.service;

import static com.wimb.common.JDBCTemplate.*;

import java.sql.Connection;

import com.wimb.admin.model.dao.termsDao;

public class termsService {
	
	public void selectTermsList() {
		Connection conn = getConnection();
		
		new termsDao().selectNoticeList(conn);
		
		
	}
	
}
