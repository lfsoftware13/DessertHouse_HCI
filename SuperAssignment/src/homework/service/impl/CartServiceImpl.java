package homework.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import homework.dao.BookDao;
import homework.dao.CartDao;
import homework.dao.MemberDao;
import homework.model.Book;
import homework.model.Cart;
import homework.model.CartItem;
import homework.model.Member;

@Service
public class CartServiceImpl implements homework.service.CartService {
	
	@Autowired
	CartDao cartDao;
	@Autowired
	MemberDao memberDao;
	@Autowired
	BookDao bookDao;

	@Override
	public boolean addCart(int bookid, int number, int memberid) {
		// TODO Auto-generated method stub
		boolean hasCart=true;
		Member m=memberDao.findById(memberid);
		Book b=bookDao.findById(bookid);
		Cart ca=cartDao.findByMemberid(memberid);
		if(ca==null){
			hasCart=false;
			ca=new Cart();
			ca.setMemberid(memberid);
			ca.setMember(m.getName());
			cartDao.save(ca);
		}
		ca.setNumber(ca.getNumber()+number);
		ca.setTotal(ca.getTotal()+b.getPrice()*number);
		cartDao.update(ca);
		CartItem item=new CartItem();
		item.setBookid(bookid);
		item.setBook(b.getName());
		item.setCartid(ca.getId());
		item.setNumber(number);
		item.setPrice(b.getPrice());
		item.setTotal(b.getPrice()*number);
		return cartDao.saveItem(item);
	}

	@Override
	public List<CartItem> getCartItem(int memberid) {
		// TODO Auto-generated method stub
		Cart ca=cartDao.findByMemberid(memberid);
		return cartDao.findItemByCart(ca.getId());
	}

	@Override
	public boolean deleteCart(int itemid) {
		// TODO Auto-generated method stub
		return cartDao.deleteItem(itemid);
	}

}
