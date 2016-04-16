package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class JobDAO {

    private Connection connection = null;
    private PreparedStatement prepareStatement1 = null;

    private ResultSet rs = null;

    public ArrayList<Job> searchJob(String type, String category, String location) {
        System.out.println("In job dao"+type+""+category+""+location);
        ArrayList<Job> jobList = new ArrayList<Job>();
        System.out.println("in Job DAO");
        try {
            connection = DBConnection.getConnection();
            if (category == null && location == null && type!=null) {
                String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobType=?";
                prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                prepareStatement1.setString(1, type);
            } else if (location == null && type == null && category!=null) {
                String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobCategory=?";
                prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                prepareStatement1.setString(1, category);
            } else if (category == null && type == null && location!=null) {
                String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where location=?";
                prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                prepareStatement1.setString(1, location);
            }
            else if (category == null && type!=null && location!=null) {
                String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobType=? and location=?";
                prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                prepareStatement1.setString(1, type);
                prepareStatement1.setString(2, location);
            } else if (location == null && category != null && type!=null) {
                String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobCategory=? and jobType=?";
                prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                prepareStatement1.setString(1, category);
                prepareStatement1.setString(2, type);
            } else if (type == null && location != null && category != null) {
                String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where location=? and jobCategory=?";
                prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                prepareStatement1.setString(1, location);
                prepareStatement1.setString(2, category);
            }
            else if (type == null && category == null && location == null) {
                String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job";
                prepareStatement1 = connection.prepareStatement(roomsearchQuery);
            }
            else {
                String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobCategory=? and location=? and jobType=?";
                prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                prepareStatement1.setString(1, category);
                prepareStatement1.setString(2, location);
                prepareStatement1.setString(3, type);
            }

            rs = prepareStatement1.executeQuery();

            while (rs.next()) {
                System.out.println("In while");
                int jobId = rs.getInt(1);
                String jobTitle = rs.getString(2);
                String jobDescription = rs.getString(3);
                String postedDate = rs.getString(4);
                String lastDate = rs.getString(5);
                System.out.println("Job category is : " + jobTitle);
                // Category cat = new Category();
                Job job = new Job();

                job.setJobId(jobId);
                job.setJobTitle(jobTitle);
                job.setJobDescription(jobDescription);
                job.setPostingDate(postedDate);
                job.setLastDate(lastDate);

                jobList.add(job);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeConnection(connection);
        }
        System.out.println("Joblist size "+jobList.size());
        return jobList;

    }
}
