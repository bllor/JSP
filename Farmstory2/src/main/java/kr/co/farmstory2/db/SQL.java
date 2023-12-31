package kr.co.farmstory2.db;

public class SQL {
	
	//Terms
	
	public static final String SELECT_TERMS       = "SELECT * FROM `Terms`";
	
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
	public static final String SELECT_COUNT_UID   = "SELECT COUNT(*) FROM `User` WHERE `uid`=?";
	public static final String SELECT_COUNT_NICK  = "SELECT COUNT(*) FROM `User` WHERE `nick`=?";
	public static final String SELECT_COUNT_EMAIL = "SELECT COUNT(*) FROM `User` WHERE `email`=?";
	public static final String SELECT_COUNT_HP    = "SELECT COUNT(*) FROM `User` WHERE `hp`=?";
	
	// Article
	public final static String INSERT_ARTICLE = "INSERT INTO `Article` SET "
												+ "`cate`=?, "
												+ "`title`=?, "
												+ "`content`=?,"
												+ "`file`=?,"
												+ "`writer`=?,"
												+ "`regip`=?,"
												+ "`rdate`=NOW()";
	
	public final static String INSERT_COMMENT = "INSERT INTO `Article` SET "
												+ "`parent`=?, "
												+ "`cate`=?,"
												+ "`content`=?,"
												+ "`writer`=?,"
												+ "`regip`=?,"
												+ "`rdate`=NOW()";
	
	public final static String SELECT_LATESTS = "SELECT `no`, `title`, `rdate` FROM `Article` "
												+ "WHERE `parent`=0 AND `cate`=? "
												+ "Order BY `no` DESC LIMIT ?";
	
	public final static String SELECT_ARTICLE = "SELECT * FROM `Article` AS a "
												+"LEFT JOIN `File` AS b ON a.no = b.ano "
												+"where no=? and parent = 0";
	public final static String SELECT_ARTICLES = "SELECT "
												+ "a.*, "
												+ "b.`nick` "
												+ "FROM `Article` AS a "
												+ "JOIN `User` AS b ON a.writer = b.uid "
												+ "WHERE `parent`=0 AND `cate`=? "
												+ "ORDER BY `no` DESC "
												+ "LIMIT ?, 10";
	
	public final static String SELECT_COMMENTS = "SELECT "
												+ "a.*, "
												+ "b.`nick` "
												+ "FROM `Article` AS a "
												+ "JOIN `User` AS b ON a.writer = b.uid "
												+ "WHERE `parent`=?";
	
	public final static String SELECT_COUNT_TOTAL = "SELECT COUNT(*) FROM `Article` WHERE `parent`=0 AND `cate`=?";
	
	
	
	public final static String UPDATE_ARTICLE = "UPDATE `Article` SET `title`=?, `content`=? , `file`=? WHERE `no`=?";
	public final static String UPDATE_ARTICLE_FOR_COMMENT_PLUS = "UPDATE `Article` SET `comment` = `comment` + 1 WHERE `no`=?";
	public final static String UPDATE_ARTICLE_FOR_COMMENT_MINUS = "UPDATE `Article` SET `comment` = `comment` - 1 WHERE `no`=?";
	public final static String UPDATE_COMMENT = "UPDATE `Article` SET `content`=? WHERE `no`=?";

	public final static String DELETE_ARTICLE = "DELETE FROM `Article` WHERE `no`=? OR `parent`=?";
	public final static String DELETE_COMMENT = "DELETE FROM `Article` WHERE `no`=?";
	public final static String SELECT_MAX_NO = "SELECT MAX(`no`) From `Article`";
	
	// Product
	public final static String INSERT_PRODUCT = "INSERT INTO `Product` SET "
												+ "`type`=?, "
												+ "`pName`=?, "
												+ "`price`=?, "
												+ "`delivery`=?, "
												+ "`stock`=?, "
												+ "`thumb1`=?, "
												+ "`thumb2`=?, "
												+ "`thumb3`=?, "
												+ "`seller`=?, "
												+ "`etc`=?, "
												+ "`rdate`=NOW()";
	
	public final static String SELECT_PRODUCTS_ALL = "SELECT * FROM `Product` WHERE `stock` > 0 order by pNo desc LIMIT ?, 10 ";
	public final static String SELECT_PRODUCTS_TYPE = "SELECT * FROM `Product` WHERE `stock` > 0 AND `type`=? order by pNo desc LIMIT ?, 10 ";
	public final static String SELECT_COUNT_PRODUCTS_ALL = "SELECT COUNT(*) FROM `Product` WHERE `stock` > 0";
	public final static String SELECT_COUNT_PRODUCTS_TYPE = "SELECT COUNT(*) FROM `Product` WHERE `stock` > 0 AND `type`=?";
	
	public final static String SELECT_PRODUCT="select *from `Product` where `pNo`=?";
	
	// Order
		public static final String INSERT_ORDER = "INSERT INTO `Order` SET "
												+ "`orderProduct`=?,"
												+ "`orderCount`=?,"
												+ "`orderDelivery`=?,"
												+ "`orderPrice`=?,"
												+ "`orderTotal`=?,"
												+ "`receiver`=?,"
												+ "`hp`=?,"
												+ "`zip`=?,"
												+ "`addr1`=?,"
												+ "`addr2`=?,"
												+ "`orderEtc`=?,"
												+ "`orderUser`=?,"
												+ "`orderDate`=NOW()";
		
		public static final String SELECT_ORDERS = "SELECT "
													+ "a.*,"
													+ "b.`pName`,"
													+ "b.`thumb1` "
													+ "FROM `Order` AS a "
													+ "JOIN `Product` AS b "
													+ "ON a.orderProduct = b.pNo "
													+ "LIMIT ?, 10";
		//product Name과 User의 이름까지 조회
		public static final String SELECT_ORDER= "SELECT a.*, b.pName ,c.name FROM `Order` AS a"
												+"JOIN `Product`AS b ON a.orderProduct = b.pNo"
												+"LEFT JOIN `User` AS c ON b.seller = c.uid"
												+"WHERE `orderNo`=?";
		public static final String SELECT_COUNT_ORDERS = "SELECT COUNT(*) FROM `Order`";
		public static final String DELETE_ORDER = "DELETE FROM `Order` WHERE `orderNo`=?";
	
	//File
	public static final String INSERT_FILE = "INSERT INTO `File` set "
											+"`ano`=? , "
											+"`ofile`=? , "
											+"`sfile`=? , "
											+"`rdate`=NOW() ";
	public static final String SELECT_FILE ="SELECT * FROM `File` where fno=?";
	
	public static final String SELECT_FILE_SNAMES="select `sfile` from `File` where `ano`=? ";
	
	public static final String UPDATE_FILE ="UPDATE `File` set " 
											+"ofile=?, "
											+"sfile=?, "
											+"rdate=NOW() "
											+"WHERE fno=? ";
	
	public static final String DELETE_FILE = "DELETE from `File` where ano =? ";
	
											
}