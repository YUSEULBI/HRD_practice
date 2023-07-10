package controller;

public class Dto {
	public String sno;
	public String sname;
	public String sgrade;
	public String sclass;
	public String snumber;
	public String sgender;
	public String sphone;
	public String saddress;
	
	// 성적등록 추가 필드
	public int ekor;
	public int emath;
	public int eeng;
	public int ehist;
	
	// 순위 추가 필드
	public int sum;
	public double avg;
	public int rank;
	
	
	public Dto() {	}

	// 핛생조회 생성자
	public Dto(String sno, String sname, String sgrade, String sclass, String snumber, String sgender, String sphone,
			String saddress) {
		super();
		this.sno = sno;
		this.sname = sname;
		this.sgrade = sgrade;
		this.sclass = sclass;
		this.snumber = snumber;
		this.sgender = sgender;
		this.sphone = sphone;
		this.saddress = saddress;
	}
	
	
	// 성적등록 생성자
	public Dto(String sno, int ekor, int emath, int eeng, int ehist) {
		super();
		this.sno = sno;
		this.ekor = ekor;
		this.emath = emath;
		this.eeng = eeng;
		this.ehist = ehist;
	}



	
	//순위 생성자
	public Dto(String sname, String sgrade, String sclass, String snumber, int ekor, int emath, int eeng, int ehist,
			int sum, double avg) {
		super();
		this.sname = sname;
		this.sgrade = sgrade;
		this.sclass = sclass;
		this.snumber = snumber;
		this.ekor = ekor;
		this.emath = emath;
		this.eeng = eeng;
		this.ehist = ehist;
		this.sum = sum;
		this.avg = avg;
	}

	//순위 생성자2
	public Dto(String sname, String sgrade, String sclass, String snumber, int ekor, int emath, int eeng, int ehist,
			int sum, double avg, int rank) {
		super();
		this.sname = sname;
		this.sgrade = sgrade;
		this.sclass = sclass;
		this.snumber = snumber;
		this.ekor = ekor;
		this.emath = emath;
		this.eeng = eeng;
		this.ehist = ehist;
		this.sum = sum;
		this.avg = avg;
		this.rank = rank;
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

	public String getSgrade() {
		return sgrade;
	}

	public void setSgrade(String sgrade) {
		this.sgrade = sgrade;
	}

	public String getSclass() {
		return sclass;
	}

	public void setSclass(String sclass) {
		this.sclass = sclass;
	}

	public String getSnumber() {
		return snumber;
	}

	public void setSnumber(String snumber) {
		this.snumber = snumber;
	}

	public String getSgender() {
		return sgender;
	}

	public void setSgender(String sgender) {
		this.sgender = sgender;
	}

	public String getSphone() {
		return sphone;
	}

	public void setSphone(String sphone) {
		this.sphone = sphone;
	}

	public String getSaddress() {
		return saddress;
	}

	public void setSaddress(String saddress) {
		this.saddress = saddress;
	}

	public int getEkor() {
		return ekor;
	}

	public void setEkor(int ekor) {
		this.ekor = ekor;
	}

	public int getEmath() {
		return emath;
	}

	public void setEmath(int emath) {
		this.emath = emath;
	}

	public int getEeng() {
		return eeng;
	}

	public void setEeng(int eeng) {
		this.eeng = eeng;
	}

	public int getEhist() {
		return ehist;
	}

	public void setEhist(int ehist) {
		this.ehist = ehist;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}
	
	

	
	
	
}
