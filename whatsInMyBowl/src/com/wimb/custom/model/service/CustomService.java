package com.wimb.custom.model.service;

import static com.wimb.common.JDBCTemplate.*;
import static com.wimb.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.common.model.vo.PageInfo;
import com.wimb.custom.model.dao.CustomDao;
import com.wimb.custom.model.vo.Item;
public class CustomService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new CustomDao().selectListCount(conn);
		close(conn);
		
		return listCount;
	}
	
	// 재료 목록 조회
	public ArrayList<Item> selectItemList(){
		Connection conn = getConnection();
		ArrayList<Item> list = new CustomDao().selectItemList(conn);
		
		close(conn);
		return list;
	}
	
	public ArrayList<Item> selectAdminItemList(PageInfo	pi){
		Connection conn = getConnection();
		ArrayList<Item> list = new CustomDao().selectAdminItemList(conn, pi);
		
		close(conn);
		return list;
	}
	
	// 대표이미지 관리
	public int updateMainImg(Item i) {
		Connection conn = getConnection();
		int result = new CustomDao().updateMainImg(conn, i);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	// 재료등록
	public int insertItemAdmin(Item i) {
		Connection conn = getConnection();
		int result = new CustomDao().insertItemAdmin(conn, i);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	// 재료 하나 조회
	public Item selectItem(String ciCode) {
		Connection conn = getConnection();
		Item i = new CustomDao().selectItem(conn, ciCode);
		
		close(conn);
		return i;
	}
	
	// 재료 수정
	public int updateItem(Item i) {
		Connection conn = getConnection();
		int result = new CustomDao().updateItem(conn, i);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	

}
