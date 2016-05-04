package homework.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import homework.model.StatPie;
import homework.service.StatService;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class StatInf
 */
@WebServlet("/StatInf")
public class StatInf extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static ApplicationContext appliationContext;
	public static StatService statService;	
	
    public void init(ServletConfig config)throws ServletException{

		super.init(config);

    	appliationContext=new ClassPathXmlApplicationContext("applicationContext.xml"); 
    	statService=(StatService)appliationContext.getBean("statService");
    }
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatInf() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		List list=new ArrayList<String>();
//		list.add("asd");
//		list.add("qwe");
//		list.add("zxc");
//		System.out.println(list);
		
//		JSON json=new JSON();
		
		List list=new ArrayList<StatPie>();
		
		if("sex".equals(request.getParameter("type"))){
			list=statService.getPieSex();
		}else if("age".equals(request.getParameter("type"))){
			list=statService.getPieAge();
		}else if("consumption".equals(request.getParameter("type"))){
			list=statService.getPieConsumption();
		}else if("card".equals(request.getParameter("type"))){
			list=statService.getPieCard();
		}else if("store".equals(request.getParameter("type"))){
			list=statService.getBarStore(request.getParameter("storeid"), request.getParameter("time"));
		}else if("product".equals(request.getParameter("type"))){
			list=statService.getBarProduct(request.getParameter("time"));
		}
		
		JSONArray array=JSONArray.fromObject(list);
		PrintWriter out=response.getWriter();
		out.write(array.toString());
		
		System.out.println(request.getParameter("type")+array.toString());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
