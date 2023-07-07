package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddResult
 */
@WebServlet("/add/result")
public class AddResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddResult() {
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
		System.out.println("서블릿실행");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String p_no = request.getParameter("p_no"); System.out.println("p_no : "+p_no);
		String t_code = request.getParameter("t_code"); System.out.println("t_code : "+t_code);
		String t_sdate = request.getParameter("t_sdate"); System.out.println("t_sdate : "+t_sdate);
		String t_status = request.getParameter("t_status"); System.out.println("t_status : "+t_status);
		String t_ldate = request.getParameter("t_ldate"); System.out.println("t_ldate : "+t_ldate);
		String t_result = request.getParameter("t_result"); System.out.println("t_result : "+t_result);
		
		boolean result = new Dao().addResult(new Dto(p_no, t_code, t_sdate, t_status, t_ldate, t_result, true));
		if ( result ) {
			response.sendRedirect("/HRD_practice4/index.jsp");
		}else {
			response.sendRedirect("/HRD_practice4/add.jsp");
		}
	}

}
