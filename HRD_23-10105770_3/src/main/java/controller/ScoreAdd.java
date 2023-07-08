package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ScoreAdd
 */
@WebServlet("/score/add")
public class ScoreAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScoreAdd() {
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
		String sno = request.getParameter("sno");
		int ekor = Integer.parseInt(request.getParameter("ekor"));
		int emath = Integer.parseInt(request.getParameter("emath"));
		int eeng = Integer.parseInt(request.getParameter("eeng"));
		int ehist = Integer.parseInt(request.getParameter("ehist"));
		boolean result = new Dao().addScore( new Dto(sno, ekor, emath, eeng, ehist));
		if ( result ) {
			response.sendRedirect("/HRD_23-10105770_3/index.jsp");
		}
		
	}

}
