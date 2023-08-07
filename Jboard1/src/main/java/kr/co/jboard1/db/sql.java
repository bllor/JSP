package kr.co.jboard1.db;

public class sql {

	
	//user
	
	public static final String INSERT_USER="insert into `user` set "
											+"uid=?, "
											+"pass=SHA2(?,256), "
											+"name=?,"
											+"nick=?, "
											+"email=?, "
											+"hp=?, "
											+"zip=?, "
											+"addr1=?, "
											+"addr2=?, "
											+"regip=?, "
											+"regdate=NOW()";
	//pass=SHA(비밀번호,256);
	//비밀번호를 가릴 때 사용하는 것으로 비밀번호에 1234를 넣으면 256자리의 다른 글자로 만들어주어서 보안성을 높여준다.
			
	public static final String SELECT_USER="select * from `user` "
											+ "where `uid`=? and "
											+ "`pass`=SHA2(?,256)";
	
	public static final String SELECT_COUNT_UID ="select count(*) from `user` where `uid`=?";
	
	public static final String SELECT_COUNT_NICK="select count(*) from `user` where `nick`=?";
	public static final String SELECT_COUNT_EMAIL="select count(*) from `user` where `email`=?";
	public static final String SELECT_COUNT_HP="select count(*)from `user` where `hp`=?";
	
	public static final String INSERT_ARTICLE= "insert into `article` set "//"INSERT INTO `article` set "
												+" `title`=?,"
												+" `content`=?,"
												+" `writer`=?,"
												+" `regip`=?,"
												+" `rdate`=NOW()";
	
	public static final String SELETE_ARTICELS ="SELECT * FROM `ARTICLE`";

}
