package homework.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import homework.service.PlanService;

/**
 * Servlet implementation class PlanItemChange
 */
@WebServlet("/PlanItemChange")
public class PlanItemChange extends HttpServlet {
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
    public PlanItemChange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out=response.getWriter();
		if("add".equals(request.getParameter("type"))){
			if(planService.addPlanItem(request.getParameter("planid"), request.getParameter("productid"), Integer.parseInt(request.getParameter("number")), Double.parseDouble(request.getParameter("price")))){
				out.write("[{\"status\":\"success\"}]");
			}else{
				out.write("[{\"status\":\"false\"}]");
			}
		}else if("update".equals(request.getParameter("type"))){
			if(planService.updatePlanItem(request.getParameter("id"), request.getParameter("productid"), Integer.parseInt(request.getParameter("number")), Double.parseDouble(request.getParameter("price")))){
				out.write("[{\"status\":\"success\"}]");
			}else{
				out.write("[{\"status\":\"false\"}]");
			}
		}else if("delete".equals(request.getParameter("type"))){
			if(planService.deletePlanItem(request.getParameter("id"))){
				out.write("[{\"status\":\"success\"}]");
			}else{
				out.write("[{\"status\":\"false\"}]");
			}
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
