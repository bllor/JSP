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
											+ " where `uid`=? and "
											+ " `pass`=SHA2(?,256)";
	
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
	
	public static final String SELETE_ARTICELS ="SELECT a.*, b.`nick` from `article` as a "
												+ " join user as b on a.writer = b. uid "
												+" where parent ='0'"
												+ " order by `no` desc "
												+" Limit ?, 10";
	
	//parent 0이라는 말은 원글이라는 말-> 댓글은 parent에 no가 들어가므로
	// limit ?,10을하므로써 ?부터10개를 view에 가지고 올 수 있다.
	
	
	
	public static final String SELECTE_COUNT_TOTAL="SELECT COUNT(*)FROM `ARTICLE` where `parent`=0" ;
	//최신 글이 상단에 출력하기 위해서 order by를 추가하고,
	//아이디를 닉네임으로 바꾸기 위해서 user를 조인하여 아이디를 가져온다.
	
	public static final String SELECTE_ARTICLE ="SELECT* FROM `article` WHERE NO=?";

	
	public static final String INSERT_COMMENT= "insert into `article` set "//"INSERT INTO `article` set "
												+" `parent`=?, "//어떤 글의 댓글인지 알기 위해서 사용. 글번호를 parent에 넣음으로써 확인함.
												+" `content`=?,"
												+" `writer`=?,"
												+" `regip`=?,"
												+" `rdate`=NOW()";
	
	
	public static final String UPDATE_ARTICLE_FOR_COMMENT="UPDATE `Article` set `comment`=`comment`+1 where `no`=?";
	
	public static final String SELECTE_COMMENTS ="SELECT a.*, b.`nick` from `article` as a "
												+ "join user as b on a.writer = b. uid "
												+ "where `parent`=?";
	
	
}
