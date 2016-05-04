package homework.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import homework.listeners.JsonDateValueProcessor;
import homework.service.ClerkService;
import homework.service.ManageService;
import homework.service.MemberService;
import homework.service.PlanService;
import homework.service.StoreService;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

/**
 * Servlet implementation class Store_List
 */
@WebServlet("/GetList")
public class GetList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static ApplicationContext appliationContext;
	public static MemberService memberService;
	public static ClerkService clerkService;
	public static ManageService manageService;
	public static PlanService planService;
	public static StoreService storeService;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetList() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config)throws ServletException{

		super.init(config);

    	appliationContext=new ClassPathXmlApplicationContext("applicationContext.xml"); 
    	memberService=(MemberService)appliationContext.getBean("memberService");
    	clerkService=(ClerkService)appliationContext.getBean("clerkService");
    	manageService=(ManageService)appliationContext.getBean("manageService");
    	planService=(PlanService)appliationContext.getBean("planService");
    	storeService=(StoreService)appliationContext.getBean("storeService");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session=request.getSession(true);
//		session.setAttribute("id", 1);
		String type=request.getParameter("type");
		PrintWriter out=response.getWriter();
		if("store".equals(type)){
			List list=storeService.findAllStore();
			JSONArray array=JSONArray.fromObject(list);
			out.write(array.toString());
		}
		if("clerk".equals(type)){
			List list=storeService.findAllClerk();
			JSONArray array=JSONArray.fromObject(list);
			out.write(array.toString());
		}
		if("member".equals(type)){
			List list=memberService.findAllMember();
			JsonConfig jsonConfig = new JsonConfig();
	        jsonConfig.registerJsonValueProcessor(Date.class , new JsonDateValueProcessor());
			
	        JSONArray array=JSONArray.fromObject(list,jsonConfig);
			out.write(array.toString());
		}
		if("product".equals(type)){
			List list=planService.findStock(request.getParameter("storeid"), request.getParameter("time"));
			
			JsonConfig jsonConfig = new JsonConfig();
	        jsonConfig.registerJsonValueProcessor(Date.class , new JsonDateValueProcessor());
			
	        JSONArray array=JSONArray.fromObject(list,jsonConfig);
	        
	        out.write(array.toString());
	        
		}
		if("plan".equals(type)){
			List list=planService.findAllPlan(request.getParameter("storeid"),request.getParameter("time"));
			JsonConfig jsonConfig = new JsonConfig();
	        jsonConfig.registerJsonValueProcessor(Date.class , new JsonDateValueProcessor());
			
	        JSONArray array=JSONArray.fromObject(list,jsonConfig);
			out.write(array.toString());
		}
		if("planitem".equals(type)){
			List list=planService.findPlanItem(request.getParameter("id"));
			JsonConfig jsonConfig = new JsonConfig();
	        jsonConfig.registerJsonValueProcessor(Date.class , new JsonDateValueProcessor());
			
	        JSONArray array=JSONArray.fromObject(list,jsonConfig);
			out.write(array.toString());
		}
		if("productlist".equals(type)){
			List list=planService.findAllProduct();
			JsonConfig jsonConfig = new JsonConfig();
	        jsonConfig.registerJsonValueProcessor(Date.class , new JsonDateValueProcessor());
			
	        JSONArray array=JSONArray.fromObject(list,jsonConfig);
			out.write(array.toString());
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
