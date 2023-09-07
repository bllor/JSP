package kr.co.farmstory2.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.farmstory2.dao.ProductDAO;
import kr.co.farmstory2.dto.ProductDTO;

public enum ProductService {

	 INSTANCE;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	ProductDAO dao = ProductDAO.getInstance();
	
	//업로드 경로 구하기
	public String getFilePath(HttpServletRequest req) {
		ServletContext ctx = req.getServletContext();
		String path = ctx.getRealPath("/thumb");
		return path;
	}
	
	
	//파일 업로드
	public MultipartRequest uploadfile(HttpServletRequest req) {
		//파일 경로 구하기
		String path = getFilePath(req);
		//최대 업로드 파일 크기
		int maxSize= 1024*1024*10;
		//파일 업로드 multipart 객체 생성
		MultipartRequest mr = null;
		
		try {
			mr = new MultipartRequest(req, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			logger.error("uploadfile : "+e.getMessage());
		}
		
		return mr;
	}
	
	//파일명 수정
	public String renameToFile (HttpServletRequest req, String oName) {
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
	
	//제품 등록
	public void insertProduct(ProductDTO dto) {
		dao.insertProduct(dto);
	}
	
	//제품목록
	public List<ProductDTO>selectProducts(String type,int start){
		return dao.selectProducts(type, start);
	}
	
	//제품 시작번호
	public int selectCountProductsTotal(String type) {
		return dao.selectCountProductsTotal(type);
	}
	
}
