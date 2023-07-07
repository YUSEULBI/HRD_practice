package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Dao {
	
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
		try {
			con = getConnection();
		} catch (Exception e) {
			System.out.println("연동실패 : "+e);
		}
	}
	
	// 함수
	
	// 마지막 회원번호+1 가져오기
	public int getMemberLastNo() {
		String sql = "select max(custno)+1 from member_tbl_02";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if ( rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("마지막회원번호가져오기 예외 : "+e);
		}return 0;
	}
	
	// 회원추가
	public boolean addMember( Dto dto ) {
		String sql = "insert into member_tbl_02 values( ? , ? , ? , ? , ? , ? , ? )";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getCustno());
			ps.setString(2, dto.getCustname());
			ps.setString(3, dto.getPhone());
			ps.setString(4, dto.getAddress());
			ps.setString(5, dto.getJoindate());
			ps.setString(6, dto.getGrade());
			ps.setString(7, dto.getCity());
			ps.executeUpdate(); return true;
		} catch (Exception e) {
			System.out.println("회원추가 예외 : "+e);
		}return false;
	}
	
	// 회원조회
	public List<Dto> getMemberList(){
		List<Dto> dtoList = new ArrayList();
		String sql = "select custno , custname , phone , address , joindate ,  "
				+ "	case when grade = 'A' then 'VIP' when grade = 'B' then '일반' when grade = 'C' then '직원' "
				+ "	end as sgrade , city  "
				+ "	from member_tbl_02";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while ( rs.next() ) {
				dtoList.add(new Dto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
			}
		} catch (Exception e) {
			System.out.println("회원조회 예외 : "+e);
		} 
		return dtoList;
	}
	
	// 회원 1명 조회
	public Dto getMemberOne( int custno ) {
		String sql = "select * from member_tbl_02 where custno = "+custno;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if ( rs.next() ) {
				return new Dto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
			}
		} catch (Exception e) {
			System.out.println("회원1명조회 예외 : "+e);
		}return null;
	}
	
	// 회원수정
	public boolean updateMember( Dto dto ) {
		String sql = "update member_tbl_02 set  "
				+ "	custno = ? , custname = ? , phone = ? , address = ? , joindate = ? , grade = ? , city = ? "
				+ "	where custno = ? ";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getCustno());
			ps.setString(2, dto.getCustname());
			ps.setString(3, dto.getPhone());
			ps.setString(4, dto.getAddress());
			ps.setString(5, dto.getJoindate());
			ps.setString(6, dto.getGrade());
			ps.setString(7, dto.getCity());
			ps.setInt(8, dto.getCustno());
			ps.executeUpdate(); return true;
		} catch (Exception e) {
			System.out.println("회원수정 예외 : "+e);
		}return false;
	}
	
	public List<Dto> getSales(){
		List<Dto> dtoList = new ArrayList<Dto>();
		String sql = "select mm.custno , mm.custname , "
				+ "	case when mm.grade = 'A' then 'VIP' when mm.grade = 'B' then '일반' when mm.grade = 'C' then '직원' end as gg , "
				+ "	 sum( mo.price) as pp "
				+ "	from member_tbl_02 mm , money_tbl_02 mo where mm.custno = mo.custno  "
				+ "	group by mm.custno , mm.custname ,\r\n"
				+ "	case when mm.grade = 'A' then 'VIP' when mm.grade = 'B' then '일반' when mm.grade = 'C' then '직원' end "
				+ "	order by pp desc";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				dtoList.add(new Dto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
			}
		} catch (Exception e) {
			System.out.println("매출 예외 : "+e);
		}return dtoList;
	}
}	
