
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;



public class GreetingServletrz extends HttpServlet
{
	

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("name");
		out.println("<HTML>");
		out.println("<BODY>");
		out.println("HELLO."+username);
		out.println("</BODY>");
		out.println("</HTML>");
	}

	public String getServletInfo()
	{
		return "A servlet that greets the user";
	}

}
