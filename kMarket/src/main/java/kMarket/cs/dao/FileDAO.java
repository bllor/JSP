package kMarket.cs.dao;


import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kMarket.cs.db.DBhelper;
import kMarket.cs.db.SQL;
import kMarket.cs.dto.FileDTO;


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
		
		logger.debug("filedto : "+filedto.toString());
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_FILE);
			psmt.setString(1, filedto.getOfile());
			psmt.setString(2, filedto.getSfile());
			psmt.setInt(3, filedto.getFno());
			psmt.executeUpdate();
			close();
			
		} catch (Exception e) {
			logger.error("updateFile : "+e.getMessage());
		}
		
	}
	public List<String> deleteFile(String ano ) {
		
		List<String> snames = new ArrayList<String>();
	
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_FILE_SNAMES);
			psmt.setString(1, ano);
			
			psmt1 = conn.prepareStatement(SQL.DELETE_FILE);
			psmt1.setString(1, ano);
			
			rs = psmt.executeQuery();
			psmt1.executeUpdate();
			
			while(rs.next()) {
				snames.add(rs.getString(1));
			}
		} catch (Exception e) {
			logger.error("deleteFile() : "+e.getMessage());
		}
		
		return snames;
	}
	
}
