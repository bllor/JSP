package kr.co.jboard2.dao;

import java.util.List;

import kr.co.jboard2.db.DBHelper;
import kr.co.jboard2.db.SQL;
import kr.co.jboard2.dto.ArticleDTO;

public class ArticleDAO extends DBHelper{

	public int insertArticle(ArticleDTO dto) {
		
		int no = 0;
		try{
			
			conn= getConnection();
			conn.setAutoCommit(false);//트랜잭션 시작

			stmt = conn.createStatement();
			psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getWriter());//(3, sessUser.getUid())로 해도됨
			psmt.setString(4, dto.getRegip());
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
			
			e.printStackTrace();
			
		}
		
		return no;
	}
	public ArticleDTO selectArticle(int no) {
		return null;
		
	}
	public List<ArticleDTO> selectArticles() {
		return null;
	}
	public void updateArticle() {}
	public void deleteArticle() {}
	

}
