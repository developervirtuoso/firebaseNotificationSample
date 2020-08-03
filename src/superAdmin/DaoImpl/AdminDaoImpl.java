package superAdmin.DaoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.poi.hssf.record.UserSViewBegin;

import com.sun.corba.se.spi.orbutil.fsm.State;

import all.beans.admin;
import all.beans.notifications;
import all.beans.user;
import common.database.DbConnection;

public class AdminDaoImpl {
	public Boolean checkAdmin(admin admin){ 
//		TrippleDes td= new TrippleDes();
		
		 String password;
		 String email;
		 Boolean status =false;
		 int count=0;
		 int id=0;
		 Connection conn=DbConnection.getInstance().getConnection();
		 Statement stmt=null;
		 Statement stmt1=null;
		 ResultSet rs = null;
		 ResultSet rs1 = null;
		 
	   	  email = admin.getEmail();
	   	  password =admin.getPassword();
//	   	password=td.encrypt(password);
	   	 
	   	  try {
	         	
	         	stmt=conn.createStatement();
	         	String query = "select count(*) from adminlogin where email='"+email+"' and password='"+password+"'";
	         	rs = stmt.executeQuery(query);
	         	 while (rs.next()) {
	         		 count=rs.getInt(1);
	         	 }
	         		 if(count!=0){
	         			stmt1=conn.createStatement();
	         			String query1 = "select * from adminlogin where email='"+email+"' and password='"+password+"'";
	         			rs1 = stmt1.executeQuery(query1);
	                	 while (rs1.next()) {
	                		 
	                		 id=rs1.getInt("id");
	                		 email=rs1.getString("email");
	                		 password=rs1.getString("password");
	                		 admin.setId(id);
	                		 admin.setEmail(email);
	                		 admin.setPassword(password);
	         		 
	         		 status=true;
	         		 
	                	 }
	         		 }else{
	         			 status=false;
	         		 }
	    			conn.close();

	         } catch (Exception e) {
	             e.printStackTrace();
	         }finally
	         {
	        	 try {
	        	         if (conn != null)
	        	      	conn.close();
	        	      } catch (SQLException ignore) {} // no point handling

	        	      try {
	        	         if (stmt != null)
	        	             stmt.close();
	        	      } catch (SQLException ignore) {} // no point handling

	        	   try {
	        	         if (stmt1 != null)
	        	        	 stmt1.close();
	        	      } catch (SQLException ignore) {} // no point handling
	        	 }
	   	  
	   	  
	     return status; 
	   }
	public int registerUser(String authkey,String name,String email,String password) {
		
		int i=0;
		Connection conn=null;
		PreparedStatement pst=null;
		
		try {
			conn=DbConnection.getInstance().getConnection();
			pst=conn.prepareStatement("insert into user(auth_key,name,email,password)valuues('"+authkey+"','"+name+"','"+email+"','"+password+"')");
			i=pst.executeUpdate();
			if(i>0) {
				System.out.println("Successfull=="+pst.toString());
			}else {
				System.out.println("Not Successfull=="+pst.toString());
			}
		} catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}finally {
			try {
				if(conn!=null) {
					conn.close();
				}if(pst!=null) {
					pst.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			e2.printStackTrace();
			}
		}
		return i;
	}
public int insertNotifications(String authkey,String notification) {
		
		int i=0;
		Connection conn=null;
		PreparedStatement pst=null;
		
		try {
			conn=DbConnection.getInstance().getConnection();
			pst=conn.prepareStatement("insert into notification(authkey,notif,seen)values('"+authkey+"','"+notification+"','false')");
			i=pst.executeUpdate();
			if(i>0) {
				System.out.println("Successfull=="+pst.toString());
			}else {
				System.out.println("Not Successfull=="+pst.toString());
			}
		} catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}finally {
			try {
				if(conn!=null) {
					conn.close();
				}if(pst!=null) {
					pst.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			e2.printStackTrace();
			}
		}
		return i;
	}
public int pendingNotificationsCount(String authkey) {
	
	Connection conn=null;
	Statement st=null;
	ResultSet rs=null;
	int count=0;
	
	try {
		conn=DbConnection.getInstance().getConnection();
		st=conn.createStatement();
		rs=st.executeQuery("select count(*) as count from notification where authkey='"+authkey+"' and seen='false'");
	while(rs.next()) {
		count=rs.getInt("count");
	}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}finally {
		try {
			if(conn!=null) {
				conn.close();
			}if(rs!=null) {
				rs.close();
			}if(st!=null) {
				st.close();
			}
		} catch (Exception e2) {
			// TODO: handle exception
		e2.printStackTrace();
		}
	}
	return count;
}
public int updateStatus(String authkey) {
	
	int i=0;
	Connection conn=null;
	PreparedStatement pst=null;
	
	try {
		conn=DbConnection.getInstance().getConnection();
		pst=conn.prepareStatement("update notification set seen='true' where authkey='"+authkey+"'");
		i=pst.executeUpdate();
		if(i>0) {
			System.out.println("Successfull=="+pst.toString());
		}else {
			System.out.println("Not Successfull=="+pst.toString());
		}
	} catch (Exception e) {
		// TODO: handle exception
	e.printStackTrace();
	}finally {
		try {
			if(conn!=null) {
				conn.close();
			}if(pst!=null) {
				pst.close();
			}
		} catch (Exception e2) {
			// TODO: handle exception
		e2.printStackTrace();
		}
	}
	return i;
}
	
