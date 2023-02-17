package com.revature.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.revature.model.Trainer;

public class TrainerDao extends Trainer{
	private Connection conn;
	public TrainerDao(Connection conn){
		super();
		this.conn = conn;
	}
	
	public boolean addDetails(Trainer trainer) {
		boolean f= false;
		try {
			String sql="insert into trainer(trainer_id,trainer_name,trainer_track,trainer_qual,trainer_exp) values(?,?,?,?,?)";
			PreparedStatement ps= conn.prepareStatement(sql);
			
			ps.setString(1, trainer.getTrainerId());
			ps.setString(2, trainer.getTrainerName());
			ps.setString(3, trainer.getTrainerTrack() );
        	ps.setString(4, trainer.getTrainerQualification());
			ps.setString(5, trainer.getTrainerExperience() );

			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		}catch( Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	public Trainer getTrainerById(String id) {
		Trainer a=null;
		try {
			String sql="select * from trainer where trainer_id=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1,id);
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				
				a=new Trainer();
				a.setTrainerId(rs.getString(1));
				a.setTrainerName(rs.getString(2));
				a.setTrainerTrack(rs.getString(3));
				a.setTrainerQualification(rs.getString(4));
				a.setTrainerExperience(rs.getString(5));
                 
			}
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return a;
	}
	
	public boolean updateUser(Trainer trainer) throws SQLException {
        boolean rowUpdated = false;
        try {
			String sql="update trainer set trainer_id = ?, trainer_name = ?,trainer_track= ?, trainer_qual =?, trainer_exp =? where trainer_id = ?";
			PreparedStatement ps= conn.prepareStatement(sql);
			
			ps.setString(1, trainer.getTrainerId());
			ps.setString(2, trainer.getTrainerName());
			ps.setString(3, trainer.getTrainerTrack() );
        	ps.setString(4, trainer.getTrainerQualification());
			ps.setString(5, trainer.getTrainerExperience() );
			ps.setString(6, trainer.getTrainerId());
			
			int i=ps.executeUpdate();
			if(i==1) {
				rowUpdated=true;
			}
		}catch( Exception e) {
			e.printStackTrace();
		}
        return rowUpdated;
    }
}
