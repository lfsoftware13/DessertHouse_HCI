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
		System.out.println(userId);
		List<Address> addressList = addressService.findAddress(userId);
		session.setAttribute("addressList", addressList);
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
			int newId = addressService.addAddress(address.getMemberid(), address.getName(), address.getProv(), address.getCity(), address.getDetails(), address.getZip(), address.getPhone(), address.getIsDefault() == 1? true: false);
			response.getWriter().print(newId);
			System.out.println("add");
			break;
		case "modify":
			address = this.getAddressFromRequest(request);
			addressService.updateAddress(address.getId(), address.getName(), address.getProv(), address.getCity(), address.getDetails(), address.getZip(), address.getPhone(), address.getIsDefault() == 1? true: false);
			System.out.println("modify");
			break;
		case "delete":
			String id = request.getParameter("addressId");
			addressService.deleteAddress(Integer.parseInt(id));
			System.out.println("delete");
			break;
		}
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("user");
		List<Address> addressList = addressService.findAddress(userId);
		session.setAttribute("addressList", addressList);
		response.getWriter().print(returnMessage);
	}
	
	private Address getAddressFromRequest(HttpServletRequest request){
		HttpSession session = request.getSession();
		Address address  = new Address();
		String id = request.getParameter("id");
		int userId = (int)session.getAttribute("user");
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String detailedAddr = request.getParameter("detailedAddr");
		String zipcode = request.getParameter("zipcode");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		boolean isDefault = Boolean.getBoolean(request.getParameter("isDefault"));
		System.out.println(id + " " + province + " " + city + " " + detailedAddr + " " + zipcode + " " + name + " " + phone + " " + isDefault);
		System.out.println(userId);
		address.setCity(city);
		address.setDetails(detailedAddr);
		address.setId(0);
		address.setIsDefault(isDefault ? 1 : 0);
		address.setMemberid(userId);
		address.setName(name);
		address.setPhone(phone);
		address.setProv(province);
		address.setZip(zipcode);
		return address;
	}

}
