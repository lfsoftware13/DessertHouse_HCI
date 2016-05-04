package homework.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import homework.dao.PlanDao;
import homework.dao.ProductDao;
import homework.dao.StockDao;
import homework.dao.StoreDao;
import homework.model.Plan;
import homework.model.PlanItem;
import homework.model.Product;
import homework.model.Stock;
import homework.model.Store;
import homework.service.NoteService;
import homework.service.PlanService;

@Service
public class PlanServiceImpl implements PlanService {
	
	@Autowired
	PlanDao planDao;
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	StockDao stockDao;
	
	@Autowired
	StoreDao storeDao;
	
	@Autowired
	NoteService noteService;

	@Override
	public boolean makePlan(String storeid, String start, String end) {
		// TODO Auto-generated method stub
		Plan plan=new Plan();
		String id=noteService.getNote("plan");
		plan.setId(id);
		plan.setStoreid(storeid);
		Store store=storeDao.findById(storeid);
		plan.setStore(store.getName());
		
		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
		Date d=new Date();
		Date s=new Date();
		try {
			d = sim.parse(start);
			s = sim.parse(end);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		plan.setStart(d);
		plan.setEnd(s);
		plan.setStatus("未审批");
		return planDao.save(plan);
	}

	@Override
	public boolean addPlanItem(String planid, String productid, int number, double price) {
		// TODO Auto-generated method stub
		Plan plan=planDao.findById(planid);
		Product pro=productDao.findById(productid);
		String id=noteService.getNote("plan_item");
		PlanItem item=new PlanItem();
		item.setId(id);
		item.setPlanid(planid);
		item.setProductid(productid);
		item.setProduct(pro.getName());
		item.setNumber(number);
		item.setPrice(price);
		if(plan!=null){
			return planDao.save(item);
		}
		return false;
	}

	@Override
	public boolean updatePlan(String id, String storeid, String start, String end) {
		// TODO Auto-generated method stub
		Plan plan=planDao.findById(id);
		Store store=storeDao.findById(storeid);
		plan.setStore(store.getName());
		plan.setStoreid(storeid);
		
		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
		Date d=new Date();
		Date s=new Date();
		try {
			d = sim.parse(start);
			s = sim.parse(end);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		plan.setStart(d);
		plan.setEnd(s);
		return planDao.update(plan);
	}

	@Override
	public boolean updatePlanItem(String id, String productid, int number, double price) {
		// TODO Auto-generated method stub
		Product pro=productDao.findById(productid);
		PlanItem item=planDao.findItem(id);
		item.setProductid(productid);
		item.setProduct(pro.getName());
		item.setNumber(number);
		item.setPrice(price);
		return planDao.update(item);
	}

	@Override
	public boolean deletePlan(String id) {
		// TODO Auto-generated method stub
		return planDao.delete(id);
	}

	@Override
	public boolean deletePlanItem(String id) {
		// TODO Auto-generated method stub
		if(planDao.findItem(id)!=null){
			return planDao.deleteItem(id);
		}
		return false;
	}

	@Override
	public Plan findPlan(String id) {
		// TODO Auto-generated method stub
		return planDao.findById(id);
	}

	@Override
	public List<Plan> findAllPlan(String storeid, String time) {
		// TODO Auto-generated method stub
		List<Plan> list=planDao.findAll();
		ArrayList<Plan> res=new ArrayList<Plan>();
		
		long ti=0;
		
		if(!"all".equals(time)){
		
			SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
			Date d=new Date();
			try {
				d = sim.parse(time);
			} catch (ParseException e) {
				e.printStackTrace();
			}
				ti=d.getTime();
		}
		
		System.out.println("ti:"+ti);

		
		for(int i=0;i<list.size();i++){
			if(list.get(i).getStoreid().equals(storeid)||"all".equals(storeid)){
				
				long start=list.get(i).getStart().getTime();
				long end=list.get(i).getEnd().getTime();
				System.out.println("start:"+start);
				System.out.println("end:"+end);
				if((start<=ti&&end>=ti)||ti==0){
					res.add(list.get(i));
				}
			}
		}
		return res;
	}
	
	public List<Plan> findAllPlan() {
		// TODO Auto-generated method stub
		List<Plan> list=planDao.findAll();
		return list;
	}

	@Override
	public boolean approvePlan(String id) {
		// TODO Auto-generated method stub
		Plan plan=planDao.findById(id);
		plan.setStatus("已通过");
		planDao.update(plan);
		
		List list=planDao.findItemList(id);
		
		for(int i=0;i<list.size();i++){
			Stock stock=new Stock();
			PlanItem pla=(PlanItem) list.get(i);
			String note= noteService.getNote("stock");
			stock.setId(note);
			stock.setStoreid(plan.getStoreid());
			stock.setStore(plan.getStore());
			stock.setProductid(pla.getProductid());
			stock.setProduct(pla.getProduct());
			stock.setStart(plan.getStart());
			stock.setEnd(plan.getEnd());
			stock.setPrice(pla.getPrice());
			stock.setNumber(pla.getNumber());
			
			stockDao.save(stock);
		}
		return true;
	}

	@Override
	public boolean refusePlan(String id) {
		// TODO Auto-generated method stub
		Plan plan=planDao.findById(id);
		plan.setStatus("未通过");
		return planDao.update(plan);
	}

	@Override
	public List<Product> findAllProduct() {
		// TODO Auto-generated method stub
		return productDao.findAll();
	}

	@Override
	public Product findProductById(String id) {
		// TODO Auto-generated method stub
		return productDao.findById(id);
	}

	@Override
	public Product findProduct(String name) {
		// TODO Auto-generated method stub
		return productDao.find(name);
	}

	@Override
	public List findAllStock() {
		// TODO Auto-generated method stub
		return stockDao.findAll();
	}

	@Override
	public List findStock(String storeid, String time) {
		// TODO Auto-generated method stub
		List list;
		if("all".equals(storeid)){
			list=stockDao.findAll();
		}else{
			list=stockDao.findByStore(storeid);
		}
		
//		System.out.println("findlist:"+list);
		
		List<Stock> res=new ArrayList<Stock>();
		
		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
		Date d=new Date();
		
//		System.out.println(d);
		
		try {
			
			d = sim.parse(time);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		long ti=d.getTime();
		
//		System.out.println("ti:"+ti);
//		System.out.println("listsize:"+list.size());
		
		for(int i=0;i<list.size();i++){
			Stock sto=(Stock)list.get(i);
			long start=sto.getStart().getTime();
			long end=sto.getEnd().getTime();
			System.out.println("start:"+start);
			System.out.println("end:"+end);
			if(ti>=start&&ti<=end&&sto.getNumber()>0){
				res.add((Stock)list.get(i));
			}
		}
		
		return res;
	}

	@Override
	public Stock findStockById(String id) {
		// TODO Auto-generated method stub
		return stockDao.findById(id);
	}

	@Override
	public List<PlanItem> findPlanItem(String planid) {
		// TODO Auto-generated method stub
		return planDao.findItemList(planid);
	}

	@Override
	public List<PlanItem> findAllPlanItem() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public PlanItem findPlanItemById(String id) {
		// TODO Auto-generated method stub
		return planDao.findItem(id);
	}

}
