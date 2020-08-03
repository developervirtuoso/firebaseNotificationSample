package superAdmin.servlet;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class timee {
public String getServerDateTime(){
		
		Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
        String server_datetime = String.valueOf(sdf.format(cal.getTime()));
        System.out.println("server_datetime=>>"+server_datetime);
        
		
		 cal.add(Calendar.HOUR, +5); cal.add(Calendar.MINUTE, 30);
		  cal.add(Calendar.SECOND, 00);
		 
        server_datetime = String.valueOf(sdf.format(cal.getTime()));
        System.out.println("server_datetime=>>"+server_datetime);
        
		return server_datetime;
	}
	public static void main(String args[]) {
		timee t=new timee();
		t.getServerDateTime();
				
	}
}
