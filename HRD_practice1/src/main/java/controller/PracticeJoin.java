package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PracticeJoin
 */
@WebServlet("/practice/join")
public class PracticeJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PracticeJoin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int custno = Integer.parseInt(request.getParameter("custno")); 
		String custname = request.getParameter("custname"); 
		String phone = request.getParameter("phone");
		String address = request.getParameter("address"); 
		String joindate = request.getParameter("joindate"); 
		String grade = request.getParameter("grade");
		int city = Integer.parseInt(request.getParameter("city"));
		Dao dao = new Dao();
		boolean result = dao.updateMember(new MemberDto(custno, custname, phone, address, joindate, grade, city));
		if (result) {
			response.sendRedirect("/HRD_practice1/update.jsp?custno="+custno);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블렛");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int custno = Integer.parseInt(request.getParameter("custno")); 
		String custname = request.getParameter("custname"); 
		String phone = request.getParameter("phone");
		String address = request.getParameter("address"); 
		String joindate = request.getParameter("joindate"); 
		String grade = request.getParameter("grade");
		int city = Integer.parseInt(request.getParameter("city"));
		Dao dao = new Dao();
		boolean result = dao.join(new MemberDto(custno, custname, phone, address, joindate, grade, city));
		if (result) {
			response.sendRedirect("/HRD_practice1/join.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
