package Controller;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Dao {
	
	public static Connection getConnection () throws Exception {
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
	
	//함수
	
	// 환자조회
	public List<Dto> getPatientList(){
		List<Dto> dtoList = new ArrayList();
		String sql = "select p_no , p_name ,  \r\n"
				+ "	substr( p_birth , 1 , 4 ) || '년' || substr( p_birth , 5 , 2 ) || '월' || substr( p_birth , 7 , 2 ) || '일' as birth , "
				+ "	case "
				+ "		when p_gender = 'M' then '남'  "
				+ "		when p_gender = 'F' then '여'  "
				+ "	end as gender , "
				+ "	p_tel1 || '-' || p_tel2 || '-' || p_tel3 as telnum , "
				+ "	case "
				+ "		when p_city = '10' then '서울' "
				+ "		when p_city = '20' then '경기' "
				+ "		when p_city = '30' then '강원' "
				+ "		when p_city = '40' then '대구' "
				+ "	end as city "
				+ "	from tbl_patient_202004";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while ( rs.next() ) {
				dtoList.add(new Dto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
			}
		} catch (Exception e) { System.out.println("환자조회 예외 : "+e); }
		return dtoList;
	}
	
	//검사결과추가
	public boolean addResult( Dto dto ) {
		System.out.println("addResult실행");
		String sql = "insert into tbl_result_202004 values ( ? , ? , ? , ? , ? , ? )";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getP_no());
			ps.setString(2, dto.getT_code());
			ps.setString(3, dto.getT_sdate());
			ps.setString(4, dto.getT_status());
			ps.setString(5, dto.getT_ldate());
			ps.setString(6, dto.getT_result());
			ps.executeUpdate(); 
			System.out.println("true"); return true; 
		} catch (Exception e) {
			System.out.println("검사결과추가 예외 : "+e);
		}
		System.out.println("false");
		return false;
	}
}
