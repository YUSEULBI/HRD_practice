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
	
	// 성적 등록
	public boolean addScore( Dto dto ) {
		String sql = "insert into exam_tbl_03 values( ? , ? , ? , ? , ? )";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getSno());
			ps.setInt(2, dto.getEkor());
			ps.setInt(3, dto.getEmath());
			ps.setInt(4, dto.getEeng());
			ps.setInt(5, dto.getEhist());
			int count = ps.executeUpdate();
			if ( count > 0 ) { return true; }
		} catch (Exception e) {
			System.out.println("성적등록 예외 : "+e);
		}return false;
	}
	
	// 성적 조회
	public ArrayList<Dto> getScoreList(){
		ArrayList<Dto> scoreList = new ArrayList();
		String sql = "select  "
				+ "	substr(s.sno,1,1) 학년 ,  "
				+ "	substr(s.sno,2,2) 반 ,  "
				+ "	substr(s.sno,4,2) 번호 ,  "
				+ "	s.sname, e.ekor, e.emath, e.eeng, e.ehist , "
				+ "	(e.ekor + e.emath + e.eeng + e.ehist) 합계 , "
				+ "	(e.ekor + e.emath + e.eeng + e.ehist)/4 평균 , "
				+ "	RANK() OVER ( ORDER BY (NVL(e.ekor,0) + NVL(e.emath,0) + NVL(e.eeng,0) + NVL(e.ehist,0) ) DESC ) 순위 "
				+ "from student_tbl_03 s full outer join exam_tbl_03 e on s.sno = e.sno "
				+ "ORDER BY (NVL(e.ekor,0) + NVL(e.emath,0) + NVL(e.eeng,0) + NVL(e.ehist,0) ) DESC";
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while ( rs.next() ) {
				scoreList.add(new Dto(rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(9), rs.getDouble(10), rs.getInt(11)));
			}
		} catch (Exception e) {
			System.out.println("성적조회 예외 : "+e);
		}
		return scoreList;
	}
}
