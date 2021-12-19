package com.wimb.custom.model.service;

import static com.wimb.common.JDBCTemplate.close;
import static com.wimb.common.JDBCTemplate.commit;
import static com.wimb.common.JDBCTemplate.getConnection;
import static com.wimb.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.common.model.vo.PageInfo;
import com.wimb.custom.model.dao.CustomDao;
import com.wimb.custom.model.vo.Custom;
import com.wimb.custom.model.vo.CustomItem;
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
	
	// 노출여부수정
	public int updateItemShow(Item i) {
		Connection conn =getConnection();
		int result = new CustomDao().updateItemShow(conn, i);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	
	// 카테고리별 목록조회
	public ArrayList<Item> selecAdminCategoryList(String ciCategory){
		Connection conn = getConnection();
		ArrayList<Item> list = new CustomDao().selecAdminCategoryList(conn, ciCategory);
		close(conn);
		return list;
	}

	// 관리자 비밀번호 체크
	public String pwdCheck() {
		Connection conn = getConnection();
		String checkPwd = new CustomDao().pwdCheck(conn);
		
		close(conn);
		return checkPwd;
	}

	// 재료 삭제
	public int deleteItem(String ciCode) {
		Connection conn = getConnection();
		int result = new CustomDao().deleteItem(conn, ciCode);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	// 재료 검색
	public ArrayList<Item> searchItem(String searchWord) {
		Connection conn = getConnection();
		ArrayList<Item> list = new CustomDao().searchItem(conn, searchWord);
		close(conn);
		return list;
	}

	public String insertCustom(Custom c) {
		Connection conn = getConnection();
		String ciCode = new CustomDao().insertCustom(conn, c);
		
		if(ciCode != null) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return ciCode;
	}

	public int insertCustomItem(CustomItem customItem) {
		Connection conn = getConnection();
		int result = new CustomDao().insertCustomItem(conn, customItem);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	
	

}
