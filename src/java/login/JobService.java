package login;

import java.util.ArrayList;



public class JobService {
	public ArrayList<Job> searchJob(String type, String category, String location) {
		// TODO Auto-generated method stub
		JobDAO jobDAO = new JobDAO();
		ArrayList<Job> specialList = jobDAO.searchJob(type, category, location);
		return specialList;
	}

}
