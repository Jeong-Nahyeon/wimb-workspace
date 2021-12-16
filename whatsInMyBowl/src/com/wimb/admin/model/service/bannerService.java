package com.wimb.admin.model.service;

import static com.wimb.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.admin.model.dao.bannerDao;
import com.wimb.admin.model.vo.Banner;

public class bannerService {
	
	public ArrayList<Banner> selectBannerList(){
		Connection conn = getConnection();
		
		ArrayList<Banner> list = new bannerDao().selectBannerList(conn);
		close(conn);
		return list;
	}
	
	
	
	
	
}
