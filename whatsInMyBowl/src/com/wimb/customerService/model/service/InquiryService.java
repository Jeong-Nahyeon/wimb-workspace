package com.wimb.customerService.model.service;

import static com.wimb.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.common.model.vo.File;

import com.wimb.customerService.model.dao.InquiryDao;
import com.wimb.customerService.model.vo.Inquiry;


public class InquiryService {

	// 사용자 - 1:1문의 등록
	public int insertInquiry(Inquiry inq, ArrayList<File> list) {
		Connection conn = getConnection();
		
		int result1 = new InquiryDao().insertInquiry(conn, inq);
		int result2 = 1;

		if(!list.isEmpty()) {
			result2 = new InquiryDao().insertFile(conn, list);
		}

		if(result1 > 0 && result2 >0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result1*result2;
		
	}
	
	

}
