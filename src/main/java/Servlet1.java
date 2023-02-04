

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 * Servlet implementation class Servlet1
 */
@WebServlet("/Servlet1")
public class Servlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String vehicleno=request.getParameter("vehicleno");
		out.print("<h1>Your Booked Vehicle:</h1>");
		out.print("<table border='1'><tr><th>vehicle_type</th><th>vehicle_name</th><th>vehicle_price</th><th>vehicle_no</th></tr>");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/major","root","Janu@8080");
			String q="select * from addvehicle where vehicle_no=?";
			PreparedStatement pst=con.prepareStatement(q);
			pst.setString(1, vehicleno);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				out.print("<tr><td>");
				out.println(rs.getString(1));
				out.print("</td>");
				out.print("<td>");
				out.println(rs.getString(2));
				out.print("</td>");
				out.print("<td>");
				out.println(rs.getDouble(3));
				out.print("</td>");
				out.print("<td>");
				out.println(rs.getString(4));
				out.print("</td>");
				out.print("</tr>");
				String query2 = "INSERT INTO book(vehicle_type,vehicle_name,vehicle_price,vehicle_no) SELECT * from addvehicle where vehicle_no=?";
				pst = con.prepareStatement(query2);
				pst.setString(1, vehicleno);
				pst.executeUpdate();
			}
		
			
			
		}catch(Exception e) {
			System.out.println(e);
		}
		out.print("</table>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
