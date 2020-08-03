package superAdmin.servlet;

import java.io.IOException;


import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import superAdmin.DaoImpl.AdminDaoImpl;
import all.beans.admin;
import all.beans.user;

/**
 * Servlet implementation class adminSignIn
 */
@WebServlet("/adminSignIn")
public class adminSignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminSignIn() {
        super();
        // TODO Auto-generated constructor stub
    }
    final static Logger logger = Logger.getLogger(adminSignIn.class);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String type=request.getParameter("type");
        if(type.equals("admin")) {
        	
        
       admin admin = new admin();
        AdminDaoImpl adminDaoImpl = new AdminDaoImpl();
        logger.info("111111111111");
        int id=0;
        
        Boolean status = false;
        
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        admin.setEmail(email);
        admin.setPassword(password);
         
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("E yyyy.MM.dd 'at' hh:mm:ss a");
        String logintime = String.valueOf(sdf.format(cal.getTime()));
        try {
        	logger.info("2222222222222");
      	status = adminDaoImpl.checkAdmin(admin);
      	logger.info("33333333333");
        	id = admin.getId();
        	email = admin.getEmail();
        	password = admin.getPassword();
        	
        	 if (status == true) {
        		 logger.info("444444444444");
        		 adminDaoImpl.logTimingDetails(id, logintime);
        		 logger.info("55555555555");
                 HttpSession session = request.getSession();

                 session.setAttribute("id", id);
                 session.setAttribute("email", email);
                 session.setAttribute("password", password);
                 
                 response.sendRedirect("admin-dashboard.jsp?clr=home&act=home1");
             
               out.println("</body>");
               out.println("</html>");
        		 
        	 }else{ 
        		 
        		 status = false;
        		 
        		 String message = "Login Failed,Please try again";
        		 request.setAttribute("message", message);
                 request.getRequestDispatcher("adminlogin.jsp").include(request, response);
                 
                   out.println("</body>");
                   out.println("</html>");
        	 }
        
        } catch (Exception e) {
            e.printStackTrace();
        }
        }else if(type.equals("user")) {

        	
            
            user users = new user();
             AdminDaoImpl adminDaoImpl = new AdminDaoImpl();
             logger.info("111111111111");
             int id=0;
             
             Boolean status = false;
             
             PrintWriter out = response.getWriter();
             String email = request.getParameter("email");
             String password = request.getParameter("password");
             String authkey="";
             
             users.setEmail(email);
             users.setPassword(password);
              
           /*  Calendar cal = Calendar.getInstance();
             SimpleDateFormat sdf = new SimpleDateFormat("E yyyy.MM.dd 'at' hh:mm:ss a");
             String logintime = String.valueOf(sdf.format(cal.getTime()));*/
             try {
             	logger.info("2222222222222");
           	status = adminDaoImpl.checkUsers(users);
           	logger.info("33333333333");
             	id = users.getId();
             	email = users.getEmail();
             	password = users.getPassword();
             	authkey=users.getAuthkey();
             	
             	 if (status == true) {
             		 logger.info("444444444444");
             		// adminDaoImpl.logTimingDetails(id, logintime);
             		 logger.info("55555555555");
                      HttpSession usersession = request.getSession();

                      usersession.setAttribute("id", id);
                      usersession.setAttribute("email", email);
                      usersession.setAttribute("password", password);
                      usersession.setAttribute("authkey", authkey);
                      System.out.println("authh="+authkey);
                      response.sendRedirect("user-notifs.jsp?clr=home&act=home1");
                  
                    out.println("</body>");
                    out.println("</html>");
             		 
             	 }else{ 
             		 
             		 status = false;
             		 
             		 String message = "Login Failed,Please try again";
             		 request.setAttribute("message", message);
                      request.getRequestDispatcher("user-login.jsp").include(request, response);
                      
                        out.println("</body>");
                        out.println("</html>");
             	 }
             
             } catch (Exception e) {
                 e.printStackTrace();
             }
             
        }
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
processRequest(request, response);	
}

}
