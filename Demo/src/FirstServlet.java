

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public FirstServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user=request.getParameter("user");
		String pass=request.getParameter("pass");
		if(user.equalsIgnoreCase("k") && pass.equals("d")){
			RequestDispatcher rd=request.getRequestDispatcher("second.jsp") ;
			rd.forward(request, response);
			
		}
		else{
			
		}
//		L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png',{
//       	 attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
//       	 maxZoom:18
//       	}).addTo( mymap );
	}

}
