package homework.service;

import java.util.Date;
import java.util.List;

import homework.model.Plan;
import homework.model.PlanItem;
import homework.model.Product;
import homework.model.Stock;

public interface PlanService {
	
	public boolean makePlan(String storeid, String start, String end);
	
	public boolean addPlanItem(String planid, String productid, int number, double price);
	
	public boolean updatePlan(String id, String storeid, String start, String end);
	
	public boolean updatePlanItem(String id, String productid, int number, double price);
	
	public boolean deletePlan(String id);
	
	public boolean deletePlanItem(String id);
	
	public Plan findPlan(String id);
	
	public List<Plan> findAllPlan(String storeid,String time);
	
	public List<Plan> findAllPlan();
	
	public List<PlanItem> findPlanItem(String planid);
	
	public List<PlanItem> findAllPlanItem();
	
	public PlanItem findPlanItemById(String id);
	
	public boolean approvePlan(String id);
	
	public boolean refusePlan(String id);
	
	public List<Product> findAllProduct();
	
	public Product findProductById(String id);
	
	public Product findProduct(String name);
	
	public List findAllStock();
	
	public List findStock(String storeid, String time);
	
	public Stock findStockById(String id);
	
}
