package kr.co.jboard2.service;

import java.util.List;

import kr.co.jboard2.dao.ArticleDAO;
import kr.co.jboard2.dto.ArticleDTO;

public enum ArticleService {

	INSTANCE;
	
	private ArticleDAO dao = new ArticleDAO();
	
	
	public int insertArticle(ArticleDTO dto) {
		 return dao.insertArticle(dto);
	}

	public ArticleDTO selectArticle(int no) {
		return dao.selectArticle(no);
		
	}
	public List<ArticleDTO> selectArticles() {
		return dao.selectArticles();
	}
	public void updateArticle() {
		dao.updateArticle();
	}
	public void deleteArticle() {
		dao.deleteArticle();
	}
	
	//업로드 경로 구하기
	public void getuploadPath() {
		
	}
	
	//파일 업로드
	public void uploadfile() {}
	
	//파일 다운로드
	public void downloadfile() {
		
	}
	
	
}
