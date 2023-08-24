package kr.Farmstory1.dao;

import java.util.List;

import kr.Farmstory1.db.DBhelper;
import kr.Farmstory1.db.SQL;
import kr.Farmstory1.dto.OrderDTO;

public class OrderDAO extends DBhelper {

	//기본 CRUD
	
	public void insertOrder(OrderDTO dto) {
	
		try {
			conn = getconnection();
			psmt = conn.prepareStatement(SQL.INSERT_ORDER);
			psmt.setInt(1, dto.getOrderProduct());
			psmt.setInt(2, dto.getOrderCount());
			psmt.setInt(3, dto.getOrderDelivery());
			psmt.setInt(4, dto.getOrderPrice());
			psmt.setInt(5, dto.getOrderTotal());
			psmt.setString(6, dto.getReceiver());
			psmt.setString(7, dto.getHp());
			psmt.setString(8, dto.getZip());
			psmt.setString(9, dto.getAddr1());
			psmt.setString(10, dto.getAddr2());
			psmt.setString(11, dto.getOrderEtc());
			psmt.setString(12, dto.getOrderUser());
			psmt.executeUpdate();
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public OrderDTO selectOrder(int orderNo) {
		return null;
	}
	public List<OrderDTO> selectOrders() {
		return null;
	}
	public void updateOrder(OrderDTO dto) {
		
	}
	public void deleteOrder(int orderNo) {}
	
	
}