package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.MemberDTO;

public class MemberDAO {

	//기본 CRUD
	public static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstence() {
		return instance;
	}
	private MemberDAO() {};
	
	
	//로거 생성
     private  Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertMember(MemberDTO dto) {
		
		try {
			logger.info("MemberDAO insertMember....1");
			Context initCtx = new InitialContext();
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			
			DataSource ds = (DataSource)ctx.lookup("jdbc/userdb");
			Connection conn = ds.getConnection();
			
			PreparedStatement psmt= conn.prepareStatement("INSERT INTO `member` VALUES (?,?,?,?,?,NOW())");
			psmt.setString(1, dto.getUid());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getHp());
			psmt.setString(4, dto.getPos());
			psmt.setString(5, dto.getDep());
			psmt.executeUpdate();
			
			
			psmt.close();
			conn.close();
			
			logger.info("MemberDAO insertMember....2");
			
		} catch (Exception e) {
			logger.error("Member InsertMember error : "+ e.getMessage());
		}
		
	}
	public MemberDTO selectMember(String uid) {
		MemberDTO member = new MemberDTO();
		
		try {
			Context ctx = (Context)new InitialContext().lookup("java:comp/env");
			DataSource ds = (DataSource)ctx.lookup("jdbc/userdb");
			Connection conn = ds.getConnection();
			PreparedStatement psmt = conn.prepareStatement("select * from `member` where `uid` =? ");
			psmt.setString(1, uid);
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				member.setUid(rs.getString(1));
				member.setName(rs.getString(2));
				member.setHp(rs.getString(3));
				member.setPos(rs.getString(4));
				member.setDep(rs.getString(5));
				member.setRdate(rs.getString(6));
			}
			
			rs.close();
			psmt.close();
			conn.close();
			
		} catch (Exception e) {
			logger.error("Member selectMember error :"+e.getMessage());
		}
		
		
		return member;
	}
	public List<MemberDTO> selectMembers() {
		
		List<MemberDTO> members = new ArrayList<>();
		
		try {
			logger.info("selectMembers______1");
			Context ctx = (Context)new InitialContext().lookup("java:comp/env");
			DataSource ds = (DataSource)ctx.lookup("jdbc/userdb");
			Connection conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from `member`");
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setHp(rs.getString(3));
				dto.setPos(rs.getString(4));
				dto.setDep(rs.getString(5));
				dto.setRdate(rs.getString(6));
				members.add(dto);
			}
			
			rs.close();
			stmt.close();
			conn.close();
			
		}catch(Exception e) {
			logger.error("Member selectMembers error :"+e.getMessage());
			
		}
		return members;
	}
	public void updateMember(MemberDTO dto) {
		
		try {
			logger.info("updateMember start");
			Context ctx = (Context)new InitialContext().lookup("java:comp/env");
			DataSource ds = (DataSource)ctx.lookup("jdbc/userdb");
			Connection conn = ds.getConnection();
			PreparedStatement psmt = conn.prepareStatement("UPDATE `member` set `name`=?, `hp`=?, `pos`=?, `dep`=?, `rdate`=NOW() WHERE `uid`=?");
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getHp());
			psmt.setString(3, dto.getPos());
			psmt.setString(4, dto.getDep());
			psmt.setString(5, dto.getUid());
			psmt.executeUpdate();
			logger.info("updateMember session__2");
			psmt.close();
			conn.close();
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	public void deleteMember(String uid) {
		
		try {
			logger.info("deleteMember start");
			Context ctx = (Context)new InitialContext().lookup("java:comp/env");
			DataSource ds = (DataSource)ctx.lookup("jdbc/userdb");
			Connection conn = ds.getConnection();
			PreparedStatement psmt = conn.prepareStatement("delete from `member` where uid=?");
			psmt.setString(1, uid);
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();
			
			
		}catch (Exception e) {
			logger.error("Member deleteMember error : "+e.getMessage());
		}
	
		
	}
}
