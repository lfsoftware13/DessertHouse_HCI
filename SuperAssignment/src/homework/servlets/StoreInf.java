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

import homework.model.Store;
import homework.service.StoreService;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class Store
 */
@WebServlet("/StoreInf")
public class StoreInf extends HttpServlet {
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
    public StoreInf() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		System.out.println(request.getParameter("id"));
		Store sto=storeService.findStoreById(request.getParameter("id"));
		JSONArray array=JSONArray.fromObject(sto);
		out.print(array.toString());
		System.out.println(array.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
