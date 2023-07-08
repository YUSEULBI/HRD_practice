package controller;

import java.awt.Window.Type;
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
			con = getConnection(); System.out.println("연동성공");
		} catch (Exception e) {
			System.out.println("연동실패 : "+e);
		}
	}
	
	//  함수
	
	// 학생목록조회
	public List<Dto> getStudentList (){
		List<Dto> dtoList = new ArrayList();
		String sql = "select  "
				+ "	sno , sname , "
				+ "	substr( sno , 1 , 1 ) , "
				+ "	substr( sno , 2 , 2 ) , "
				+ "	substr( sno , 4 , 2 ) , "
				+ "	case when sgender = 'M' then '남' when sgender = 'F' then '여' end as gender , "
				+ "	sphone , saddress n"
				+ "	from student_tbl_03";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next() ) {
				dtoList.add(new Dto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));
			}
		} catch (Exception e) {
			System.out.println("학생조회 예외 : "+e);
		}return dtoList;
	}
	
	// 성적등록
	public boolean addScore( Dto dto ) {
		String sql = "insert into exam_tbl_03 values ( ? , ? , ? , ? , ? )";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getSno());
			ps.setInt(2, dto.getEkor());
			ps.setInt(3, dto.getEmath());
			ps.setInt(4, dto.getEeng());
			ps.setInt(5, dto.getEhist());
			ps.executeUpdate(); return true;
		} catch (Exception e) {
			System.out.println("성적등록 예외 : "+ e);
		}return false;
	}
	
	// 순위조회
	public List<Dto> getRank(){
		List<Dto> dtoList = new ArrayList();
		String sql = "select  "
				+ "	substr( s.sno , 1 , 1 ) , "
				+ "	substr( s.sno , 2 , 2 ) , "
				+ "	substr( s.sno , 4 , 2 ) , "
				+ "	s.sname , "
				+ "	case when e.ekor is null then 0 else e.ekor end as kor, "
				+ "	case when e.emath is null then 0 else e.emath end as math , "
				+ "	case when e.eeng is null then 0 else e.eeng end as eeng , "
				+ "	case when e.ehist is null then 0 else e.ehist end as hist , "
				+ "	case when e.ehist is null then 0 else ( e.ekor + e.emath + e.eeng + e.ehist ) end as sum , "
				+ "	case when e.ehist is null then 0 else ( e.ekor + e.emath + e.eeng + e.ehist )/4 end as avg   "
				+ "	from student_tbl_03 s full outer join exam_tbl_03 e on s.sno = e.sno "
				+ "	order by ( e.ekor + e.emath + e.eeng + e.ehist ) desc";
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while ( rs.next() ) {
				System.out.println("");
				dtoList.add(
						new Dto(
								rs.getString(4), rs.getString(1), rs.getString(2), rs.getString(3), 
								rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getDouble(10)
						)
				);
			}
		} catch (Exception e) {
			System.out.println("순위 예외 : "+e);
		}return dtoList;
	}
		
}