	public Boolean checkUsers(user users){ 
//		TrippleDes td= new TrippleDes();
		
		 String password;
		 String email;
		 String authkey;
		 Boolean status =false;
		 int count=0;
		 int id=0;
		 Connection conn=DbConnection.getInstance().getConnection();
		 Statement stmt=null;
		 Statement stmt1=null;
		 ResultSet rs = null;
		 ResultSet rs1 = null;
		 
	   	  email = users.getEmail();
	   	  password =users.getPassword();
//	   	password=td.encrypt(password);
	   	 
	   	  try {
	         	
	         	stmt=conn.createStatement();
	         	String query = "select count(*) from user where email='"+email+"' and password='"+password+"'";
	         	rs = stmt.executeQuery(query);
	         	 while (rs.next()) {
	         		 count=rs.getInt(1);
	         	 }
	         		 if(count!=0){
	         			stmt1=conn.createStatement();
	         			String query1 = "select * from user where email='"+email+"' and password='"+password+"'";
	         			rs1 = stmt1.executeQuery(query1);
	                	 while (rs1.next()) {
	                		 
	                		 id=rs1.getInt("id");
	                		 email=rs1.getString("email");
	                		 password=rs1.getString("password");
	                		 authkey=rs1.getString("auth_key");
	                		 users.setId(id);
	                		 users.setEmail(email);
	                		 users.setPassword(password);
	                		 users.setAuthkey(authkey);
	         		 
	         		 status=true;
	         		 
	                	 }
	         		 }else{
	         			 status=false;
	         		 }
	    			conn.close();

	         } catch (Exception e) {
	             e.printStackTrace();
	         }finally
	         {
	        	 try {
	        	         if (conn != null)
	        	      	conn.close();
	        	      } catch (SQLException ignore) {} // no point handling

	        	      try {
	        	         if (stmt != null)
	        	             stmt.close();
	        	      } catch (SQLException ignore) {} // no point handling

	        	   try {
	        	         if (stmt1 != null)
	        	        	 stmt1.close();
	        	      } catch (SQLException ignore) {} // no point handling
	        	 }
	   	  
	   	  
	     return status; 
	   }
	public int logTimingDetails(int id,String logintime){
		int status1=0;
		Connection conn=DbConnection.getInstance().getConnection();
		PreparedStatement  ps1=null;
//		logger.info("enter in function");
	    
	     try{
//	    	 logger.info("enter in try");
	         ps1=conn.prepareStatement("update admin_details set logintime='"+logintime+"' where id='"+id+"' ");
//	         logger.info(ps1);
	         status1 = ps1.executeUpdate();
//	         logger.info("status1.function=>>"+status1);
//	         logger.info("execute query done");
	         
				conn.close();
	    }
	     catch(Exception e){
//	         logger.info(e);
	     }finally
	     {
	    	 try {
	    	         if (conn != null)
	    	      	conn.close();
	    	      } catch (SQLException ignore) {} // no point handling

	    	   try {
	    	         if (ps1 != null)
	    	      	ps1.close();
	    	      } catch (SQLException ignore) {} // no point handling
	    	 }
		
//		logger.info("out of try");
		return status1;
	}
	public ArrayList<notifications> getNotificationsForAdmin(){
		
		ArrayList<notifications> no=new ArrayList<>();
		
		Connection conn=null;
		ResultSet rs=null;
		Statement st=null;
		
		try {
			conn=DbConnection.getInstance().getConnection();
			st=conn.createStatement();
			rs=st.executeQuery("select * from notification");
			while(rs.next()) {
				no.add(parseNotifications(rs));
			}
		} catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}finally {
			try {
				if(conn!=null) {
					conn.close();
				}if(st!=null) {
					st.close();
					
				}if(rs!=null) {
					rs.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			e2.printStackTrace();
			}
		}
		return no;
	}
public ArrayList<notifications> getNotificationsForUser(String authkey){
		
		ArrayList<notifications> no=new ArrayList<>();
		
		Connection conn=null;
		ResultSet rs=null;
		Statement st=null;
		
		try {
			conn=DbConnection.getInstance().getConnection();
			st=conn.createStatement();
			rs=st.executeQuery("select * from notification where authkey='"+authkey+"' order by id desc");
			while(rs.next()) {
				no.add(parseNotifications(rs));
			}
		} catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}finally {
			try {
				if(conn!=null) {
					conn.close();
				}if(st!=null) {
					st.close();
					
				}if(rs!=null) {
					rs.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			e2.printStackTrace();
			}
		}
		return no;
	}
	public notifications parseNotifications(ResultSet rs)throws Exception{
		
		notifications no=new notifications();

		no.setAuthkey(rs.getString("authkey"));
		no.setNotif(rs.getString("notif"));
		no.setSeen(rs.getString("seen"));
		no.setId(rs.getInt("id"));
		
		return no;
	}
	public ArrayList<user> fetchUsers(){
		
		ArrayList<user> u=new ArrayList<>();
		Connection conn=null;
		Statement st=null;
		ResultSet rs=null;
		
		try {
			conn=DbConnection.getInstance().getConnection();
			st=conn.createStatement();
			rs=st.executeQuery("select * from user");
			while(rs.next()) {
				u.add(parseUsers(rs));
			}
		} catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}finally {
			try {
				if(conn!=null) {
					conn.close();
				}if(st!=null) {
					st.close();
				}if(rs!=null) {
					rs.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			e2.printStackTrace();
			}
		}
		return u;
	}
	public user parseUsers(ResultSet rs)throws Exception{
		
		user u=new user();
		
		u.setAuthkey(rs.getString("auth_key"));
		u.setEmail(rs.getString("email"));
		u.setId(rs.getInt("id"));
		u.setName(rs.getString("name"));
		u.setPassword(rs.getString("password"));
		
		return u;
	}
}
