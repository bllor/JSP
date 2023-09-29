package Service.user;

import UserDAO.userDAO;

public enum UserService {
	INSTANCE;
		
	userDAO dao = new userDAO();
	
	public int selectUid(String uid) {
		return dao.selectUid(uid);
	}
	
}
