package homework.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import homework.dao.AccountDao;
import homework.dao.ClerkDao;
import homework.dao.StoreDao;
import homework.model.Account;
import homework.model.Clerk;
import homework.model.Store;
import homework.service.NoteService;
import homework.service.StoreService;

@Service
public class StoreServiceImpl implements StoreService{

	@Autowired
	StoreDao storeDao;
	
	@Autowired
	AccountDao accountDao;
	
	@Autowired
	ClerkDao clerkDao;
	
	@Autowired
	NoteService noteService;
	
	@Override
	public boolean addStore(String name, String place) {
		// TODO Auto-generated method stub
		Store sto=new Store();
		String id=noteService.getNote("store");
		sto.setId(id);
		sto.setName(name);
		sto.setPlace(place);
		return storeDao.save(sto);
	}

	@Override
	public boolean deleteStore(String id) {
		// TODO Auto-generated method stub
		if(storeDao.findById(id)!=null){
			return storeDao.delete(id);
		}
		return false;
	}

	@Override
	public boolean updateStore(String id, String name, String place) {
		// TODO Auto-generated method stub
		Store sto=storeDao.findById(id);
		if(sto==null){
			return false;
		}
		sto.setName(name);
		sto.setPlace(place);
		return storeDao.update(sto);
	}

	@Override
	public Store findStoreById(String id) {
		// TODO Auto-generated method stub
		return storeDao.findById(id);
	}

	@Override
	public Store findStore(String name) {
		// TODO Auto-generated method stub
		return storeDao.find(name);
	}

	@Override
	public List<Store> findAllStore() {
		// TODO Auto-generated method stub
		return storeDao.findAll();
	}

	@Override
	public boolean addClerk(String account, String password, String name, String sex,String storeid, int type) {
		// TODO Auto-generated method stub
		Account acc=new Account();
		String id=noteService.getNote("clerk");
		acc.setId(id);
		acc.setAccount(account);
		acc.setPassword(password);
		acc.setType(type);
		Clerk clerk=new Clerk();
		clerk.setId(id);
		clerk.setName(name);
		clerk.setSex(sex);
		clerk.setStoreid(storeid);
		Store sto=findStoreById(storeid);
		if(sto!=null){
			clerk.setStore(sto.getName());
		}else{
			clerk.setStore("");
		}
		if(accountDao.save(acc)&&clerkDao.save(clerk)){
			return true;
		}
		return false;
	}
	
	@Override
	public boolean deleteClerk(String id) {
		// TODO Auto-generated method stub
		Clerk sto=clerkDao.findById(id);
		if(sto==null){
			return true;
		}
		return clerkDao.delete(id);
	}

	@Override
	public boolean updateClerk(String id, String password) {
		// TODO Auto-generated method stub
		Account acc=accountDao.findById(id);
		if(acc==null){
			return false;
		}
		acc.setPassword(password);
		return accountDao.update(acc);
	}

	@Override
	public boolean updateClerk(String id, String name, String sex, String storeid) {
		// TODO Auto-generated method stub
		Clerk clerk=clerkDao.findById(id);
		if(clerk==null){
			return false;
		}
		clerk.setName(name);
		clerk.setSex(sex);
		clerk.setStoreid(storeid);
		Store sto=storeDao.findById(storeid);
		if(sto!=null){
			System.out.println("updateClerk:"+sto.getName());
			clerk.setStore(sto.getName());
		}
		return clerkDao.update(clerk);
	}

	@Override
	public Clerk findClerk(String name) {
		// TODO Auto-generated method stub
		return clerkDao.find(name);
	}

	@Override
	public Clerk findClerkById(String id) {
		// TODO Auto-generated method stub
		return clerkDao.findById(id);
	}

	@Override
	public List<Clerk> findFreeClerk() {
		// TODO Auto-generated method stub
		List<Clerk> list=clerkDao.findAll();
		List<Clerk> res=new ArrayList<Clerk>();
		for(int i=0;i<list.size();i++){
			if(list.get(i).getStoreid().equals("")){
				res.add(list.get(i));
			}
		}
		return res;
	}

	@Override
	public List<Clerk> findAllClerk() {
		// TODO Auto-generated method stub
		return clerkDao.findAll();
	}

}
