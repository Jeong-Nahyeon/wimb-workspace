package com.wimb.customerService.model.service;

import static com.wimb.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.common.model.vo.File;
import com.wimb.customerService.model.dao.InqueryDao;
import com.wimb.customerService.model.vo.Inquery;

public class InqueryService {

	// 사용자 - 1:1문의 등록
	public int insertInquery(Inquery inq, ArrayList<File> list) {
		Connection conn = getConnection();
		
		int result1 = new InqueryDao().insertInquery(conn, inq);
		int result2 = 1;
		System.out.println(result1);
		System.out.println(result2);
		if(!list.isEmpty()) {
			result2 = new InqueryDao().insertFile(conn, list);
		}
		System.out.println(result2);
		if(result1 > 0 && result2 >0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result1*result2;
		
	}
	
	

}
