package kr.co.farmstory2.service;



import kr.co.farmstory2.dao.UserDAO;
import kr.co.farmstory2.dto.UserDTO;

public class UserService {

	private static UserService instance = new UserService();
	public static UserService getInstance() {
		return instance;
	}
	private UserService() {}
	
	private UserDAO dao = UserDAO.getInstance();
	
	
	public void insertUser(UserDTO dto) {
		dao.insertUser(dto);
	}
	
	public UserDTO selectUser(String uid, String pass) {
		return dao.selectUser(uid, pass);
	}
	
	public int selectCountUid(String uid) {
		return dao.selectCountUid(uid);
	}

	public int selectCountNick(String nick) {
		return dao.selectCountNick(nick);
	}
	public int selectCountHp(String hp) {
		return dao.selectCountHp(hp);
	}
	public int selectCountEmail(String email) {
		return dao.selectCountEmail(email);
	}

	
}
