package kr.co.farmstory2.service;

import java.util.List;

import kr.co.farmstory2.dao.FileDAO;
import kr.co.farmstory2.dto.FileDTO;

public enum FileService {
	INSTANCE;
	
	FileDAO dao = new FileDAO();
	
	public void insertFile(FileDTO filedto) {
		dao.insertFile(filedto);
	}
	
	public FileDTO selectFile(String fno) {
		return dao.selectFile(fno);
	}
	
	public void updateFile(FileDTO filedto) {
		dao.updateFile(filedto);
	}
	
	public List<String> deleteFile(String ano){
		return dao.deleteFile(ano);
	}
}
