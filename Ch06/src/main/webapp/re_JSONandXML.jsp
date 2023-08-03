<%-- <%@page import="org.jdom2.output.Format"%> --%>
<%-- <%@page import="org.jdom2.output.XMLOutputter"%> --%>
<%-- <%@page import="org.jdom2.Element"%> --%>
<%-- <%@page import="org.jdom2.Document"%> --%>
<%-- <%@page import="vo.User1VO"%> --%>
<%-- <%@page import="com.google.gson.Gson"%> --%>
<%-- <%@page import="java.sql.ResultSet"%> --%>
<%-- <%@page import="java.sql.Statement"%> --%>
<%-- <%@page import="java.sql.Connection"%> --%>
<%-- <%@page import="javax.sql.DataSource"%> --%>
<%-- <%@page import="javax.naming.InitialContext"%> --%>
<%-- <%@page import="javax.naming.Context"%> --%>
<%-- <%@page import="java.util.ArrayList"%> --%>
<%-- <%@page import="vo.User2VO"%> --%>
<%-- <%@page import="java.util.List"%> --%>
<%-- <%@ page contentType="apllication/Json;charset=UTF-8" pageEncoding="UTF-8"%> --%>

<%-- <% --%>
<%--
// 	//json
// 	String data = "{\"uid\":\"a101\",\"name\":\"홍길동\",\"age\":\"나이\",\"주소\":\"부산\"}";
// 	out.print(data);
	
// 	//gson
	
// 	List<User2VO> users = new ArrayList<>();
// 	try{
// 	Context initctx = new InitialContext();
// 	Context ctx = (Context) initctx.lookup("java:comp/env");
// 	DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
// 	Connection conn = ds.getConnection();
// 	Statement stmt = conn.createStatement();
// 	ResultSet rs = stmt.executeQuery("select * from `user2`");
	
// 	while(rs.next()){
// 		User2VO vo = new User2VO();
// 		vo.setUid(rs.getString(1));
// 		vo.setName(rs.getString(2));
// 		vo.setAge(rs.getString(3));
// 		vo.setHp(rs.getString(4));
		
// 		users.add(vo);
// 	}
// 	rs.close();
// 	stmt.close();
// 	conn.close();
	
// 	} catch( Exception e){
// 		e.printStackTrace();
		
// 	}
	
// 	Gson gson = new Gson();
// 	String jsonData = gson.toJson(users);
// 	out.print(jsonData);
	
	
// 	//XML
	
// //	@ page contentType="type:xml;charset=UTF-8" pageEncoding="UTF-8"
	
// 	//xml생성
// 	String xmlData = "<user>";
// 			xmlData +="<uid>a101</uid>";
// 			xmlData +="<age>23</age>";
// 			xmlData +="<name>김희지</age>";
// 			xmlData +="<hp>dd</hp>";
			
			
// 	out.print(xmlData);
	
// 	//gdom
	
// 	List<User1VO>vo = new ArrayList<>();
	
	
// 	try{
// 	Context initctx = new InitialContext();
// 	Context ctx = (Context)initctx.lookup("java:comp/env");
// 	DataSource ds = (DataSource)ctx.lookup("jdbc/userdb");
// 	Connection conn = ds.getConnection();
	
// 	Statement stmt = conn.createStatement();
// 	ResultSet rs = stmt.executeQuery("select * from `user2`");
	
// 	while(rs.next()){
// 		User1VO vo1 = new User1VO();
// 		vo1.setUid(rs.getString(1));
// 		vo1.setAge(rs.getString(2));
// 		vo1.setName(rs.getString(3));
// 		vo1.setHp(rs.getString(4));
// 		users.add(vo1);
// 	}
	
// 	}catch(Exception e){
	
// 		e.printStackTrace();

		
// 	}
	
// 	Document doc =new Document();
// 	Element elUsers = new Element("users");
	
// 	for(User1VO vo : users){
// 			Element elUser = new Element("user");
// 			Element elUid = new Element("uid");
// 			Element elName= new Element("name");
// 			Element elAge= new Element("age");
// 			Element elHp= new Element("Hp");
	
	
// 		elUid.setText(vo.getUid());
// 		elName.setText(vo.getName());
// 		elAge.setText(vo.getAge());
// 		elHp.setText(vo.getHp());
		
// 		elUser.addContent(elUid);
// 		elUser.addContent(elName);
// 		elUser.addContent(elAge);
// 		elUser.addContent(elHp);
		
// 		elUsers.addContent(elUser);
// 	}		
	
// 	doc.setRootElement(elUsers);
	
// 	XMLOutputter outputter = new XMLOutputter(Format.getPrettyFormat());
// 	String xml = outputter.outputString(doc);
// 	out.print(xml);
			
--%>	
	
	
