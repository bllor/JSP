package kr.Farmstory1.db;

public class sql {

	
	public static final String SELETE_TERMS="select * from `terms`";
	
	//user
	public static final String INSERT_USER="insert into `User` set "
											+"uid=?, "
											+"pass=SHA2(?,256), "
											+"name=?, "
											+"nick=?, "
											+"email=?, "
											+"hp=?, "
											+"zip=?, "
											+"addr1=?, "
											+"addr2=?, "
											+"regip=?, "
											+"rdate=NOW()";
	
	public static final String SELETE_USER="select * from `USER` "
											+"where uid =? and "
											+"pass=SHA2(?,256)";
	
	
}
