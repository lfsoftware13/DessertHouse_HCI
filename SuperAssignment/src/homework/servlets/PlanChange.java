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
 * Servlet implementation class PlanChange
 */
@WebServlet("/PlanChange")
public class PlanChange extends HttpServlet {
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
    public PlanChange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		if("delete".equals(request.getParameter("type"))){
			if(planService.deletePlan(request.getParameter("id"))){
				out.write("[{\"status\":\"success\"}]");
			}else{
				out.write("[{\"status\":\"false\"}]");
			}
		}else if("update".equals(request.getParameter("type"))){
			if(planService.updatePlan(request.getParameter("id"), request.getParameter("storeid"), request.getParameter("start"), request.getParameter("end"))){
				out.write("[{\"status\":\"success\"}]");
			}else{
				out.write("[{\"status\":\"false\"}]");
			}
		}else if("add".equals(request.getParameter("type"))){
			if(planService.makePlan(request.getParameter("storeid"), request.getParameter("start"), request.getParameter("end"))){
				out.write("[{\"status\":\"success\"}]");
			}else{
				out.write("[{\"status\":\"false\"}]");
			}
		}else if("pass".equals(request.getParameter("type"))){
			if(planService.approvePlan(request.getParameter("id"))){
				out.write("[{\"status\":\"success\"}]");
			}else{
				out.write("[{\"status\":\"false\"}]");
			}
		}else if("refuse".equals(request.getParameter("type"))){
			if(planService.refusePlan(request.getParameter("id"))){
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
