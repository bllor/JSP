package service;

import java.util.List;

import dao.MemberDAO;
import dto.MemberDTO;

//열거타입 enum을 활용한 싱글톤 객체 생성
public enum MemberService {

	INSTANCE;//이렇게 하면 편하게 싱글톤을 만들 수 잇음 위에CLASS대신 ENUM을 적고
	
	
	MemberDAO dao = MemberDAO.getInstence();
	
	//기본 CRUD
	public void insertMember(MemberDTO dto) {
		dao.insertMember(dto);
	}
	
	public MemberDTO selectMember(String uid) {
		return dao.selectMember(uid);
	}
	public List<MemberDTO> selectMembers() {
		return dao.selectMembers();
	}
	public void updateMember(MemberDTO dto) {
		dao.updateMember(dto);
	}
	public void deleteMember(String uid) {
		dao.deleteMember(uid);
	}
	
	
}
