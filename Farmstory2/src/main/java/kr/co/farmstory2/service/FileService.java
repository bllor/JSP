package kr.co.farmstory2.service;

import kr.co.farmstory2.dao.FileDAO;
import kr.co.farmstory2.dto.FileDTO;

public enum FileService {
	INSTANCE;
	
	FileDAO dao = new FileDAO();
	
	public void insertFile(FileDTO filedto) {
		dao.insertFile(filedto);
	}
}
