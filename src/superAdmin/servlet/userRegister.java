package superAdmin.servlet;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import superAdmin.DaoImpl.AdminDaoImpl;

/**
 * Servlet implementation class userRegister
 */
@WebServlet("/userRegister")
public class userRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	
    	String name=request.getParameter("name");
    	String email=request.getParameter("email");
    	
    	Random rand = new Random();
        int rand_int1 = rand.nextInt(100000); 
        String num=Integer.toString(rand_int1);
    	
    	String authkey="USER".concat(num);
    	String password=request.getParameter("password");
    	
    	AdminDaoImpl adminDaoImpl=new AdminDaoImpl();
    	
    	int i=adminDaoImpl.registerUser(authkey,name,email,password);
    	if(i>0) {
    		response.sendRedirect("user-login.jsp");
    	}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
