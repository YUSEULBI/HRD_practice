package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Dao {
	
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection
				("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		return con;
	}
	
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public Dao() {
		try {
			con = getConnection();
		} catch (Exception e) {
			System.out.println("연동실패 : "+e);
		}
	}
	
	// 함수
	
	// 학생목록
	public ArrayList<Dto> getStudentList(){
		ArrayList<Dto> dtoList = new ArrayList<Dto>();
		String sql = "select sno , sname ,  "
				+ "	case  "
				+ "		when sgender = 'M' then '남' "
				+ "		when sgender = 'F' then '여' "
				+ "	end as g , "
				+ "	sphone , saddress  "
				+ "	from student_tbl_03";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while ( rs.next()) {
				dtoList.add(new Dto(rs.getString(1), rs.getString(2), rs.getString(4), rs.getString(3), rs.getString(5)));
			}
		} catch (Exception e) { System.out.println("학생목록조회 예외 : "+e); }
		return dtoList;
	}
}
