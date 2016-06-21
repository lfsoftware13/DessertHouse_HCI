package homework.service;

import java.util.List;

import homework.model.CartItem;

public interface CartService {

	/**
	 * @param bookid 书籍编号
	 * @param number 数量
	 * @param memberid 用户id
	 * @return 是否成功
	 */
	public boolean addCart(int bookid, int number, int memberid);
	
	/**
	 * @param memberid 用户id
	 * @return 购物车列表
	 */
	public List<CartItem> getCartItem(int memberid);
	
	/**
	 * @param itemid 购物车单项id
	 * @return 操作是否成功
	 */
	public boolean deleteCart(int itemid);
	
}
