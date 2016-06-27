package homework.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import homework.dao.AddressDao;
import homework.model.Address;
import homework.service.AddressService;

@Service
public class AddressServiceImpl implements AddressService {

	@Autowired
	AddressDao addressDao;
	
	@Override
	public int addAddress(int memberid, String name, String prov, String city, String details, String zip,
			String phone, boolean isDefault) {
		// TODO Auto-generated method stub
		Address add=new Address();
		add.setName(name);
		add.setMemberid(memberid);
		add.setProv(prov);
		add.setCity(city);
		add.setDetails(details);
		add.setZip(zip);
		add.setPhone(phone);
		if(isDefault){
			add.setIsDefault(1);
		}
		else{
			add.setIsDefault(0);
		}
		
		List<Address> l=addressDao.findByMember(memberid);
		if(l.size()<=0){
			add.setIsDefault(1);
		}
		addressDao.save(add);
		
		return add.getId();
	}

	@Override
	public boolean updateAddress(int addressid, String name, String prov, String city, String details, String zip,
			String phone, boolean isDefault) {
		// TODO Auto-generated method stub
		Address add=addressDao.findById(addressid);
		add.setName(name);
		add.setProv(prov);
		add.setCity(city);
		add.setDetails(details);
		add.setZip(zip);
		add.setPhone(phone);
		if(isDefault){
			clearDefault();
			add.setIsDefault(1);
		}
		else{
			add.setIsDefault(0);
		}
		return addressDao.update(add);
	}
	
	public boolean clearDefault(){
		List<Address> list=addressDao.findAll();
		for(int i=0;i<list.size();i++){
			list.get(i).setIsDefault(0);
			addressDao.update(list.get(i));
		}
		return true;
	}
	
	@Override
	public boolean deleteAddress(int addressid) {
		// TODO Auto-generated method stub
		return addressDao.delete(addressid);
	}
	
	@Override
	public List<Address> findAddress(int memberid){
		return addressDao.findByMember(memberid);
	}

}
