package kr.co.jboard1.dao;

import java.util.ArrayList;
import java.util.List;

import kr.co.jboard1.db.DBHelper;
import kr.co.jboard1.db.sql;
import kr.co.jboard1.dto.ArticleDTO;

public class ArticleDAO extends DBHelper{

	public void insertArticle(ArticleDTO dto) {
		
		try{
			
			conn= getConnection();
			
			psmt = conn.prepareStatement(sql.INSERT_ARTICLE);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getWriter());//(3, sessUser.getUid())로 해도됨
			psmt.setString(4, dto.getRegip());
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
	}
	
	public ArticleDTO selectArticle(int no) {
		return null;
	}
	
	public List<ArticleDTO> selectArticles(int start){
		//리스트.jsp에 목록 띄우기
		
		List<ArticleDTO> articles = new ArrayList<>();
		
		
		
		try {
			
			conn= getConnection();
			psmt = conn.prepareStatement(sql.SELETE_ARTICELS);
			psmt.setInt(1, start);
			rs= psmt.executeQuery();
			while(rs.next()) {
				ArticleDTO dto = new ArticleDTO();
				dto.setNo(rs.getInt(1));
				dto.setParent(rs.getInt(2));
				dto.setComment(rs.getString(3));
				dto.setCate(rs.getString(4));
				dto.setTitle(rs.getString(5));
				dto.setContent(rs.getString(6));
				dto.setFile(rs.getInt(7));
				dto.setHit(rs.getInt(8));
				dto.setWriter(rs.getString(9));
				dto.setRegip(rs.getString(10));
				dto.setRdate(rs.getString(11));
				dto.setNick(rs.getString(12));
				articles.add(dto);
				
			}
			
			
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return articles;
		
	}
	
	public int selectCountTotal() {
		int total =0;
		
		
		try {
			
			conn = getConnection();
			psmt = conn.prepareStatement(sql.SELECTE_COUNT_TOTAL);
			rs = psmt.executeQuery();
			if(rs.next()) {
				total=rs.getInt(1);
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return total;
	}
	
	public void updateArticle(ArticleDTO vo) {
		
	}
	
	public void deleteArticle(int no) {
		
	}
	
}