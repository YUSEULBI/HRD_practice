package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestAdd
 */
@WebServlet("/test/add")
public class TestAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String p_no = request.getParameter("p_no");
		String t_code = request.getParameter("t_code");
		String t_sdate = request.getParameter("t_sdate");
		String t_status = request.getParameter("t_status");
		String t_ldate = request.getParameter("t_ldate");
		String t_result = request.getParameter("t_result");
		
		boolean result = new Dao().addTest( new Dto(p_no, t_code, t_sdate, t_status, t_ldate, t_result, true));
		
		if ( result ) {
			response.sendRedirect("/HRD_23-10105770_4/index.jsp");
		}
	}

}
