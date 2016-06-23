package homework.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import homework.dao.AddressDao;
import homework.dao.BookDao;
import homework.dao.CartDao;
import homework.dao.MemberDao;
import homework.dao.OrderDao;
import homework.model.Address;
import homework.model.Book;
import homework.model.Cart;
import homework.model.CartItem;
import homework.model.Member;
import homework.model.OrderItem;
import homework.model.Orderesd;
import homework.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDao orderDao;
	@Autowired
	AddressDao addressDao;
	@Autowired
	MemberDao memberDao;
	@Autowired
	CartDao cartDao;
	@Autowired
	BookDao bookDao;
	
	@Override
	public List<Orderesd> getOrder(int memberid, int page) {
		// TODO Auto-generated method stub
		System.out.println("memberid:"+memberid+"  page:"+page);
		List<Orderesd> list=orderDao.findAll();
		List<Orderesd> res=new ArrayList<Orderesd>();
		for(int i=(page-1)*5;i<list.size()&&i<page*5;i++){
			Orderesd l=list.get(i);
			System.out.println(l.getMemberid());
			if(memberid!=l.getMemberid()) continue;
			List<OrderItem> items=orderDao.findByOrder(l.getId());
			l.setItems(items);
			res.add(l);
		}
		return res;
	}

	@Override
	public boolean addOrder(int addressid, List<OrderItem> list, double total, int memberid) {
		// TODO Auto-generated method stub
		Address add=addressDao.findById(addressid);
		Member mem=memberDao.findById(memberid);
		int num=0;
		double tot=0;
		for(int i=0;i<list.size();i++){
			num=num+list.get(i).getNumber();
			tot=tot+list.get(i).getNumber()*list.get(i).getPrice();
		}
		if(add==null||mem==null) return false;
		Orderesd l=new Orderesd();
		l.setAddressid(addressid);
		l.setAddress(add.getName());
		l.setMemberid(memberid);
		l.setMember(mem.getName());
		l.setNumber(num);
		l.setStatus("完成");
		l.setTime(new Date());
		l.setTotal(tot);
		if(!orderDao.save(l)){
			return false;
		}
		for(int i=0;i<list.size();i++){
			list.get(i).setOrderid(l.getId());
			Book b=(Book)bookDao.findById(list.get(i).getBookid());
			list.get(i).setBook(b.getName());
			list.get(i).setImage(b.getImage());
			if(!orderDao.saveItem(list.get(i))){
				return false;
			}
		}
		
		Cart cart=cartDao.findByMemberid(memberid);
		if(cart==null) return true;
		List<CartItem> items=cartDao.findItemByCart(cart.getId());
		
		for(int i=0;i<items.size();i++){
			for(int j=0;j<list.size();j++){
				if(items.get(i).getBookid()==list.get(j).getBookid()){
					items.get(i).setNumber(items.get(i).getNumber()-list.get(j).getNumber());
					if(items.get(i).getNumber()<=0){
						cartDao.deleteItem(items.get(i).getId());
					}
					break;
				}
			}
		}
		
		return true;
	}
	
	@Override
	public boolean deleteOrder(int orderid){
		return orderDao.delete(orderid);
	}

}
