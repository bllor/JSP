package kMarket.cs.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kMarket.cs.db.DBhelper;
import kMarket.cs.db.SQL;
import kMarket.cs.dto.CsArticleDTO;

public class CsArticleDAO extends DBhelper {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int insertArticle(CsArticleDTO dto) {
		int no = 0;
		try {
			
			conn = getConnection();
			conn.setAutoCommit(false);
			
			stmt = conn.createStatement();
			psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
			psmt.setString(1, dto.getCate());
			psmt.setString(2, dto.getWriter());
			psmt.setString(3, dto.getTitle());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getRegip());
			psmt.setString(6, dto.getFile());
			psmt.executeUpdate();
		
			rs= stmt.executeQuery(SQL.SELECT_MAX_NO);
			
			if(rs.next()) {
				no =rs.getInt(1);
			}
			
			conn.commit();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return no;
	}
	
		public void selectArticle() {
				
			}
		
		public void selectArticles() {
			
		}
		
		public void updateArticle() {
			
		}
		
		public void deleteArticle() {
			
		}
		

	
}
