package kr.co.jboard2.dao;

import java.util.ArrayList;
import java.util.List;

import kr.co.jboard2.db.DBHelper;
import kr.co.jboard2.db.SQL;
import kr.co.jboard2.dto.ArticleDTO;

public class ArticleDAO extends DBHelper{

	
	
///////////////////////////////////
///////////Article
//////////////////////////////////
	
	public void insertArticle(ArticleDTO dto) {
		
		try{
			
			conn= getConnection();
			
			psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
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
	
	public ArticleDTO selectArticle(String no) {
		
			ArticleDTO dto = new ArticleDTO();
		
		try {
			
			conn= getConnection();
			psmt = conn.prepareStatement(SQL.SELECTE_ARTICLE);
			psmt.setString(1, no);
			rs= psmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setParent(rs.getInt("parent"));
				dto.setComment(rs.getString("comment"));
				dto.setCate(rs.getString("cate"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setFile(rs.getInt("file"));
				dto.setHit(rs.getInt("hit"));
				dto.setWriter(rs.getString("writer"));
				dto.setRegip(rs.getString("regip"));
				dto.setRdate(rs.getString("rdate"));				
			}
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public List<ArticleDTO> selectArticles(int start){
		//리스트.jsp에 목록 띄우기
		
		List<ArticleDTO> articles = new ArrayList<>();
		
		
		
		try {
			
			conn= getConnection();
			psmt = conn.prepareStatement(SQL.SELETE_ARTICELS);
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

	
public void updateArticle(ArticleDTO dto) {
		
		
		try {
			
			conn= getConnection();
			psmt= conn.prepareStatement(SQL.UPDATE_ARTICLE);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getRegip());
			psmt.setInt(4, dto.getNo());
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	}
	
	public void deleteArticle(String no) {
		
		try {
			
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.DELETE_ARTICLE);
			psmt.setString(1, no);
			psmt.setString(2, no);
			psmt.executeUpdate();
			close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
///////////////////////////////////
///////////comment
//////////////////////////////////
	public int selectCountTotal() {
		int total =0;
		
		
		try {
			
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECTE_COUNT_TOTAL);
			rs = psmt.executeQuery();
			if(rs.next()) {
				total=rs.getInt(1);
			}
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return total;
	}
	
	public List<ArticleDTO> selectComments(String parent) {
		
		List<ArticleDTO> comments = new ArrayList<>();
		
		try {
			
			conn= getConnection();
			psmt = conn.prepareStatement(SQL.SELECTE_COMMENTS);
			psmt.setString(1, parent);
			
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
				
				comments.add(dto);
			}
			
			close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return comments;
	}
	
	
	
	//추가
	
	
	public void insertComment(ArticleDTO dto) {
		
		
		
		try {
			
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_COMMENT);
			psmt.setInt(1, dto.getParent());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getWriter());
			psmt.setString(4, dto.getRegip());
			psmt.executeUpdate();
			
			close();	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateArticleForCommentPlus(String no) {
			
		try {
			
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_ARTICLE_FOR_COMMENT_PLUS);
			psmt.setString(1, no);
			psmt.executeUpdate();
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateArticleForCommentMinus(String no) {
		
		try {
			
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_ARTICLE_FOR_COMMENT_MINUS);
			psmt.setString(1, no);
			psmt.executeUpdate();
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void deleteComment(String no) {
		
		try {
			
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.DELETE_COMMENT);
			psmt.setString(1, no);
			psmt.executeUpdate();
			close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
public void updateComment(ArticleDTO dto) {
		
		
		try {
			
			conn= getConnection();
			psmt= conn.prepareStatement(SQL.UPDATE_CONTENT);
			psmt.setString(1, dto.getContent());
			psmt.setInt(2, dto.getNo());
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	}
	
	
	
	
	
}
