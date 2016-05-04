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

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import homework.listeners.JsonDateValueProcessor;
import homework.service.MemberService;
import homework.service.TradeService;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

/**
 * Servlet implementation class PaymentInf
 */
@WebServlet("/PaymentInf")
public class PaymentInf extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	private static ApplicationContext appliationContext;
	public static MemberService memberService;
	public static TradeService tradeService;
	
    public void init(ServletConfig config)throws ServletException{

		super.init(config);

    	appliationContext=new ClassPathXmlApplicationContext("applicationContext.xml"); 
    	tradeService=(TradeService)appliationContext.getBean("tradeService");
    	memberService=(MemberService)appliationContext.getBean("memberService");
    }
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentInf() {
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
		if(request.getParameter("id")==null){
			out.write("[]");
			return ;
		}
		
		if("payment".equals(request.getParameter("type"))){
			List list=tradeService.findPaymentByMem(request.getParameter("id"));
			JsonConfig jsonConfig = new JsonConfig();
	        jsonConfig.registerJsonValueProcessor(Date.class , new JsonDateValueProcessor());
			
	        JSONArray array=JSONArray.fromObject(list,jsonConfig);
	        out.write(array.toString());
	        return ;
		}else if("consumption".equals(request.getParameter("type"))){
			List list=tradeService.findConsumptionByMem(request.getParameter("id"));
			JsonConfig jsonConfig = new JsonConfig();
	        jsonConfig.registerJsonValueProcessor(Date.class , new JsonDateValueProcessor());
			
	        JSONArray array=JSONArray.fromObject(list,jsonConfig);
	        out.write(array.toString());
	        return ;
		}else if("unsub".equals(request.getParameter("type"))){
			
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
