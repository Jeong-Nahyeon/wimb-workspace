package com.wimb.admin.model.service;

import static com.wimb.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.admin.model.dao.bannerDao;
import com.wimb.admin.model.vo.Banner;

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
	
	
	
	
}
