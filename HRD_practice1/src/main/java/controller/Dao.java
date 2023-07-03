package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Dao {
	
	// DB연동
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection
				("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		return con;
	}
	
	public Connection con;
	public PreparedStatement ps;
	public ResultSet rs;
	
	
	public Dao() {
		try { con = getConnection(); 
		} catch (Exception e) { System.out.println("db연동 예외"); }
	}
	
	
	
	// 함수
	
	// 마지막 번호 가져오기
	public int getLastNo() {
		String sql = "select max(custno) from member_tbl_02";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if ( rs.next() ) {
				return rs.getInt(1);
			}
		} catch (Exception e) { System.out.println(""); }
		return 0;
	}
	
	// 회원등록
	public boolean join( MemberDto dto ) {
		System.out.println(dto);
		String sql = "insert into member_tbl_02 (custno,custname,phone,address,joindate,grade,city) "
				+ "values(?,?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getCustno());
			ps.setString(2, dto.getCustname());
			ps.setString(3, dto.getPhone());
			ps.setString(4, dto.getAddress());
			ps.setString(5, dto.getJoindate());
			ps.setString(6, dto.getGrade());
			ps.setInt(7, dto.getCity());
			ps.executeUpdate(); return true;
		} catch (Exception e) { System.out.println("회원등록 예외 "+e); }
		return false;
	}
}