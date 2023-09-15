package kMarket.cs.db;

public class SQL {

	public static final String INSERT_ARTICLE= "INSERT INTO `km_csArticle` SET `cate`=?, "
																	+ "`writer`=?, "
																	+ "`title`=?, "
																	+ "`content`=?, "
																	+ "`regip`=?, "
																	+ "`file`=?, "
																	+ "`rdate`=NOW()";
	
	public final static String SELECT_MAX_NO = "SELECT MAX(`cNo`) From `km_csArticle`";
	
	
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
