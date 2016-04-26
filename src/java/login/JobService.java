package login;

import java.sql.SQLException;
import java.util.ArrayList;

public class JobService {

    public ArrayList<Job> searchJob(String type, String category, String location, String email, String studentType) {
        // TODO Auto-generated method stub
        JobDAO jobDAO = new JobDAO();
        ArrayList<Job> specialList = jobDAO.searchJob(type, category, location, email, studentType);
        return specialList;
    }

    public void applyJob(AppliedJobs br) throws SQLException {
        JobDAO dao = new JobDAO();
        dao.applyJob(br);
    }

}
