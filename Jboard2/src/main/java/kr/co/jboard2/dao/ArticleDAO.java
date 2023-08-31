package kr.co.jboard2.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.db.DBHelper;
import kr.co.jboard2.db.SQL;
import kr.co.jboard2.dto.ArticleDTO;

public class ArticleDAO extends DBHelper{

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int insertArticle(ArticleDTO dto) {
		
		int no = 0;
		try{
			
			conn= getConnection();
			conn.setAutoCommit(false);//트랜잭션 시작

			stmt = conn.createStatement();
			psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getFile());
			psmt.setString(4, dto.getWriter());//(3, sessUser.getUid())로 해도됨
			psmt.setString(5, dto.getRegip());
			psmt.executeUpdate();//insert end
			//글쓰기 끝
			rs = stmt.executeQuery(SQL.SELECT_MAX_NO);
			//글쓰기가 완료된 후 글의 번호를 받아오는 작업
			
			conn.commit();//트랜잭션 작업 확정
			
			if(rs.next()) {
				no= rs.getInt(1);
				//글의 번호를 no에 저장함
			}
			
			close();
			
		}catch(Exception e){
			
			logger.info("insertArticle() : "+e.getMessage());
			
		}
		
		return no;
	}
	public ArticleDTO selectArticle(String no) {
		ArticleDTO dto = new ArticleDTO();
		
		try {
			
			conn= getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ARTICLE_AND_FILE);
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
				dto.setRegDate(rs.getString("rdate"));	
				dto.setOfile(rs.getString("ofile"));
			}
			
			close();
			
		}catch (Exception e) {
			logger.info("selectArticle() : "+e.getMessage());
		}
		
		return dto;
		
	}
	public List<ArticleDTO> selectArticles(int start) {
		List<ArticleDTO> articles = new ArrayList<>();
		
		try {
			conn= getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ARTICLES);
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
				dto.setRegDate(rs.getString(11));
				dto.setNick(rs.getString(12));
				articles.add(dto);
			}
			
			close();
			
		} catch (Exception e) {
			logger.info("selectArticles() : "+e.getMessage());
		}
		
		return articles;
	}
	
	//댓글조회
	
public List<ArticleDTO> selectComments(String parent) {
		
		List<ArticleDTO> comments = new ArrayList<>();
		
		try {
			
			conn= getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_COMMENTS);
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
				dto.setRegDate(rs.getString(11));
				dto.setNick(rs.getString(12));
				
				comments.add(dto);
			}
			
			close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return comments;
	}
	
	//댓글입력
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

	
	//댓글 수 추가
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
	
	public void updateArticle() {}
	public void deleteArticle() {}
	
	public int selectCountTotal() {
		int total =0;
		
		
		try {
			
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_COUNT_TOTAL);
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
	
}
