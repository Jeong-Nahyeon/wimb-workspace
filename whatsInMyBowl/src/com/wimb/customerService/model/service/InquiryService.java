package com.wimb.customerService.model.service;

import static com.wimb.common.JDBCTemplate.close;
import static com.wimb.common.JDBCTemplate.commit;
import static com.wimb.common.JDBCTemplate.getConnection;
import static com.wimb.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.common.model.vo.File;
import com.wimb.common.model.vo.PageInfo;
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
	
	// 관리자 - 1:1문의 처리중인 페이징바 리스트 수 메소드
	public int selectInquiryProcessingListCount() {
		Connection conn = getConnection();
		int listCount = new InquiryDao().selectInquiryProcessingListCount(conn);
		 close(conn);
		 
		 return listCount;
	}
	
	// 관리자 - 1:1문의 처리중인 리스트를 띄우는 메소드
	public ArrayList<Inquiry> selectInquiryProcessingAdminView(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Inquiry> list = new InquiryDao().selectInquiryProcessingAdminView(conn, pi);
		close(conn);
		return list;		
	}
	
	// 관리자 - 1:1문의 처리완료 페이징바 리스트 수 메소드
	public int selectInquiryCompletionListCount() {
		Connection conn = getConnection();
		int listCount = new InquiryDao().selectInquiryCompletionListCount(conn);
		 close(conn);
		 
		 return listCount;
	}
	
	// 관리자 - 1:1문의 처리완료 리스트를 띄우는 메소드
	public ArrayList<Inquiry> selectInquiryCompletionAdminView(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Inquiry> list = new InquiryDao().selectInquiryCompletionAdminView(conn, pi);
		close(conn);
		return list;		
	}
}
