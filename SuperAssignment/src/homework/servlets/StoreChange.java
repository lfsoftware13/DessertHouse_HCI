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

import homework.service.StoreService;

/**
 * Servlet implementation class StoreChange
 */
@WebServlet("/StoreChange")
public class StoreChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static ApplicationContext appliationContext;
	public static StoreService storeService;
	
	
    public void init(ServletConfig config)throws ServletException{

		super.init(config);

    	appliationContext=new ClassPathXmlApplicationContext("applicationContext.xml"); 
    	storeService=(StoreService)appliationContext.getBean("storeService");
    }
	
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreChange() {
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
		if("delete".equals(request.getParameter("type"))){
			if(storeService.deleteStore(request.getParameter("id"))){
				out.write("[{\"status\":\"success\"}]");
			}else{
				out.write("[{\"status\":\"false\"}]");
			}
			
		}else if("update".equals(request.getParameter("type"))){
			
			if(storeService.updateStore(request.getParameter("id"), request.getParameter("name"), request.getParameter("place"))){
				out.write("[{\"status\":\"success\"}]");
			}else{
				out.write("[{\"status\":\"false\"}]");
			}
			
		}else if("add".equals(request.getParameter("type"))){
			if(storeService.addStore( request.getParameter("name"), request.getParameter("place"))){
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
