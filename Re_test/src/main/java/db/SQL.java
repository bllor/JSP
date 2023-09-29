package db;

public class SQL {
	// User
	public static final String INSERT_USER = "INSERT INTO `User` SET "
											+ "`uid`=?,"
											+ "`pass`=SHA2(?, 256),"
											+ "`name`=?,"											
											+ "`nick`=?,"
											+ "`email`=?,"
											+ "`hp`=?,"
											+ "`zip`=?,"
											+ "`addr1`=?,"
											+ "`addr2`=?,"
											+ "`regip`=?,"
											+ "`regDate`=NOW()";
	
	public static final String SELECT_USER        = "SELECT * FROM `User` WHERE `uid`=? AND `pass`=SHA2(?, 256)";
	public static final String SELECT_USER_BY_NAME_AND_EMAIL = "SELECT * FROM `User` WHERE `name`=? AND `email`=?";
	public static final String SELECT_COUNT_UID   = "SELECT COUNT(*) FROM `User` WHERE `uid`=?";
	public static final String SELECT_COUNT_NICK  = "SELECT COUNT(*) FROM `User` WHERE `nick`=?";
	public static final String SELECT_COUNT_EMAIL = "SELECT COUNT(*) FROM `User` WHERE `email`=?";
	public static final String SELECT_COUNT_NAME_EMAIL = "SELECT COUNT(*) FROM `User` WHERE `name`=? AND `email`=?";
	public static final String SELECT_COUNT_UID_EMAIL = "SELECT COUNT(*) FROM `User` WHERE `uid`=? AND `email`=?";
	public static final String SELECT_COUNT_HP    = "SELECT COUNT(*) FROM `User` WHERE `hp`=?";
	public static final String SELECT_TERMS       = "SELECT * FROM `Terms`";
	
	
	public static final String UPDATE_USER = "UPDATE `User` SET "
												+ "`name`=?,"
												+ "`nick`=?,"
												+ "`email`=?,"
												+ "`hp`=?,"
												+ "`zip`=?,"
												+ "`addr1`=?,"
												+ "`addr2`=? "
												+ " WHERE `uid`=?";
	
	public static final String UPDATE_USER_PASS   = "UPDATE `User` SET `pass`=SHA2(?, 256) WHERE `uid`=?";
	public static final String UPDATE_USER_FOR_WITHDRAW = "UPDATE `User` SET "
															+ "`pass`=null,"
															+ "`name`=null,"
															+ "`nick`=null,"
															+ "`email`=null,"
															+ "`hp`=null,"
															+ "`role`=null,"
															+ "`zip`=null,"
															+ "`addr1`=null,"
															+ "`addr2`=null,"
															+ "`leaveDate`=NOW() "
															+ " WHERE `uid`=?";

	
	
	
	// Article
	public final static String INSERT_ARTICLE = "INSERT INTO `Article` SET "
												+ "`title`=?, "
												+ "`content`=?, "
												+ "`file`=?, "
												+ "`writer`=?, "
												+ "`regip`=?, "
												+ "`rdate`=NOW()";
	
	public final static String INSERT_COMMENT = "INSERT INTO `Article` SET "
												+ "`parent`=?, "
												+ "`content`=?,"
												+ "`writer`=?,"
												+ "`regip`=?,"
												+ "`rdate`=NOW()";
	
	public final static String SELECT_MAX_NO = "SELECT MAX(`no`) FROM `Article`";
	
	public final static String SELECT_ARTICLE = "SELECT * FROM `Article` AS a "
														+ "LEFT JOIN `File` AS b ON a.no = b.ano "
														+"where no=? and `parent`=0";
	//LEFT조인을 함으로써 Article 테이블의 정보는 다 가져오고, File테이블에서는 join에 해당하는 데이터만 가져온다.
	//어제는 LEFT조인을 생각하지 못해서 데이터를 가져오지 못했다
	
	public final static String SELECT_ARTICLES = "SELECT "
												+ "a.*, "
												+ "b.`nick` "
												+ "FROM `Article` AS a "
												+ "JOIN `User` AS b ON a.writer = b.uid "
												+ "WHERE `parent`=0 "
												+ "ORDER BY `no` DESC "
												+ "LIMIT ?, 10";

	public final static String SELECT_ARTICLES_FOR_SEARCH = "SELECT "
															+ "a.*, "
															+ "b.`nick` "
															+ "FROM `Article` AS a "
															+ "JOIN `User` AS b ON a.writer = b.uid "
															+ "WHERE `parent`=0 and `title` LIKE ? "
															+ "ORDER BY `no` DESC "
															+ "LIMIT ?, 10";

	
	public final static String SELECT_COMMENTS = "SELECT "
												+ "a.*, "
												+ "b.`nick` "
												+ "FROM `Article` AS a "
												+ "JOIN `User` AS b ON a.writer = b.uid "
												+ "WHERE `parent`=?";
	
	public final static String SELECT_COUNT_TOTAL = "SELECT COUNT(*) FROM `Article` WHERE `parent`=0";
	public final static String SELECT_COUNT_TOTAL_FOR_SEARCH = "SELECT COUNT(*) FROM `Article` WHERE `parent`=0 AND `title`LIKE ?";
	
	
	
	public final static String UPDATE_ARTICLE = "UPDATE `Article` SET `title`=?, `content`=? WHERE `no`=?";
	public final static String UPDATE_ARTICLE_FOR_COMMENT_PLUS = "UPDATE `Article` SET `comment` = `comment` + 1 WHERE `no`=?";
	public final static String UPDATE_ARTICLE_FOR_COMMENT_MINUS = "UPDATE `Article` SET `comment` = `comment` - 1 WHERE `no`=?";
	public final static String UPDATE_COMMENT = "UPDATE `Article` SET `content`=? WHERE `no`=?";

	public final static String DELETE_ARTICLE = "DELETE FROM `Article` WHERE `no`=? OR `parent`=?";
	public final static String DELETE_COMMENT = "DELETE FROM `Article` WHERE `no`=?";
	
	
	//File
	public final static String INSERT_FILE ="INSERT INTO `File` set "
											+"`ano`=?, "
											+"`ofile`=?, "
											+"`sfile`=?, "
											+"`rdate`=NOW()";
	
	
	public final static String SELECT_FILE ="select * from `File` where `fno`=?";
	
	public final static String SELECT_FILE_SNAMES ="SELECT `sfile` from `File` where `ano`=? ";
	
	public final static String DELETE_FILE="delete  from `File` where ano=?";
	//fno로 하면 같은 글에 대해서 파일이 여러개 일 때 여러 개 모두를 삭제할 수 없음
	//글번호로 하게 되면 글을 지울 때 여러 개의 파일 모두를 삭제할 수 있으므로, ano로 한다.
	
	
	
	
	
	
	
	
	
	
	
	
			
	
	
}