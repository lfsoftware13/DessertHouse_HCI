package homework.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import homework.model.Address;
import homework.service.AddressService;
import homework.service.TopicService;

/**
 * Servlet implementation class AddressServlet
 */
@WebServlet("/AddressServlet")
public class AddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static ApplicationContext appliationContext;
	private AddressService addressService;
	
	public void init(ServletConfig config)throws ServletException{

		super.init(config);

	    appliationContext=new ClassPathXmlApplicationContext("applicationContext.xml"); 
	    addressService=(AddressService)appliationContext.getBean("addressService");
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("user");
		List<Address> addressList = addressService.findAddress(userId);
		Address address = new Address();
		address.setId(12321);
		address.setName("六五四");
		address.setProv("北京市");
		address.setCity("北京");
		address.setPhone("1232181279");
		address.setDetails("详细地址");
		session.setAttribute("defaultAddress", address);
		response.sendRedirect(request.getContextPath() + "/jsp/address.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		Address address;
		String returnMessage = "success";
		switch(action){
		case "add":
			address = this.getAddressFromRequest(request);
			addressService.addAddress(0, address.getName(), address.getProv(), address.getCity(), address.getDetails(), address.getZip(), address.getPhone(), address.getIsDefault() == 1? true: false);
			break;
		case "modify":
			address = this.getAddressFromRequest(request);
			addressService.updateAddress(address.getId(), address.getName(), address.getProv(), address.getCity(), address.getDetails(), address.getZip(), address.getPhone(), address.getIsDefault() == 1? true: false);
			break;
		case "delete":
			String id = request.getParameter("addressId");
			addressService.deleteAddress(Integer.parseInt(id));
			break;
		}
		response.getWriter().print(returnMessage);
	}
	
	private Address getAddressFromRequest(HttpServletRequest request){
		HttpSession session = request.getSession();
		Address address  = new Address();
		String id = request.getParameter("id");
		String userId = "?????????????";
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String detailedAddr = request.getParameter("detailedAddr");
		String zipcode = request.getParameter("zipcode");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		boolean isDefault = Boolean.getBoolean(request.getParameter("idDefault"));
		System.out.println(id + " " + province + " " + city + " " + detailedAddr + " " + zipcode + " " + name + " " + phone + " " + isDefault);
		return address;
	}

}
