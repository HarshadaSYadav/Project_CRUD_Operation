import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

/**
 * Servlet implementation class register
 */
public class register extends HttpServlet {
	Connection cn = null;
	 Statement st = null;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	   HttpSession session = req.getSession();
	   PrintWriter out = resp.getWriter();
	   Database db = new Database();
	   String result = db.Connectdb();
	   out.println(result);
		   
	   String name= req.getParameter("name");
	   String  address= req.getParameter("address");
	   String rollNo= req.getParameter("rollNo");
	   String gender = req.getParameter("gender");
	   String event = req.getParameter("submit");
	   String ROLL_NO = req.getParameter("ROLL_NO");
	   String takeaction= req.getParameter("takeaction");
	   String rno= req.getParameter("rno");
	   
	   
	   out.println(name);
	   out.println(address);
	   out.println(rollNo);
	   out.println(gender);
		
		if(event.equals("Submit")) 
		{
		       
	        if(name.equals("") || address.equals("") || rollNo.equals("") || gender.equals("") ) 
	        {
	        	resp.setContentType("text/html");
	        	out.println("<script type=\"text/javascript\">");
	        	out.println("alert('fill the required fields')");
	        	out.println("location='index.jsp'");
	        	out.println("</script>");
	          
	        }
	        else
	        {
	        	if(takeaction.equals("ADD"))
	        	{
	        	
	        		try
	        		{
	        			String sql= "insert into register(NAME, ADDRESS, ROLL_NO, GENDER) values ('"+name+"','"+address+"','"+rollNo+"','"+gender+"')";
	        			String insert = db.Insert(sql);
	        			out.println(insert);
	           
	        			resp.setContentType("text/html");
			            out.println("<script type=\"text/javascript\">");
			            out.println("alert('Added Successfully')");
				        out.println("location='index.jsp'");
				        out.println("</script>");
	   
			        }
			        catch(Exception ex)
			        {
			        	out.println(ex.toString());
			        }
	        	}
	        	else if(takeaction.equals("UPDATE"))
	        	{
	        		try
	  	          	{
			  	          String sql= "update register set NAME='"+name+"',ADDRESS='"+address+"',ROLL_NO='"+rollNo+"',GENDER='"+gender+"' where ROLL_NO='"+rollNo+"' ";
			  	          String update = db.update(sql);
			  	          out.println(update);
	  	             
			  	          resp.setContentType("text/html");
	  	                  out.println("<script type=\"text/javascript\">");
	  	                  out.println("alert('Updated Successfully!')");
	  	                  out.println("location='index.jsp'");  
	  	                  out.println("</script>"); 
	  	          	}
	  	          	catch(Exception ex)
	        		{
	  	          		out.println(ex.toString());
	        		}
	        		
	        	}
	        	else if(takeaction.equals("DELETE"))
	        	{
	        		try
	  	          	{
	        			  String sql ="delete from register where ROLL_NO='"+rno+"'";
	       	              String delete = db.delete(sql);
	       	              out.println(delete);
	  	             
			  	          resp.setContentType("text/html");
	  	                  out.println("<script type=\"text/javascript\">");
	  	                  out.println("alert('Deleted Successfully!')");
	  	                  out.println("location='index.jsp'");  
	  	                  out.println("</script>"); 
	  	          	}
	  	          	catch(Exception ex)
	        		{
	  	          		out.println(ex.toString());
	        		}
	        		
	        	}
			}
	     }	 
	}
}