package com.revature.tfms.services;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.dbcp.dbcp2.ConnectionFactory;

import com.revature.dao.TrainerDao;
import com.revature.model.Trainer;
import com.revature.tfms.database.DatabaseConnection;

@WebServlet("/editTrainer")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String trainerId =request.getParameter("trainerId");
		System.out.println(trainerId);
		String name =request.getParameter("trainerName");
		String track =request.getParameter("track");
		String qualifia =request.getParameter("trainerQual");
		String exp =request.getParameter("trainerExp");

		Trainer trainer= new Trainer(trainerId,name,track,qualifia,exp);
		
		System.out.println(trainer);
		TrainerDao  ado=new TrainerDao(DatabaseConnection.getConnection());
		HttpSession session=request.getSession();
		
		boolean f = false;
		try {
			f = ado.updateUser(trainer);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(f) {
			session.setAttribute("succMsg","Student details update sucessfully");
			response.sendRedirect("show.jsp");
		}else {
			session.setAttribute("errorMsg","Something wrong on server");
			response.sendRedirect("show.jsp");

		}

	}

}
