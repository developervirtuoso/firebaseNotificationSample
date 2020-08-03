package superAdmin.servlet;

import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;

public class sendMessageToTelegram {

	public static void main(String args[]) {
		try {
			HttpResponse<JsonNode> response2=Unirest.post("https://api.telegram.org/bot1205919730:AAEIbpoIamcRyznCmvrnNzKiSRXw9RlrxeM/sendMessage")
					
					.header("Content-Type", "application/json")
					.queryString("chat_id", "1092446133")
					.queryString("text", "/hii murari sir")
					.asJson();
			
			System.out.println("response is ===="+response2.getBody().toString());
		} catch (UnirestException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
