package homework.service;

import java.util.List;

import homework.model.Orderesd;
import homework.model.OrderItem;

public interface OrderService {

	/**
	 * @param memberid 用户id
	 * @param page 分页
	 * @return 订单列表
	 */
	public List<Orderesd> getOrder(int memberid, int page);
	
	/**
	 * @param addressid 地址id
	 * @param list 商品列表
	 * @param total 总价
	 * @param memberid 用户id
	 * @return 操作是否成功
	 */
	public boolean addOrder(int addressid, List<OrderItem> list, double total, int memberid);
	
	/**
	 * @param orderid 订单id
	 * @return 删除是否成功
	 */
	public boolean deleteOrder(int orderid);
	
}
