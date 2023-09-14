package kMarket.cs.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kMarket.cs.dao.CsArticleDAO;
import kMarket.cs.dto.CsArticleDTO;
import kMarket.cs.dto.FileDTO;

public enum CsArticleService {

	INSTANCE;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	CsArticleDAO dao = new CsArticleDAO();
	
	public int insertArticle(CsArticleDTO dto ) {
		return dao.insertArticle(dto);
		}
	
	
	
	public void selectArticle() {
			
		}
	
	public void selectArticles() {
		
	}
	
	public void updateArticle() {
		
	}
	
	public void deleteArticle() {
		
	}
	
	//파일 업로드 경로
	public String getPath(HttpServletRequest req, String dir) {
		ServletContext ctx = req.getServletContext();
		String path = ctx.getRealPath("/upload");
		return path;
	}
	
	//파일업로드
	public MultipartRequest uploadfile(HttpServletRequest req, String path) {
		int maxSize = 1024*1024*10;
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req, path,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		} catch (Exception e) {
			logger.error("uploadfile : "+e.getMessage());
		}
		return mr;
	}
	
	
	//파일명 수정
	public String renameToFile(HttpServletRequest req,String oName, String path) {
		int i = oName.lastIndexOf(".");
		String ext = oName.substring(i);
		
		String uuid = UUID.randomUUID().toString();
		String sName = uuid+ext;
		
		File f1 = new File(path+"/"+oName);
		File f2 = new File(path+"/"+sName);
		
		f1.renameTo(f2);
		return sName;
	}
	
	
	//파일 다운로드
	public void downloadfile(HttpServletRequest req,HttpServletResponse resp,FileDTO dto,String path) throws IOException {
		
		resp.setContentType("application/octet-stream");
		resp.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode(dto.getOfile(),"utf-8"));
		resp.setHeader("Content-Transfer-Encoding", "binary");
		resp.setHeader("Pragma", "no-cache");
		resp.setHeader("Cache-Control", "private");
		
		File file = new File(path+"/"+dto.getSfile());
		
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
		BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream());
				
		while(true){
			
			int data = bis.read();
			if(data == -1){
				break;
			}
			
			bos.write(data);
		}
		
		bos.close();
		bis.close();
	}
	
}
