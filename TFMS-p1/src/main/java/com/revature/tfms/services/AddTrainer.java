package com.revature.tfms.services;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.revature.dao.TrainerDao;
import com.revature.model.Trainer;
import com.revature.tfms.database.DatabaseConnection;

/**
 * Servlet implementation class AddTrainer
 */
@WebServlet("/InsertData")
public class AddTrainer extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		doGet(request, response);
		
		String trainerId =request.getParameter("id");
		String trainerName =request.getParameter("name");
		String trainerTrack =request.getParameter("track");
		String trainerQualifia =request.getParameter("qualification");
		String trainerExp =request.getParameter("experience");

		Trainer trainer= new Trainer(trainerId,trainerName,trainerTrack,trainerQualifia,trainerExp);
		
		System.out.println(trainer);
		TrainerDao  ado=new TrainerDao(DatabaseConnection.getConnection());
		HttpSession session=request.getSession();
		boolean f= ado.addDetails(trainer);
		
		if(f) {
			session.setAttribute("succMsg","Student details submit sucessfully");
			response.sendRedirect("show.jsp");
		}else {
			session.setAttribute("errorMsg","Something wrong on server");
			response.sendRedirect("add.jsp");

		}
	}

}
