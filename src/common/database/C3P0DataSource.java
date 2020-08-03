package common.database;

import java.beans.PropertyVetoException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3P0DataSource {
	private static C3P0DataSource dataSource;
	   private ComboPooledDataSource comboPooledDataSource;
	   

	   private C3P0DataSource() {
	     /* try {
	         
	      	  comboPooledDataSource = new ComboPooledDataSource();
	         comboPooledDataSource
	            .setDriverClass("com.mysql.jdbc.Driver");
	         
	        
	      
	        comboPooledDataSource
	         .setJdbcUrl("jdbc:mysql://myhoro.cxezv9drtmnx.us-east-2.rds.amazonaws.com:3306/astrologer");
	      comboPooledDataSource.setUser("MyHoro");
	      comboPooledDataSource.setPassword("jaihanuman");
	         
	comboPooledDataSource
	            .setJdbcUrl("jdbc:mysql://localhost:3306/astrologer");
	         comboPooledDataSource.setUser("root");
	         comboPooledDataSource.setPassword("");
	         
	       comboPooledDataSource
	         .setJdbcUrl("jdbc:mysql://freeparking.cduvlaoopimk.ap-south-1.rds.amazonaws.com:3306/equipment_manage_copy");
	      comboPooledDataSource.setUser("murari");
	      comboPooledDataSource.setPassword("jaihanuman");
	            
	      comboPooledDataSource.setMinPoolSize(2);
	      comboPooledDataSource.setAcquireIncrement(5);
	      comboPooledDataSource.setMaxPoolSize(60);
	      comboPooledDataSource.setMaxStatements(150);
	      comboPooledDataSource.setIdleConnectionTestPeriod(30);        
	      comboPooledDataSource.setTestConnectionOnCheckout(true);
	      comboPooledDataSource.setPreferredTestQuery("SELECT 1");     
	      
	      comboPooledDataSource.setMinPoolSize(20);
	      comboPooledDataSource.setAcquireIncrement(50);
	      comboPooledDataSource.setMaxPoolSize(600);
	      comboPooledDataSource.setMaxStatements(1500);
	      comboPooledDataSource.setIdleConnectionTestPeriod(300);        
	      comboPooledDataSource.setTestConnectionOnCheckout(true);
	      comboPooledDataSource.setPreferredTestQuery("SELECT 1");     
	      
	      
	         comboPooledDataSource.setMinPoolSize(2);
	         comboPooledDataSource.setAcquireIncrement(5);
	         comboPooledDataSource.setMaxPoolSize(20);
	         comboPooledDataSource.setMaxStatements(50);
	         comboPooledDataSource.setIdleConnectionTestPeriod(300);        
	         comboPooledDataSource.setTestConnectionOnCheckout(true);
	         comboPooledDataSource.setPreferredTestQuery("SELECT 1");       
	               
	         
	      }
	      catch (PropertyVetoException ex1) {
	         ex1.printStackTrace();
	      }*/
	   }

	   public static C3P0DataSource getInstance() {
	      if (dataSource == null)
	         dataSource = new C3P0DataSource();
	      return dataSource;
	   }

	   public Connection getConnection() {
		   Connection dbconn = null;
	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	           // dbconn = DriverManager.getConnection("jdbc:mysql://myhoro.cxezv9drtmnx.us-east-2.rds.amazonaws.com:3306/astrologer?autoReconnect=true", "MyHoro", "jaihanuman");
	    //dbconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/astrologer?autoReconnect=true", "MyHoro", "jaihanuman");
	    dbconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/firebase?autoReconnect=true", "root", "");
	          //dbconn = DriverManager.getConnection("jdbc:mysql://myhoro.cxezv9drtmnx.us-east-2.rds.amazonaws.com:3306/astrologer?autoReconnect=true", "MyHoro", "jaihanuman");
// dbconn = DriverManager.getConnection("jdbc:mysql://206.189.138.4:3306/astrologer?autoReconnect=true", "MyHoro", "jaihanuman");

	        } catch (Exception ex) {
	            System.out.println("Exception in DBConnection java file of fun" + ex);
	        }
	        return dbconn;
		   
		/*
		 * Connection con = null; try { con = comboPooledDataSource.getConnection(); }
		 * catch (SQLException e) { e.printStackTrace(); } return con;
		 */
	   }
	}
