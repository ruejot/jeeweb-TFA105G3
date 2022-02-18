package com.order.model;

import java.util.List;

public interface OrderDAO_interface {
	public void insert(OrderVO orderVO);
	public void update(OrderVO orderVO);
	public void delete(Integer orderId);
	public OrderVO findByOrderId(Integer orderId);
	public List<OrderVO> findByBusId(Integer busId);
	public List<OrderVO> findByMemberId(Integer memberId);
	public List<OrderVO> getAll();

}