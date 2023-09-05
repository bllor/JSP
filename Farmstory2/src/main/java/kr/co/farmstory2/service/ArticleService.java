package kr.co.farmstory2.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.farmstory2.dao.ArticleDAO;
import kr.co.farmstory2.dto.ArticleDTO;

public class ArticleService {

	private static ArticleService instance = new ArticleService();
	public static ArticleService getInstance() {
		return instance;
	}
	private ArticleService() {}
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private ArticleDAO dao = ArticleDAO.getInstance();
	
	public void insertArticle(ArticleDTO dto) {
		dao.insertArticle(dto);
	}
	
	public void selectArticle() {
		
	}
	
	public void selectArticles() {
		
	}
	
	public void updateArticle() {
		
	}
	
	public void deleteArticle() {
		
		
	}
	//업로드 경로 구하기
	public String getFilePath(HttpServletRequest req) {
		//파일 업로드 경로 구하기
		ServletContext ctx = req.getServletContext();
		String path = ctx.getRealPath("/thumb");
		return path;
	}
	
	//파일 업로드
	public MultipartRequest uploadfile(HttpServletRequest req) {
		//파일 경로 구하기
		String path = getFilePath(req);
		//최대 업로드 파일 크기
		int maxSize = 1024*1024*10;
		//파일 업로드 Multipart 객체 생성
		MultipartRequest mr = null;
		
		try {
			mr = new MultipartRequest(req, path,maxSize,"UTF-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {
			logger.info("uploadFile : "+e.getMessage());
		}
		
		return mr;
	}
	
	//파일명 수정
	public String renameTOFile(HttpServletRequest req, String oName) {
		String path = getFilePath(req);
		int i = oName.lastIndexOf(".");
		String ext = oName.substring(i);
		
		String uuid = UUID.randomUUID().toString();
		String sName = uuid+ext;
		
		File f1 = new File(path+"/"+oName);
		File f2 = new File(path+"/"+sName);
		
		//파일명 수정
		f1.renameTo(f2);
		
		return sName;
	}
	
}
