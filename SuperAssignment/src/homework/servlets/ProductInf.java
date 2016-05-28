package homework.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import homework.listeners.JsonDateValueProcessor;
import homework.model.Stock;
import homework.service.PlanService;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

/**
 * Servlet implementation class ProductInf
 */
@WebServlet("/ProductInf")
public class ProductInf extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static ApplicationContext appliationContext;
	public static PlanService planService;
	
    public void init(ServletConfig config)throws ServletException{

		super.init(config);

    	appliationContext=new ClassPathXmlApplicationContext("applicationContext.xml"); 
    	planService=(PlanService)appliationContext.getBean("planService");
    }
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductInf() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//参数
		//id：图书编号
		PrintWriter out=response.getWriter();
		Stock sto=planService.findStockById(request.getParameter("id"));
		
		JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.registerJsonValueProcessor(Date.class , new JsonDateValueProcessor());
		
        JSONArray array=JSONArray.fromObject(sto,jsonConfig);
        out.write(array.toString());
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
