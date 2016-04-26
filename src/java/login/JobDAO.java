package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

public class JobDAO {

    private Connection connection = null;
    private PreparedStatement prepareStatement1 = null;

    private ResultSet rs = null;
    private int a = 0;

    public void applyJob(AppliedJobs br) throws SQLException {
        ArrayList<AppliedJobs> brList = new ArrayList<AppliedJobs>();

        try {
//            System.out.println(br.getUserid());
//            System.out.println(br.getStartdate());
//            System.out.println(br.getEnddate());
//            System.out.println(br.getTotalpay());
//            System.out.println(br.getAdvance());
//            System.out.println(br.getCategory());
            connection = DBConnection.getConnection();
            prepareStatement1 = connection
                    .prepareStatement("insert into onlinejobportal.appliedjobs(email,jobid,applieddate,status)values(?,?,?,?)");
            prepareStatement1.setString(1, br.getEmail());
            prepareStatement1.setInt(2, br.getJobId());
            prepareStatement1.setString(3, br.getAppliedDate());
            prepareStatement1.setString(4, br.getStatus());
            a = prepareStatement1.executeUpdate();

        } catch (SQLException e) {
            System.out
                    .println("exception occured while performing create customer operation");
            e.printStackTrace();
        } finally {
            connection.close();
        }

    }

