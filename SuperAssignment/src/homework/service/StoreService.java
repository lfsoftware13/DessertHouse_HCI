package homework.service;

import java.util.List;

import homework.model.Clerk;
import homework.model.Store;

public interface StoreService {
	
	public boolean addStore(String name, String place);
	
	public boolean deleteStore(String id);
	
	public boolean updateStore(String id, String name, String place);
	
	public Store findStoreById(String id);
	
	public Store findStore(String name);
	
	public List<Store> findAllStore();
	
	public boolean addClerk(String account, String password, String name,String sex,String storeid,int type);
	
	public boolean deleteClerk(String id);
	
	public boolean updateClerk(String id, String name, String sex, String storeid);
	
	public boolean updateClerk(String id, String password);
	
	public Clerk findClerk(String name);
	
	public Clerk findClerkById(String id);
	
	public List<Clerk> findFreeClerk();
	
	public List<Clerk> findAllClerk();

}
