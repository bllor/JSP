package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import dto.User2DTO;

public enum User2DAO {
	
	INSTANCE;
	
	private final String HOST ="jdbc:mysql://13.209.15.113:3306/userdb";
	private final String USER ="userdb";
	private final String PASS ="1234qweR!";
	
	public void insertUser2(User2DTO dto) {
		try {
			
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(HOST,USER,PASS);
		PreparedStatement psmt = conn.prepareStatement("Insert INTO `user2` values (?,?,?,?)");
		psmt.setString(1, dto.getUid());
		psmt.setString(2, dto.getName());
		psmt.setString(3, dto.getHp());
		psmt.setInt(4, dto.getAge());
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
		
		} catch (Exception e) {
		e.printStackTrace();	
		}
	}
	public User2DTO selectUser2(String uid) {
		User2DTO dto = new User2DTO();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(HOST,USER,PASS);
			PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `user2` where uid=? ");
			psmt.setString(1, uid);
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setHp(rs.getString(3));
				dto.setAge(rs.getString(4));		
			}
			
			rs.close();
			psmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	public List<User2DTO> selectUser2s() {
		List<User2DTO> users = new ArrayList<>();
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(HOST,USER,PASS);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM `user2`");
			while(rs.next()) {
				User2DTO dto = new User2DTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setHp(rs.getString(3));
				dto.setAge(rs.getInt(4));
				users.add(dto);
			}
			
			rs.close();
			stmt.close();
			conn.close();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return users;
	}
	public void updateUser2(User2DTO dto) {
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(HOST,USER,PASS);
			PreparedStatement psmt = conn.prepareStatement("UPDATE `user2` set `name`=?, `hp`=?,`age`=? where `uid`=?");
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getHp());
			psmt.setInt(3, dto.getAge());
			psmt.setString(4, dto.getUid());
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteUser2(String uid) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(HOST,USER,PASS);
			PreparedStatement psmt = conn.prepareStatement("DELETE FROM `user2` where uid=?");
			psmt.setString(1, uid);
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
