package com.wimb.admin.model.service;

import static com.wimb.common.JDBCTemplate.close;
import static com.wimb.common.JDBCTemplate.commit;
import static com.wimb.common.JDBCTemplate.getConnection;
import static com.wimb.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.admin.model.dao.bannerDao;
import com.wimb.admin.model.vo.Banner;
import com.wimb.common.model.vo.PageInfo;

public class bannerService {
	
	// 배너를 등록하는 Service
	public int insertBanner(Banner b) {
		Connection conn = getConnection();
		int result = new bannerDao().insertBanner(conn, b);
		
		if(result> 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	// 전체보기 시 배너 리스트를 조회하는 Service
	public ArrayList<Banner> selectBannerList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Banner> list = new bannerDao().selectBannerList(conn, pi);
		close(conn);
		return list;
	}
	
	// 게시중인 배너 리스트를 조회하는 Service
	public ArrayList<Banner> selectPostingBannerList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Banner> list = new bannerDao().selectPostingBannerList(conn, pi);
		close(conn);
		return list;
	}
	
	// 게시종료 배너 리스트를 조회하는 Service
	public ArrayList<Banner> selectEndOfPostingBannerList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Banner> list = new bannerDao().selectEndOfPostingBannerList(conn, pi);
		close(conn);
		return list;
	}
	
	// 페이징바에 사용할 등록된 베너게시글의 총 갯수를 구하는 Service
	public int selectListCount() {
		 Connection conn = getConnection();
		 int listCount = new bannerDao().selectListCount(conn);
		 close(conn);
		 
		 return listCount;
	}
	
	// 페이징바에 사용할 게시중인 베너게시글의 총 갯수를 구하는 Service
	public int selectPostingListCount() {
		 Connection conn = getConnection();
		 int listCount = new bannerDao().selectPostingListCount(conn);
		 close(conn);
		 
		 return listCount;
	}
	
	// 페이징바에 사용할 게시종료한 베너게시글의 총 갯수를 구하는 Service
	public int selectEndPostingListCount() {
		 Connection conn = getConnection();
		 int listCount = new bannerDao().selectEndPostingListCount(conn);
		 close(conn);
		 
		 return listCount;
	}
	
	
	// 메인배너에 등록된 사진을 띄워주는 서비스
	public ArrayList<Banner> selectMainBanner() {
		Connection conn = getConnection();
		ArrayList<Banner> list = new bannerDao().selectMainBanner(conn);
		close(conn);
		return list;
	}
	
	// 배너 '변경'클릭 시 상태 변경해주는 서비스
	public int statusChange(int bCode) {
		Connection conn = getConnection();
		
		int result1 = new bannerDao().statusChangeY(conn, bCode);
		int result2 = new bannerDao().statusChangeN(conn, bCode); 
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
		
			
		
		
	}
	
	
	
}
