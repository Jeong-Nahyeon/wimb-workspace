package com.wimb.mypage.model.dao;

import static com.wimb.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.wimb.mypage.model.vo.MyOrders;

public class MyPageDao {
	
	// Properties 객체 생성
	private Properties prop = new Properties();
	
	public MyPageDao() {
		
		try {
			prop.loadFromXML(new FileInputStream( MyPageDao.class.getResource("/db/sql/mypage-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	// Properties 객체 생성 끝
	
	// 1
	public ArrayList<MyOrders> selectOrderList(Connection conn, int mCode) {
		ArrayList<MyOrders> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOrderList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mCode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				MyOrders mo = new MyOrders(rset.getInt("order_code"),
										   rset.getInt("order_amount"),
										   rset.getString("order_company"),
										   rset.getString("order_invoice"),
										   rset.getString("order_status"),
										   rset.getDate("order_date"),
										   rset.getString("cu_Name"),
										   rset.getString("p_Name"),
										   rset.getInt("pm_totalcost"));
				list.add(mo);	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	
	
}
