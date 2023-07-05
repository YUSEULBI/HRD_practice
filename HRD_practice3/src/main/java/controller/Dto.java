package controller;

public class Dto {
	
	private String sno; 
	private String sname;
	private String sphone; 
	private String sgender; 
	private String saddress;
	
	//성적입력
	private int ekor;
	private int emath;
	private int eeng;
	private int ehist;
	
	public Dto() { 	}

	//학생조회 생성자
	public Dto(String sno, String sname, String sphone, String sgender, String saddress) {
		super();
		this.sno = sno;
		this.sname = sname;
		this.sphone = sphone;
		this.sgender = sgender;
		this.saddress = saddress;
	}
	
	//성적입력 생성자
	public Dto(String sno, int ekor, int emath, int eeng, int ehist) {
		super();
		this.sno = sno;
		this.ekor = ekor;
		this.emath = emath;
		this.eeng = eeng;
		this.ehist = ehist;
	}

	@Override
	public String toString() {
		return "Dto [sno=" + sno + ", sname=" + sname + ", sphone=" + sphone + ", sgender=" + sgender + ", saddress="
				+ saddress + "]";
	}



	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSphone() {
		return sphone;
	}

	public void setSphone(String sphone) {
		this.sphone = sphone;
	}

	public String getSgender() {
		return sgender;
	}

	public void setSgender(String sgender) {
		this.sgender = sgender;
	}

	public String getSaddress() {
		return saddress;
	}

	public void setSaddress(String saddress) {
		this.saddress = saddress;
	}
	
	
}
