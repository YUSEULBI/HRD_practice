package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Dao {
	
		//DB연동
		public static Connection getConnection() throws Exception {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection
					("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			return con;
		}
		
		// 필드
		public Connection con;
		public PreparedStatement ps;
		public ResultSet rs;
		
		// 생성자
		public Dao() {
			try {
				con = getConnection(); System.out.println("연동성공");
			} catch (Exception e) {
				System.out.println("연동실패 예외"+e);
			}
		}
		
		// 함수
		
		public List<Dto> getList(){
			List<Dto> dList = new ArrayList();
			String sql="select m.M_NO , m.M_NAME , p.P_NAME ,  "
					+ "	case "
					+ "		when m.P_SCHOOL = 1 then '고졸'  "
					+ "		when m.P_SCHOOL = 2 then '학사'  "
					+ "		when m.P_SCHOOL = 3 then '석사'  "
					+ "		else '박사'  "
					+ "	end as school  ,  "
					+ "	m.M_JUMIN , m.M_CITY , p.P_TEL1 , p.P_TEL2 , p.P_TEL3  "
					+ "from tbl_member_202005 m , tbl_party_202005 p where m.P_CODE = p.P_CODE";
			try {
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				while ( rs.next() ) {
					dList.add(new Dto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9) ) );
				}
			} catch (Exception e) { System.out.println("후보조회 예외 : "+e); }
			return dList;
		}
		
		// 투표
		public boolean vote( Dto dto ) {
			//String sql = "insert into tbl_vote_202005 values ('59010110024', '권유권', '3', '1330', '제2투표장', 'Y');"
			String sql = "insert into tbl_vote_202005 values (?, ?, ?, ?, ?, ?)";
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, dto.getV_jumin());
				ps.setString(2, dto.getV_name());
				ps.setString(3, dto.getM_no());
				ps.setString(4, dto.getV_time());
				ps.setString(5, dto.getV_area());
				ps.setString(6, dto.getV_confirm());
				ps.executeUpdate();  return true;
			} catch (Exception e) {
				System.out.println("투표하기 예외 : "+e);
			}return false;
		}
		
		// 투표검수조회
		public List<Dto> getVoteConfirm(){
			List<Dto> dList = new ArrayList();
			String sql ="select V_NAME , V_JUMIN , M_NO , V_TIME , V_CONFIRM  "
					+ "from TBL_VOTE_202005 where V_AREA = '제1투표장' ";
			try {
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				while ( rs.next() ) {
					System.out.println(rs.getString(2));
					dList.add(new Dto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)) );
				}
			} catch (Exception e) {
				System.out.println("투표검수 예외: "+e);
			}
			System.out.println(dList.get(0).getV_jumin());
			return dList;
		}
		
		// 후보자등수
		public List<Dto> getRank(){
			List<Dto> dList = new ArrayList();
			String sql = "select m.M_NO , m.M_NAME , count(*) as countnum "
					+ "from TBL_MEMBER_202005 m , TBL_VOTE_202005 v  "
					+ "where m.M_NO = v.M_NO and v.V_CONFIRM = 'Y' group by m.M_NO , m.M_NAME order by countnum desc";
			try {
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				while( rs.next() ) {
					dList.add(new Dto(rs.getString(1), rs.getString(2), rs.getInt(3)));
				}
			} catch (Exception e) {
				System.out.println("후보자등수 예외 : "+e);
			}
			return dList;
		}
}
