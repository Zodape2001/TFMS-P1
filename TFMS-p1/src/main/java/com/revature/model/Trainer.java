package com.revature.model;

public class Trainer {
	

	private String trainerId;
	private String trainerName;
	private String trainerTrack;
	private String trainerQualification;
	private String trainerExperience;
	
	public Trainer() {
		super();
	}
	
	public Trainer(String trainerId, String trainerName, String trainerTrack, String trainerQualification,
			String trainerExperience) {
		super();
		this.trainerId = trainerId;
		this.trainerName = trainerName;
		this.trainerTrack = trainerTrack;
		this.trainerQualification = trainerQualification;
		this.trainerExperience = trainerExperience;
	}

	public String getTrainerId() {
		return trainerId;
	}

	public void setTrainerId(String trainerId) {
		this.trainerId = trainerId;
	}

	public String getTrainerName() {
		return trainerName;
	}

	public void setTrainerName(String trainerName) {
		this.trainerName = trainerName;
	}

	public String getTrainerTrack() {
		return trainerTrack;
	}

	public void setTrainerTrack(String trainerTrack) {
		this.trainerTrack = trainerTrack;
	}

	public String getTrainerQualification() {
		return trainerQualification;
	}

	public void setTrainerQualification(String trainerQualification) {
		this.trainerQualification = trainerQualification;
	}

	public String getTrainerExperience() {
		return trainerExperience;
	}

	public void setTrainerExperience(String trainerExperience) {
		this.trainerExperience = trainerExperience;
	}

	@Override
	public String toString() {
		return "Trainer Id=" + trainerId + ", Trainer Name=" + trainerName + ", Trainer Track=" + trainerTrack
				+ ", Trainer Qualification=" + trainerQualification + ", Trainer Experience=" + trainerExperience
				+ "]";
	}
		
}
