<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ page import= "java.io.*" %>
<%@ page import= "java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css">
	<link rel="stylesheet" href="css/font-awesome-4.7.0/css/font-awesome.css" type="text/css"> 
	<link rel="stylesheet" href="css/font-awesome-4.7.0/css/font-awesome.min.css" type="text/css">
    <title>Form Submission and Display</title>
    <style type="text/css">
    <%@ include file="css/style.css" %>
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <form name="register" action="register" method="post">
            	<input type="hidden" id="takeaction" name="takeaction" value="ADD" >
            	<input type="hidden" id="rno" name="rno" >
            	
            	
                <h2>User Information</h2>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address">
                <label for="rollNo">Roll No:</label>
                <input type="text" id="rollNumber" name="rollNo">
                <label for="gender">Gender:</label>
                
                <select id="gender" name="gender" required>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select>
                
                <button type="submit" value="Submit" name="submit">Submit</button>
           </form>
        </div>
        <div class="table-container">
            <h2>Submitted Entries</h2>
            <table id="entriesTable">
                <thead>
                <tr>
                       <th>Name</th>
                        <th>Address</th>
                        <th>Roll No</th>
                        <th>Gender</th>
                        <th>Actions</th>
                </tr>
                </thead>
                                
                    <%
                    
            int a = 0;        
                    
			Connection cn = null;
			Statement st = null;
			Class.forName("com.mysql.jdbc.Driver");
	        cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_form","root","root");
	        String sql = "select * from register";
	        st=cn.createStatement();
	        ResultSet rs=st.executeQuery(sql);
			
	        while(rs.next())
	        {
	        	a++;
		%>
		 
         <tr>         
    	  
			<td> <%= rs.getString("NAME") %>     </td>
			<td> <%= rs.getString("ADDRESS") %>  </td>
			<td> <%= rs.getString("ROLL_NO") %>  </td>
			<td> <%= rs.getString("GENDER") %>   </td>
			
			<td>
				<button class="view-button" 	onclick="populateFields1('<%= rs.getString("NAME") %>','<%= rs.getString("ADDRESS") %>','<%= rs.getString("ROLL_NO") %>', '<%= rs.getString("GENDER") %>') "> <i class="fa fa-eye icon-spacing" aria-hidden="true"></i> </button>
				<button class="Update-button"  	onclick="populateFields ('<%= rs.getString("NAME") %>','<%= rs.getString("ADDRESS") %>','<%= rs.getString("ROLL_NO") %>', '<%= rs.getString("GENDER") %>') "> <i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
				<button class="delete-button" 	onclick="deleteRecord('<%= rs.getString("ROLL_NO") %>')"> <i class="fa fa-trash" aria-hidden="true"></i></button> 
			</td> 
		</tr>
		 
                        <% } %>
                    
            </table>
        </div>
    </div>
</body>

<script type="text/javascript">
	
function populateFields(name, address, rollNo, gender) 
{
	
    document.getElementById('name').value = name;
    document.getElementById('address').value = address;
    document.getElementById('rollNumber').value = rollNo;
    document.getElementById('gender').value = gender;
    
    document.getElementById('name').disabled = false;
    document.getElementById('address').disabled = false;
    document.getElementById('rollNumber').disabled = false;
    document.getElementById('gender').disabled = false;
    
    document.getElementById('takeaction').value = "UPDATE";
}

function populateFields1(name, address, rollNo, gender) 
{
	
    document.getElementById('name').value = name;
    document.getElementById('address').value = address;
    document.getElementById('rollNumber').value = rollNo;
    document.getElementById('gender').value = gender;
    
    document.getElementById('name').disabled = true;
    document.getElementById('address').disabled = true;
    document.getElementById('rollNumber').disabled = true;
    document.getElementById('gender').disabled = true;
}

function populateFields2(name, address, rollNo, gender) 
{
	
    document.getElementById('rno').value = ROLL_NO;
    document.getElementById('takeaction').value = "DELETE";
}

</script>


</html>