    public ArrayList<Job> searchJob(String type, String category, String location, String email, String studentType) {
//        HttpSession session = request.getSession();
        System.out.println("In job dao" + type + "" + category + "" + location);
        ArrayList<Job> jobList = new ArrayList<Job>();
        ArrayList<Integer> alreadyAppliedJobs = new ArrayList<>();
        System.out.println("in Job DAO");
        ResultSet ps = null;

        try {
            connection = DBConnection.getConnection();

            String query = "select jobid from onlinejobportal.appliedjobs where email=?";
            prepareStatement1 = connection.prepareStatement(query);
            prepareStatement1.setString(1, email);
            ps = prepareStatement1.executeQuery();
            while (ps.next()) {
                int next = ps.getInt(1);
                System.out.println("job id is " + next);
                alreadyAppliedJobs.add(next);
            }
            String allIds = "";

            for (int i = 0; i < alreadyAppliedJobs.size(); i++) {
                if (i < alreadyAppliedJobs.size() - 1) {
                    allIds = allIds + alreadyAppliedJobs.get(i) + ",";
                } else {
                    allIds += alreadyAppliedJobs.get(i);
                }

            }
            System.out.println("joiis are " + allIds);

            if (studentType.equals("international")) {
                if (allIds.equals("")) {
                    if (category == null && location == null && type != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobType=? and h1B='yes'";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, type);
//                prepareStatement1.setString(2, allIds);
                    } else if (location == null && type == null && category != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobCategory=? and h1B='yes'";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, category);
//                prepareStatement1.setString(2, allIds);
                    } else if (category == null && type == null && location != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where location=? and h1B='yes'";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, location);
//                prepareStatement1.setString(2, allIds);
                    } else if (category == null && type != null && location != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobType=? and location=? and h1B='yes'";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, type);
                        prepareStatement1.setString(2, location);
//                prepareStatement1.setString(3, allIds);
                    } else if (location == null && category != null && type != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobCategory=? and jobType=? and h1B='yes'";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, category);
                        prepareStatement1.setString(2, type);
//                prepareStatement1.setString(3, allIds);
                    } else if (type == null && location != null && category != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where location=? and jobCategory=? and h1B='yes'";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, location);
                        prepareStatement1.setString(2, category);
//                prepareStatement1.setString(3, allIds);
                    } else if (type == null && category == null && location == null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where h1B='yes'";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
//                prepareStatement1.setString(1, allIds);
                    } else {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobCategory=? and location=? and jobType=? and h1B='yes'";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, category);
                        prepareStatement1.setString(2, location);
                        prepareStatement1.setString(3, type);
//                prepareStatement1.setString(4, allIds);
                    }
                } else {
                    if (category == null && location == null && type != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobType=? and h1B='yes' and jobid not in (" + allIds + ")";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, type);
//                prepareStatement1.setString(2, allIds);
                    } else if (location == null && type == null && category != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobCategory=? and h1B='yes' and jobid not in (" + allIds + ")";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, category);
//                prepareStatement1.setString(2, allIds);
                    } else if (category == null && type == null && location != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where location=? and h1B='yes' and jobid not in (" + allIds + ")";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, location);
//                prepareStatement1.setString(2, allIds);
                    } else if (category == null && type != null && location != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobType=? and location=? and h1B='yes' and jobid not in (" + allIds + ")";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, type);
                        prepareStatement1.setString(2, location);
//                prepareStatement1.setString(3, allIds);
                    } else if (location == null && category != null && type != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobCategory=? and jobType=? and h1B='yes' and jobid not in (" + allIds + ")";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, category);
                        prepareStatement1.setString(2, type);
//                prepareStatement1.setString(3, allIds);
                    } else if (type == null && location != null && category != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where location=? and jobCategory=? and h1B='yes' and jobid not in (" + allIds + ")";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, location);
                        prepareStatement1.setString(2, category);
//                prepareStatement1.setString(3, allIds);
                    } else if (type == null && category == null && location == null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where h1B='yes' and jobid not in (" + allIds + ")";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
//                prepareStatement1.setString(1, allIds);
                    } else {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobCategory=? and location=? and jobType=? and h1B='yes' and jobid not in (" + allIds + ")";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, category);
                        prepareStatement1.setString(2, location);
                        prepareStatement1.setString(3, type);
//                prepareStatement1.setString(4, allIds);
                    }
                }
            } else {
                if (allIds.equals("")) {
                    if (category == null && location == null && type != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobType=?";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, type);
//                prepareStatement1.setString(2, allIds);
                    } else if (location == null && type == null && category != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobCategory=?";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, category);
//                prepareStatement1.setString(2, allIds);
                    } else if (category == null && type == null && location != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where location=?";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, location);
//                prepareStatement1.setString(2, allIds);
                    } else if (category == null && type != null && location != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobType=? and location=?";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, type);
                        prepareStatement1.setString(2, location);
//                prepareStatement1.setString(3, allIds);
                    } else if (location == null && category != null && type != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobCategory=? and jobType=?";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, category);
                        prepareStatement1.setString(2, type);
//                prepareStatement1.setString(3, allIds);
                    } else if (type == null && location != null && category != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where location=? and jobCategory=?";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, location);
                        prepareStatement1.setString(2, category);
//                prepareStatement1.setString(3, allIds);
                    } else if (type == null && category == null && location == null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
//                prepareStatement1.setString(1, allIds);
                    } else {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobCategory=? and location=? and jobType=?";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, category);
                        prepareStatement1.setString(2, location);
                        prepareStatement1.setString(3, type);
//                prepareStatement1.setString(4, allIds);
                    }
                } else {
                    if (category == null && location == null && type != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobType=? and jobid not in (" + allIds + ")";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, type);
//                prepareStatement1.setString(2, allIds);
                    } else if (location == null && type == null && category != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobCategory=? and jobid not in (" + allIds + ")";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, category);
//                prepareStatement1.setString(2, allIds);
                    } else if (category == null && type == null && location != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where location=? and jobid not in (" + allIds + ")";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, location);
//                prepareStatement1.setString(2, allIds);
                    } else if (category == null && type != null && location != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobType=? and location=? and jobid not in (" + allIds + ")";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, type);
                        prepareStatement1.setString(2, location);
//                prepareStatement1.setString(3, allIds);
                    } else if (location == null && category != null && type != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobCategory=? and jobType=? and jobid not in (" + allIds + ")";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, category);
                        prepareStatement1.setString(2, type);
//                prepareStatement1.setString(3, allIds);
                    } else if (type == null && location != null && category != null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where location=? and jobCategory=? and jobid not in (" + allIds + ")";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, location);
                        prepareStatement1.setString(2, category);
//                prepareStatement1.setString(3, allIds);
                    } else if (type == null && category == null && location == null) {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobid not in (" + allIds + ")";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
//                prepareStatement1.setString(1, allIds);
                    } else {
                        String roomsearchQuery = "select jobid,qualification,jobDescription,postedDate,lastDate from onlinejobportal.job where jobCategory=? and location=? and jobType=? and jobid not in (" + allIds + ")";
                        prepareStatement1 = connection.prepareStatement(roomsearchQuery);
                        prepareStatement1.setString(1, category);
                        prepareStatement1.setString(2, location);
                        prepareStatement1.setString(3, type);
//                prepareStatement1.setString(4, allIds);
                    }
                }
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
        System.out.println("Joblist size " + jobList.size());
        return jobList;

    }
}
