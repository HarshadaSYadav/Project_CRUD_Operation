# CRUD_Operation_for_Register_form Project

This web-based application allows users to perform CRUD (Create, Read, Update, Delete) operations on user records. Each record includes the user's name, roll number, address, and gender. It is built using JSP for frontend rendering and Java Servlets for backend logic, interacting with a MySQL database.

## Features

- **Create**: Add a new user record using a form.
- **Read**: Display user records in a table.
- **Update**: Update an existing user record by clicking the pencil icon.
- **Delete**: Delete a user record by clicking the trash icon.
- **View**: View details of a user record by clicking the eye icon.

## Technologies Used

- **Frontend**: JSP, CSS
- **Backend**: Java Servlets
- **Database**: MySQL
- **Server**: Apache Tomcat

## Prerequisites

- Java Development Kit (JDK) installed
- Apache Tomcat installed
- MySQL database installed and running
- A MySQL database and user set up

## Project Configuration

### 1. Clone the Repository

Clone the repository to your local machine using the following command:

```bash
git clone https://github.com/HarshadaSYadav/student_form.git

### 2. Import Project
- Import the project into your Java IDE (e.g., Eclipse, IntelliJ IDEA) after cloning it.

### 3. Configure Database Connection
- Update the database connection details (jdbc:mysql://localhost:3306/student_form, username, password) in the database.java file located in the src directory of the project.

### 4. Run the Application
- Deploy the project on the Apache Tomcat server from your IDE or manually copy the files to the Tomcat webapps directory.

### Database Setup
Create a database and table to store user records:
CREATE DATABASE student_form;

USE student_form;

CREATE TABLE info (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  NAME NVARCHAR(40),
  ROLL_NO NVARCHAR(30),
  ADDRESS NVARCHAR(90),
  GENDER NVARCHAR(20)
);

### Running the Application
- Start Apache Tomcat server.
- Access the application by navigating to http://localhost:8080/student_form in your web browser.

### License
This project is licensed under the MIT License - see the LICENSE file for details.

- Replace `https://github.com/HarshadaSYadav/student_form.git` with your actual GitHub repository URL. This `README.md` file now includes all the necessary sections for setting up and running your project.

