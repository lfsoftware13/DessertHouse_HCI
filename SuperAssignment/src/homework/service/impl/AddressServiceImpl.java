package homework.service.impl;

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
	public boolean addAddress(int memberid, String name, String prov, String city, String details, String zip,
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
		return addressDao.save(add);
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
			add.setIsDefault(1);
		}
		else{
			add.setIsDefault(0);
		}
		return addressDao.update(add);
	}
	
	@Override
	public boolean deleteAddress(int addressid) {
		// TODO Auto-generated method stub
		return addressDao.delete(addressid);
	}

}
