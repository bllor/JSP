package kr.co.farmstory2.dao;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.db.DBhelper;
import kr.co.farmstory2.db.SQL;
import kr.co.farmstory2.dto.FileDTO;

public class FileDAO extends DBhelper {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertFile(FileDTO dto) {
		try {
			conn = getConnection();
			psmt= conn.prepareStatement(SQL.INSERT_FILE);
			psmt.setInt(1, dto.getAno());
			psmt.setString(2, dto.getOfile());
			psmt.setString(3, dto.getSfile());
			psmt.executeUpdate();
			close();
			
			
		} catch (Exception e) {
			logger.error("insertFile : "+e.getMessage());
		}
		
	}
	
	
	public void selectFile() {}
	public void selectFiles() {}
	public void updateFile() {}
	public void deleteFile() {}
	
}
