package homework.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import homework.dao.AddressDao;
import homework.dao.MemberDao;
import homework.dao.OrderDao;
import homework.model.Address;
import homework.model.Member;
import homework.model.Order;
import homework.model.OrderItem;
import homework.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDao orderDao;
	@Autowired
	AddressDao addressDao;
	@Autowired
	MemberDao memberDao;
	
	@Override
	public List<Order> getOrder(int memberid, int page) {
		// TODO Auto-generated method stub
		List<Order> list=orderDao.findByMember(memberid);
		List<Order> res=new ArrayList<Order>();
		for(int i=(page-1)*5;i<list.size()&&i<page*5;i++){
			Order l=list.get(i);
			List<OrderItem> items=orderDao.findByOrder(l.getId());
			l.setItems(items);
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
		Order l=new Order();
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
			if(!orderDao.saveItem(list.get(i))){
				return false;
			}
		}
		return true;
	}
	
	@Override
	public boolean deleteOrder(int orderid){
		return orderDao.delete(orderid);
	}

}
