package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
	
	// 회원목록출력
	public ArrayList<MemberDto> getMemberList(){
		ArrayList<MemberDto> memArrayList = new ArrayList();
		String sql = "select custno , custname , phone ,  address , joindate , "
				+ "	case "
				+ "		when grade = 'A' then 'VIP' "
				+ "		when grade = 'B' then '일반'  "
				+ "		else '직원'  "
				+ "	end as g, "
				+ "	city from member_tbl_02";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while( rs.next() ) {
				memArrayList.add(new MemberDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7)));
			}
		} catch (Exception e) {
			System.out.println("회원목록출력 예외 "+e);
		}
		return memArrayList;
	}
	
	// 특정회원출력
	public MemberDto getMember( int custno ) {
		String sql = "select * from member_tbl_02 where custno = "+custno;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if ( rs.next() ) {
				return new MemberDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
			}
		} catch (Exception e) { System.out.println("특정회원출력"+e); }
		return null;
	}
	
	// 회원수정
	public boolean updateMember( MemberDto dto ) {
		String sql = "update member_tbl_02 set custno = ? , custname = ? , phone = ? , address = ? , joindate = ? , grade = ? , city = ? where custno = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getCustno());
			ps.setString(2, dto.getCustname());
			ps.setString(3, dto.getPhone());
			ps.setString(4, dto.getAddress());
			ps.setString(5, dto.getJoindate());
			ps.setString(6, dto.getGrade());
			ps.setInt(7, dto.getCity());
			ps.setInt(8, dto.getCustno());
			ps.executeUpdate();
			return true;
		} catch (Exception e) { System.out.println("회원수정 예외 : " + e); }
		return false;
	}
	
	public ArrayList<MemberDto> getSales(){
		ArrayList<MemberDto> memberDtos = new ArrayList();
		String sql = "select member.custno, member.custname,  "
				+ "	case "
				+ "		when grade = 'A' then 'VIP' "
				+ "		when grade = 'B' then '일반'  "
				+ "		else '직원'  "
				+ "	end as g, "
				+ "	sum(money.price) as summoney "
				+ "from member_tbl_02 member, money_tbl_02 money "
				+ "where member.custno = money.custno "
				+ "group by member.custno, member.custname, member.grade order by summoney desc";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while( rs.next() ) {
				memberDtos.add(new MemberDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
			}
		} catch (Exception e) { System.out.println("매출조회 예외"); }
		return memberDtos;
	}
}
