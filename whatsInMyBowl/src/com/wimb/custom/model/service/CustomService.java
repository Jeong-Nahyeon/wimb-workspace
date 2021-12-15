package com.wimb.custom.model.service;

import static com.wimb.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.custom.model.dao.CustomDao;
import com.wimb.custom.model.vo.Item;
public class CustomService {
	
	public ArrayList<Item> selectItemList(){
		Connection conn = getConnection();
		ArrayList<Item> list = new CustomDao().selectItemList(conn);
		
		close(conn);
		return list;
	}

}
