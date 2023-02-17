<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.IOException" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>TFMS - All Trainers Details</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Favicons -->
    <link href="assets/img/favicon1.png" rel="icon" />

    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
      rel="stylesheet"
    />

    <!-- Vendor CSS Files -->
    <link
      href="assets/vendor/bootstrap/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
      rel="stylesheet"
    />
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />

    <script
      src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
      integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
      crossorigin="anonymous"
    ></script>

    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
      integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
      crossorigin="anonymous"
    ></script>

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet" />

    <!-- Table -->
    <link
      rel="Stylesheet"
      href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"
    />
    <script
      type="text/javascript"
      src="https://code.jquery.com/jquery-1.12.3.js"
    ></script>
    <script
      type="text/javascript"
      src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"
    ></script>
    <!-- <script
      src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
      integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
      crossorigin="anonymous"
    ></script> -->

    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
      integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
      crossorigin="anonymous"
    ></script>
  </head>

  <body>
    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top">
      <div class="container d-flex align-items-center">
        <h1 class="logo me-auto"><a href="admin.jsp">TFMS</a></h1>

        <nav id="navbar" class="navbar order-last order-lg-0">
          <ul>
            <li><a class="active" href="admin.jsp">Home</a></li>
            <li class="dropdown">
              <a href="#"
                ><span>Operations</span> <i class="bi bi-chevron-down"></i
              ></a>
              <ul>
                <li><a href="show.jsp">Show All Trainer Details</a></li>
                <li><a href="add.jsp">Add Trainer</a></li>
              </ul>
            </li>
          </ul>
          <i class="bi bi-list mobile-nav-toggle"></i>
        </nav>
        <!-- .navbar -->

        <a href="login.jsp" class="get-started-btn">Logout</a>
      </div>
    </header>
    <!-- End Header -->

    <main id="main">
      <!-- ======= Breadcrumbs ======= -->
      <div class="breadcrumbs" data-aos="fade-in">
        <div class="container">
          <h2>All Trainers Details</h2>
        </div>
      </div>
      <!-- End Breadcrumbs -->

      <div class="container mt-5 px-2" style="margin-bottom: 5%;">
        <div class="table-responsive">
          <table id="MyTable" class="display" cellspacing="0" width="100%" style="padding-top: 25px;">
            <thead>
              <tr>
                <th>#</th>
                <th>Trainer Name</th>
                <th>Course</th>
                <th>Qualification</th>
                <th>Experience</th>
                <th>Edit</th>
                <th>Delete</th>
              </tr>
            </thead>
            <tbody>
            
            <%
            	Connection connection = null;
            	Statement statement = null;
            	
            		
            	try{
            		Class.forName("com.mysql.cj.jdbc.Driver");
            		String url="jdbc:mysql://localhost:3306/tfms_p0";
            		connection=DriverManager.getConnection(url, "root", "1234");
            		statement = connection.createStatement();
            		ResultSet resultSet = statement.executeQuery("select * from trainer");
            		int i=0;
            		while(resultSet.next()){
            	
            %>
            
              <tr>
                <td><% out.println(resultSet.getString("trainer_id")); %></td>
                <td><% out.println(resultSet.getString("trainer_name")); %></td>
                <td><% out.println(resultSet.getString("trainer_track")); %></td>
                <td><% out.println(resultSet.getString("trainer_qual")); %></td>
                <td><% out.println(resultSet.getString("trainer_exp")); %></td>
                <td><a href="edit.jsp?trainer_id=<%=resultSet.getString("trainer_id") %>"><button class="btn btn-success">Edit</button></a>
                </td>
                <td>
                	<a href="delete.jsp?trainer_id=<%=resultSet.getString("trainer_id") %>" ><button type="button" class="btn btn-danger">Delete</button></a>
                </td>
              </tr>
              <% 
              i++;
            		}
            	}catch(Exception e){
            		e.printStackTrace();
            	}
              %>

            </tbody>
          </table>
        </div>
      </div>
    </main>
    <!-- End #main -->

    <!-- Modal -->
    

    <!-- ======= Footer ======= -->
    <footer id="footer">
      <div class="footer-top">
        <div class="container">
          <div class="row" style="justify-content: space-around">
            <div class="col-lg-3 col-md-6 footer-contact">
              <h3>Admin</h3>
              <p>
                A108 Krunal Zodape <br />
                New York, NY 535022<br />
                United States <br /><br />
                <strong>Phone:</strong> +1 5589 55488 55<br />
                <strong>Email:</strong> info@example.com<br />
              </p>
            </div>

            <div class="col-lg-2 col-md-6 footer-links">
              <h4>Useful Links</h4>
              <ul>
                <li>
                  <i class="bx bx-chevron-right"></i>
                  <a href="admin.jsp">Home</a>
                </li>
              </ul>
            </div>

            <div class="col-lg-3 col-md-6 footer-links">
              <h4>Operations</h4>
              <ul>
                <li>
                  <i class="bx bx-chevron-right"></i>
                  <a href="show.jsp">Show All Trainer Details</a>
                </li>
                <li>
                  <i class="bx bx-chevron-right"></i>
                  <a href="add.jsp">Add Trainers</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <div class="container d-md-flex py-4">
        <div class="me-md-auto text-center text-md-start">
          <div class="copyright">
            &copy; Copyright <strong><span>TFMS</span></strong
            >. All Rights Reserved
          </div>
          <div class="credits">Designed by <a>Krunal Zodape</a></div>
        </div>
        <div class="social-links text-center text-md-right pt-3 pt-md-0">
          <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
          <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
          <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
          <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
          <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
        </div>
      </div>
    </footer>
    <!-- End Footer -->

    <div id="preloader"></div>
    <a
      href="#"
      class="back-to-top d-flex align-items-center justify-content-center"
      ><i class="bi bi-arrow-up-short"></i
    ></a>
    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>

    <script>
      $(document).ready(function () {
        $("#MyTable").DataTable({
          initComplete: function () {
            this.api()
              .columns()
              .every(function () {
                var column = this;
                var select = $('<select><option value=""></option></select>')
                  .appendTo($(column.footer()).empty())
                  .on("change", function () {
                    var val = $.fn.dataTable.util.escapeRegex($(this).val());
                    //to select and search from grid
                    column
                      .search(val ? "^" + val + "$" : "", true, false)
                      .draw();
                  });

                column
                  .data()
                  .unique()
                  .sort()
                  .each(function (d, j) {
                    select.append(
                      '<option value="' + d + '">' + d + "</option>"
                    );
                  });
              });
          },
        });
      });
    </script>
  </body>
</html>
