package kr.co.farmstory2.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.farmstory2.dao.ArticleDAO;
import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.dto.FileDTO;

public class ArticleService {

	private static ArticleService instance = new ArticleService();
	public static ArticleService getInstance() {
		return instance;
	}
	private ArticleService() {}
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private ArticleDAO dao = ArticleDAO.getInstance();
	
	public int insertArticle(ArticleDTO dto) {
		return dao.insertArticle(dto);
	}
	
	public ArticleDTO selectArticle(String no) {
		return dao.selectArticle(no);
	}
	
	public List<ArticleDTO> selectArticles(String cate, int start) {
		return dao.selectArticles(cate, start);
	}
	
	public void updateArticle(ArticleDTO dto) {
		 dao.updateArticle(dto);
	}
	
	public void deleteArticle(String no) {
		dao.deleteArticle(no);
		
	}
	//업로드 경로 구하기
	public String getFilePath(HttpServletRequest req) {
		//파일 업로드 경로 구하기
		ServletContext ctx = req.getServletContext();
		String path = ctx.getRealPath("/upload");
		return path;
	}
	
	//파일 업로드
	public MultipartRequest uploadfile(HttpServletRequest req) {
		//파일 경로 구하기
		String path = ProductService.INSTANCE.getFilePath(req);
		//최대 업로드 파일 크기
		int maxSize = 1024*1024*10;
		//파일 업로드 Multipart 객체 생성
		MultipartRequest mr = null;
		
		try {
			mr = new MultipartRequest(req,path,maxSize,"UTF-8", new DefaultFileRenamePolicy());
			
		
		} catch (IOException e) {
			logger.error("uploadFile : "+e.getMessage());
		}
		logger.debug("uploadfile : "+ mr.toString());
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
		logger.debug("f1 : "+f1);
		File f2 = new File(path+"/"+sName);
		logger.debug("f2 : "+f2);

		
		//파일명 수정
		f1.renameTo(f2);
		logger.debug("mof1 : "+f1);
		logger.debug("mof2 : "+f2);
		return sName;
		
	}
	
	
	//파일 다운로드
	public void downloadfile(HttpServletRequest req,HttpServletResponse resp,FileDTO dto) throws IOException {
		
		// response 파일 다운로드 헤더 수정
		resp.setContentType("application/octet-stream");
		resp.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode(dto.getOfile(),"utf-8"));
		resp.setHeader("Content-Transfer-Encoding", "binary");
		resp.setHeader("Pragma", "no-cache");
		resp.setHeader("Cache-Control", "private");
		
		//response 파일 스트림 작업
		String path = getFilePath(req);
		
		//파일명
		File file = new File(path+"/"+dto.getSfile());
		
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
		BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream());
		
		while(true) {
			
			int data = bis.read();
			if(data==1) {
				break;
			}
			
			bos.write(data);
		}
		
		bis.close();
		bos.close();
	}
	
	//페이지 시작 번호
	public int getPageStartNum(int total, int currentPage) {
		int start = (currentPage -1)*10;
		return total - start;
		
	}
	
	//현재 페이지 번호
	public int getCurrentPage(String pg) {
		int currentPage =1;
		
		if(pg != null) {
			currentPage = Integer.parseInt(pg);
		}
		
		return currentPage;
	}
	
	//페이지 마지막 번호
	public int getLastPageNum(int total) {
		int lastPageNum = 0;
		
		if(total % 10==0) {
			lastPageNum = total/10;
		}else {
			lastPageNum = total/10+1;
		}
		return lastPageNum;
	}
	
	//Limit 시작번호
	public int getStartNum(int currentPage) {
		return (currentPage-1)*10;
	}
	
	//전체 게시물 조회
	public int selectCountTotal(String cate) {
		return dao.selectCountTotal(cate);
	}
	
	//페이지 그룹
	public int[]getPageGroupNum(int currentPage, int lastPageNum){
		
		int currentPageGroup = (int)Math.ceil(currentPage/10.0);
		int pageGroupStart = (currentPageGroup -1)*10+1;
		int pageGroupEnd = currentPageGroup * 10;
		
		if(pageGroupEnd > lastPageNum) {
			pageGroupEnd = lastPageNum;
		}
		int[] result = {pageGroupStart,pageGroupEnd};
		return result;
		
	}
	//댓글 삽입
	public int insertComment(ArticleDTO dto) {
		return dao.insertComment(dto);
	}
	
	//댓글 조회
	public List<ArticleDTO> selectComments(String no) {
		return dao.selectComments(no);
	}
	
	
	//댓글 삭제
	public int deleteComment(String no) {
		return dao.deleteComment(no);
	}
	
	//댓글 업데이트
	public int updateComment(String no , String content) {
		 return dao.updateComment(no, content);
	}
	
}
