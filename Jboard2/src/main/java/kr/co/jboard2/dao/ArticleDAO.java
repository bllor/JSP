package kr.co.jboard2.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.db.DBHelper;
import kr.co.jboard2.db.SQL;
import kr.co.jboard2.dto.ArticleDTO;
import kr.co.jboard2.dto.FileDTO;

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
			
			
			if(rs.next()) {
				no= rs.getInt(1);
				//글의 번호를 no에 저장함
			}
			
			
			conn.commit();//트랜잭션 작업 확정
			
			close();
			
		}catch(Exception e){
			
			logger.info("insertArticle() : "+e.getMessage());
			
		}
		
		return no;
	}
	public ArticleDTO selectArticle(String no) {
		ArticleDTO article = new ArticleDTO();
		
		try {
			
			conn= getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ARTICLE);
			psmt.setString(1, no);
			rs= psmt.executeQuery();
			if(rs.next()) {
				article.setNo(rs.getInt("no"));
				article.setParent(rs.getInt("parent"));
				article.setComment(rs.getString("comment"));
				article.setCate(rs.getString("cate"));
				article.setTitle(rs.getString("title"));
				article.setContent(rs.getString("content"));
				article.setFile(rs.getInt("file"));
				article.setHit(rs.getInt("hit"));
				article.setWriter(rs.getString("writer"));
				article.setRegip(rs.getString("regip"));
				article.setRegDate(rs.getString("rdate"));
				
				//파일정보
				FileDTO fileDto = new FileDTO();
				fileDto.setFno(rs.getInt(12));
				fileDto.setAno(rs.getInt(13));
				fileDto.setOfile(rs.getString(14));
				fileDto.setSfile(rs.getString(15));
				fileDto.setDownload(rs.getInt(16));
				fileDto.setRdate(rs.getString(17));
				article.setFileDto(fileDto);
			}
			
			close();
			
		}catch (Exception e) {
			logger.info("selectArticle() : "+e.getMessage());
		}
		
		return article;
		
	}
	public List<ArticleDTO> selectArticles(int start,String search) {
		List<ArticleDTO> articles = new ArrayList<>();
		
		try {
			conn= getConnection();
			
			if(search==null) {
				psmt = conn.prepareStatement(SQL.SELECT_ARTICLES);
				psmt.setInt(1, start);
					
			}else {
				psmt = conn.prepareStatement(SQL.SELECT_ARTICLES_FOR_SEARCH);
				psmt.setString(1, "%"+search+"%");
				psmt.setInt(2, start);

			}
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
	public int insertComment(ArticleDTO dto) {
		
		int no = 0;
		
		try {
			conn = getConnection();
			conn.setAutoCommit(false);//트랜잭션 시작			
			stmt = conn.createStatement();
			//댓글입력
			psmt = conn.prepareStatement(SQL.INSERT_COMMENT);
			psmt.setInt(1, dto.getParent());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getWriter());
			psmt.setString(4, dto.getRegip());
			psmt.executeUpdate();
			//댓글번호 가져오기
			rs = stmt.executeQuery(SQL.SELECT_MAX_NO);
			conn.commit();//트랜잭션 작업 확정
			
			if(rs.next()) {
				no= rs.getInt(1);
				//글의 번호를 no에 저장함
			}
			close();	
		} catch (Exception e) {
			logger.error("insertComment() : "+e.getMessage());
		}
		
		return no;
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
	
	//댓글 삭제
	public int deleteComment(String no) {
		int result =0;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.DELETE_COMMENT);
			psmt.setString(1, no);
			result = psmt.executeUpdate();
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//글 수정
	public void updateArticle(ArticleDTO dto) {
		
		try {
			
			conn= getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_ARTICLE);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getNo());
			psmt.executeUpdate();
			close();
			
		} catch (Exception e) {
			logger.error("updateArticle : "+e.getMessage());
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
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int selectCountTotal(String search) {
		int total =0;
		
		
		try {
			
			conn = getConnection();
			
			if(search==null) {
				psmt = conn.prepareStatement(SQL.SELECT_COUNT_TOTAL);
			}else {
				psmt = conn.prepareStatement(SQL.SELECT_COUNT_TOTAL_FOR_SEARCH);
				psmt.setString(1, "%"+search+"%");
			}
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
