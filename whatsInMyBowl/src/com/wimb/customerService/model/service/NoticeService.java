package com.wimb.customerService.model.service;

import static com.wimb.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.admin.model.dao.bannerDao;
import com.wimb.common.model.vo.File;
import com.wimb.common.model.vo.PageInfo;
import com.wimb.customerService.model.dao.NoticeDao;
import com.wimb.customerService.model.vo.Notice;

public class NoticeService {
	
	// 고객센터 사용자 화면을 보여주는 Service
	public ArrayList<Notice> selectNoticeUserView(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectNoticeUserView(conn, pi);
		close(conn);
		return list;
	}
	
	// 페이징바에 사용할 등록된 공지사항글의 총 갯수를 구하는 Service
	public int selectListCount() {
		 Connection conn = getConnection();
		 int listCount = new NoticeDao().selectListCount(conn);
		 close(conn);
		 
		 return listCount;
	}
	
	// 공지사항 클릭 시 조회수를 증가시키는 SerVice
	public int increaseCount(int noticeNo) {
		Connection conn = getConnection();
		int result = new NoticeDao().increaseCount(conn, noticeNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	// 공지사항 글 클릭시 상세내용
	public Notice selectNotice(int noticeNo) {
		Connection conn = getConnection();
		Notice n = new NoticeDao().selectNotice(conn, noticeNo);
		close(conn);
		return n;
	}
	
	// 공지사항 관리자 화면을 보여주는 Service
	public ArrayList<Notice> selectAdminView(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectAdminView(conn, pi);
		close(conn);
		return list;
	}
	
	// 공지사항 등록하는 Service
	public int insertNotice(Notice n, ArrayList<File> list) {
		Connection conn = getConnection();
		
		System.out.println(list);
		int result1 = new NoticeDao().insertNotice(conn, n); // 공지사항 테이블에 insert
		int result2 = 1;
		
		if(!list.isEmpty()) {
			result2 = new NoticeDao().insertFile(conn, list);
		}
		
		if(result1 > 0 && result2 >0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result1*result2;
	}
	
	public int deleteNotice(String nCode) {
		Connection conn = getConnection();
		int result = new NoticeDao().deleteNotice(conn, nCode);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	/*관리자 상세보기 화면 조회용 */
	public Notice selectAdminNotice(int nCode) {
		Connection conn = getConnection();
		Notice n = new NoticeDao().selectAdminNotice(conn, nCode);
		close(conn);
		return n;
		
	}
	
	/*관리자 상세보기 화면 조회용 */
	public ArrayList<File> selectAdminFile(int nCode){
		Connection conn = getConnection();
		ArrayList<File> list = new NoticeDao().selectAdminFile(conn, nCode);
		close(conn);
		return list;
	}
	
	/* 수정 시 공통적으로 수행되는 update*/
	public int updateNotice(Notice n, ArrayList<File> list) {
		Connection conn = getConnection();
		int result1 = new NoticeDao().updateNotice(conn, n);
		
		int result2 = 1;
		if(!list.isEmpty()) { // 새로운 첨부파일이 있었을 경우
			
			for(File f:list) {
				if(f.getfCode() != 0) { // 기존의 첨부파일이 있었을 경우 => update file
					result2 = new NoticeDao().updateFile(conn, list);
					
				} else { // 기존의 첨부파일이 없었을 경우 => insert file
					result2 = new NoticeDao().insertNewFile(conn, list);
					
				}
			}
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
		
	}
	
	/* 검색기능 */
	public ArrayList<Notice> searchTitle(String searchWord){
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().searchTitle(conn, searchWord);
		
		close(conn);
		return list;
	}
	
	// 검색된 페이징바에 사용할 등록된 공지사항글의 총 갯수를 구하는 Service
	public int selectSerachListCount(String searchWord) {
		 Connection conn = getConnection();
		 int listCount = new NoticeDao().selectSerachListCount(conn, searchWord);
		 close(conn);
		 
		 return listCount;
	}
	
	
}
