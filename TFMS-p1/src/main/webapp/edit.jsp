<%@page import="com.revature.model.Trainer"%>
<%@page import="com.revature.tfms.database.DatabaseConnection"%>
<%@page import="com.revature.dao.TrainerDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html style="display: flex; justify-content: center; margin-top: 50px;">
<head>
<meta charset="ISO-8859-1">
<!-- Favicons -->
 <link href="assets/img/favicon1.png" rel="icon" />
 <title>TFMS - Edit</title>
</head>
<body>
	
	<%
		String id=(request.getParameter("trainer_id"));
		TrainerDao dao = new TrainerDao(DatabaseConnection.getConnection());
		Trainer t = dao.getTrainerById(id);
	%>
	<div
      class="modal fade"
      id="exampleModalCenter"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalCenterTitle"
      aria-hidden="true"
      style="padding: 50px; background-color: white; border-radius: 10px; box-shadow: 5px 10px 10px 5px #888888;"
    >
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title" id="exampleModalLongTitle" style="text-align: center;">
              Edit Trainer Details
            </h3>
          </div>
          <div class="modal-body">
            <form class="mx-1 mx-md-4" action="editTrainer" method="post">
              <div class="d-flex flex-row align-items-center mb-4" style="margin-bottom:15px">
                <i class="fas fa-id-card fa-lg me-3 fa-fw"></i>
                <div class="form-outline flex-fill mb-4">
                  <input
                    type="text"
                    name="trainerId"
                    id="form3Example1c"
                    class="form-control"
                    placeholder="Enter Id"
                    style="width:300px; padding: 15px 5px; border-radius: 5px;; padding: 15px 5px; border-radius: 5px;"
                    value="<%=t.getTrainerId() %>"
                    <% System.out.println(t.getTrainerId()); %>
                  />
                </div>
              </div>
              <div class="d-flex flex-row align-items-center mb-4" style="margin-bottom:15px">
                <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                <div class="form-outline flex-fill mb-0">
                  <input
                    type="text"
                    name="trainerName"
                    id="form3Example1c"
                    class="form-control"
                    placeholder="Enter Name"
                    style="width:300px; padding: 15px 5px; border-radius: 5px;"
                    value="<%=t.getTrainerName() %>"
                  />
                </div>
              </div>

              <div class="d-flex flex-row align-items-center mb-4" style="margin-bottom:15px">
                <i class="fas fa-book fa-lg me-3 fa-fw"></i>
                <div class="form-outline flex-fill mb-0">
                  <select
                    id="dog-names"
                    style="width:313px; padding:15px 5px; border-radius:5px"
                    value="<%=t.getTrainerTrack() %>"
                    style="
                      display: block;
                      width: 100px;
                      border: none;
                      border: 1px solid black;
                      padding: 0.375rem 0.75rem;
                      font-size: 1rem;
                      font-weight: 400;
                      line-height: 1.5;
                      color: #212529;
                    "
                     name="track"
                  >
                    <!-- <option value="Track">Track</option> -->
                    <option value="java">java</option>
                    <option value="dotnet">dotnet</option>
                    <option value="mainframe">mainframe</option>
                    <option value="testing">testing</option>
                  </select>
                </div>
              </div>

              <div class="d-flex flex-row align-items-center mb-4" style="margin-bottom:15px">
                <i class="fas fa-graduation-cap fa-lg me-3 fa-fw"></i>
                <div class="form-outline flex-fill mb-0">
                  <input
                    type="text"
                    name="trainerQual"
                    id="form3Example3c"
                    class="form-control"
                    placeholder="Enter Qualification"
                    style="width:300px; padding: 15px 5px; border-radius: 5px;"
                    value="<%=t.getTrainerQualification() %>"
                  />
                </div>
              </div>
              <div class="d-flex flex-row align-items-center mb-4" style="margin-bottom:15px">
                <i class="fas fa-calendar fa-lg me-3 fa-fw"></i>
                <div class="form-outline flex-fill mb-0">
                  <input
                    type="text"
                    name="trainerExp"
                    id="form3Example3c"
                    class="form-control"
                    placeholder="Enter Experience"
                    style="width:300px; padding: 15px 5px; border-radius: 5px;"
                    value="<%=t.getTrainerExperience() %>"
                  />
                </div>
              </div>
              <button type="submit" class="btn btn-primary"  style="background-color: #5fcf80; border:none; padding: 10px; border-radius: 3px; color: white;">Save changes</button>
            </form>
          </div>
        </div>
      </div>
    </div>
</body>
</html>