package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Dao {
	public static Connection getConnection( ) throws Exception {
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
			System.out.println("연동실패");
		}
	}
	
	// 함수
	
	// 환자조회
	public List<Dto> getPatient(){
		List<Dto> dtoList = new ArrayList();
		String sql = "select "
				+ "	p_no , p_name , "
				+ "	substr( p_birth , 1 , 4 ) || '년' || substr( p_birth , 4 , 2 ) || '월' || substr( p_birth , 6 , 2 ) || '일' as birth , "
				+ "	case when p_gender = 'M' then '남' else '여' end as gender , "
				+ "	p_tel1 || '-' || p_tel2 || '-' || p_tel3 as tel , "
				+ "	case when p_city = '10' then '서울' when p_city = '20' then '경기' when p_city = '30' then '강원' when p_city = '40' then '대구' end as city "
				+ "	from tbl_patient_202004";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				dtoList.add(new Dto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
			}
		} catch (Exception e) {
			System.out.println("환자조회 예외 : "+e);
		} return dtoList;
	}
	
	//검사결과등록
	public boolean addTest( Dto dto ) {
		String sql = "insert into tbl_result_202004 values ( ? , ? , ? , ? , ? , ? )";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getP_no());
			ps.setString(2, dto.getT_code());
			ps.setString(3, dto.getT_sdate());
			ps.setString(4, dto.getT_status());
			ps.setString(5, dto.getT_ldate());
			ps.setString(6, dto.getT_result());
			ps.executeUpdate(); return true;
		} catch (Exception e) {
			System.out.println("검사결과등록 예외 : "+e);
		}return false;
	}
	
	//검사결과조회
	public List<Dto> getTestList (){
		List<Dto> dtoList = new ArrayList<>();
		String sql = "select  "
				+ "	p.p_no , p_name , t.t_name ,  r.t_sdate , "
				+ "	case when r.t_status = '1' then '검사중' else '검사완료' end status , "
				+ "	t_ldate , "
				+ "	case when t_result = 'X' then '미입력' when t_result = 'P' then '양성' else '음성' end as result  "
				+ "	from tbl_patient_202004 p , tbl_lab_test_202004 t , tbl_result_202004 r "
				+ "	where p.p_no = r.p_no and t.t_code = r.t_code  "
				+ "	order by p.p_no asc";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while ( rs.next() ) {
				dtoList.add(new Dto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5), rs.getString(6), rs.getString(7)));
			}
		} catch (Exception e) {
			System.out.println("검사결과조회 예외 : "+e);
		}return dtoList;
	}
	
	// 검사건수통계
	public List<Dto> getCount(){
		List<Dto> dtoList = new ArrayList<>();
		String sql = "select "
				+ "	p.p_city , "
				+ "	case when p.p_city = '10' then '서울' when p.p_city = '20' then '경기'  when p.p_city = '30' then '강원'  when p.p_city = '40' then '대구' else '알수없는지역코드' end as city , "
				+ "	count(*)  "
				+ "	from tbl_patient_202004 p , tbl_result_202004 r "
				+ "	where p.p_no = r.p_no "
				+ "	group by p.p_city order by to_number(p.p_city) asc";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				dtoList.add(new Dto(rs.getString(1), rs.getString(2), rs.getInt(3)));
			}
		} catch (Exception e) {
			System.out.println("검사건수통계 예외 : "+e);
		}return dtoList;
	}
}
