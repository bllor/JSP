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
	
	
	public FileDTO selectFile(String fno) {
		FileDTO dto = null;
		try {
			
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_FILE);
			psmt.setString(1, fno);
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				dto= new FileDTO();
				dto.setFno(rs.getInt(1));
				dto.setAno(rs.getInt(2));
				dto.setOfile(rs.getString(3));
				dto.setSfile(rs.getString(4));
				dto.setDownload(rs.getInt(5));
				dto.setRdate(rs.getString(6));
			}
			
			close();
		} catch (Exception e) {
			logger.error("selectFile : "+e.getMessage());
		}
		return dto;
	}
	public void selectFiles() {}
	
	
	public void updateFile(FileDTO filedto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_FILE);
			psmt.setString(1, filedto.getOfile());
			psmt.setString(2, filedto.getSfile());
			psmt.setInt(3, filedto.getAno());
			psmt.executeUpdate();
			close();
			
		} catch (Exception e) {
			logger.error("updateFile : "+e.getMessage());
		}
		
	}
	public void deleteFile() {}
	
}
