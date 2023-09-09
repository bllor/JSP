package kr.co.farmstory2.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.dao.OrderDAO;
import kr.co.farmstory2.dto.OrderDTO;

public enum OrderService {
	INSTANCE;
	
	OrderDAO dao = new OrderDAO();
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertOrder(OrderDTO dto) {
		dao.insertOrder(dto);
	}
	
	public List<OrderDTO> selectOrders(int start){
		return dao.selectOrders(start);
	}
	
	public int selectCountOrdersTotal() {
		return dao.selectCountOrders();
	}
	
}
