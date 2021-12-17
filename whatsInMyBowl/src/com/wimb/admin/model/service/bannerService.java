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
	
	// 페이징바에 사용할 등록된 베너게시글의 총 갯수를 구하는 Service
	public int selectListCount() {
		 Connection conn = getConnection();
		 int listCount = new bannerDao().selectListCount(conn);
		 close(conn);
		 
		 return listCount;
	}
}
