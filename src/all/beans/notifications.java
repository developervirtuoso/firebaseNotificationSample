package all.beans;

public class notifications {
	
	private int id;
	private String notif;
	private String authkey;
	private String seen;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNotif() {
		return notif;
	}
	public void setNotif(String notif) {
		this.notif = notif;
	}
	public String getAuthkey() {
		return authkey;
	}
	public void setAuthkey(String authkey) {
		this.authkey = authkey;
	}
	public String getSeen() {
		return seen;
	}
	public void setSeen(String seen) {
		this.seen = seen;
	}
}
