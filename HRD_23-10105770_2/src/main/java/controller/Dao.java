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
			con = getConnection(); System.out.println("연동성공");
		} catch (Exception e) {
			System.out.println("연동실패 : "+e);
		} 
	}
	
	// 함수
	
	//후보조회
	public List<Dto> getMemberList(){
		List<Dto> dtoList = new ArrayList();
		String sql = "select m.M_NO , m.M_NAME , p.P_NAME , case when m.P_SCHOOL = '1' then '고졸' when m.P_SCHOOL = '2' then '학사' when m.P_SCHOOL = '3' then '석사' when m.P_SCHOOL = '4' then '박사'end as school , substr( m.M_JUMIN , 1 , 6 ) || '-' || substr( m.M_JUMIN , 7 , 7 ) as jumin , m.M_CITY ,	p.P_TEL1 || '-' || p.P_TEL2 || '-' || p.P_TEL3 from TBL_MEMBER_202005 m , TBL_PARTY_202005 p where m.P_CODE = p.P_CODE";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while ( rs.next() ) {
				dtoList.add(new Dto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
			}
		} catch (Exception e) {
			System.out.println("후보조히 예외 : "+e);
		}
		return dtoList;
	}
	
	//투표하기
	public boolean vote( Dto dto ) {
		String sql = "INSERT INTO TBL_VOTE_202005 VALUES( ? , ? , ? , ? ,? ,? )";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getV_jumin());
			ps.setString(2, dto.getV_name());
			ps.setString(3, dto.getM_no());
			ps.setString(4, dto.getV_time());
			ps.setString(5, dto.getV_area());
			ps.setString(6, dto.getV_confirm());
			ps.executeUpdate(); return true;
		} catch (Exception e) {
			System.out.println("투표하기 예외 : "+e);
		}return false;
	}
	
	// 투표검수조히
	public List<Dto> getVoteList(){
		List<Dto> dtoList = new ArrayList();
		String sql = "select V_NAME ,  "
				+ "	'19' || substr(V_JUMIN,1,2) || '년' || substr( V_JUMIN , 3 , 2 ) || '월' || substr( V_JUMIN , 5 , 2 ) || '일생' as birth , "
				+ "	substr(V_JUMIN,1,2) ,  "
				+ "	case when substr( V_JUMIN , 7 , 1 ) = '1' then '남' else '여' end as gender , "
				+ "	M_NO ,  "
				+ "	substr( V_TIME , 1 ,2 ) || ':' || substr( V_TIME , 3 , 2 ) as vtime , "
				+ "	case when V_CONFIRM  = 'Y' then '확인' else '미확인' end as confirm "
				+ "	from tbl_vote_202005 where V_AREA = '제1투표장'";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()){
				dtoList.add(new Dto(rs.getString(5), rs.getString(3), rs.getString(1), rs.getString(6), rs.getString(7), rs.getString(2), rs.getString(4), true));
			}
		} catch (Exception e) {
			System.out.println("투표검수조회 : "+e);
		}return dtoList;
	}
	
	// 후보자등수
	public List<Dto> getRank(){
		List<Dto> dtoList = new ArrayList();
		String sql ="select 	 "
				+ "	m.M_NO , m.M_NAME , "
				+ "	count(*) as count "
				+ "	from tbl_vote_202005 v , TBL_MEMBER_202005 m  "
				+ "	where v.M_NO = m.M_NO and v.V_CONFIRM = 'Y' "
				+ "	group by m.M_NO , m.M_NAME "
				+ "	order by count(*) desc";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()){
				dtoList.add(new Dto(rs.getString(1), rs.getString(2), rs.getInt(3)));
			}
		} catch (Exception e) {
			System.out.println("투표검수조회 : "+e);
		}return dtoList;
	}
}
