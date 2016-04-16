package login;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;

import login.DBConnection;
import login.User;

@SuppressWarnings("unused")
public class UserDAO {

    Connection connect = null;
    PreparedStatement createBookPS = null;
    PreparedStatement seqPS = null;
    ResultSet rs = null;

    public boolean verifyusername(User user) throws Exception {
        Connection connect = DBConnection.getConnection();
        System.out.println("In verify username");
        String name = null;
        boolean flag = false;
        PreparedStatement checkPS = null;
        ResultSet rs1 = null;
        checkPS = connect
                .prepareStatement("select emailid from student where emailid=?");
        checkPS.setString(1, user.getEmailid());
        rs1 = checkPS.executeQuery();
        while (rs1.next()) {
            name = rs1.getString(1);
        }
        System.out.println("Name is :" + name);
        System.out.println("Customer username is : " + user.getEmailid());
        if (name == null) {
            flag = true;
        } else {
            flag = false;
        }
        System.out.println("flag is : " + flag);
        return flag;
    }

    public void addUser(User user) throws Exception {

        Connection connect = DBConnection.getConnection();
        PreparedStatement createCustomerPS = null;
        PreparedStatement seqPS = null;

        ResultSet rs = null;

        createCustomerPS = connect
                .prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?,?)");
        createCustomerPS.setString(1, user.getFirstName());
        createCustomerPS.setString(2, user.getLastName());
        createCustomerPS.setString(3, user.getEmailid());
        createCustomerPS.setString(4, user.getEmailid());
        createCustomerPS.setLong(5, user.getPhonenumber());
        createCustomerPS.setString(6, user.getSecurityQuestion1());
        createCustomerPS.setString(7, user.getAnswer1());
        createCustomerPS.setString(8, user.getSecurityQuestion2());
        createCustomerPS.setString(9, user.getAnswer2());
        createCustomerPS.setString(10, user.getStudentType());
        createCustomerPS.executeUpdate();

        DBConnection.closeConnection(connect);
        System.out.println("INSERTED");
    }

    public ArrayList<MyJobs> getMyJobs(String username) throws SQLException {
        ArrayList<MyJobs> myJobs = new ArrayList<>();
        Connection connect = DBConnection.getConnection();
        PreparedStatement validatePS = null;

        ResultSet rs = null;
        ArrayList<Integer> jobsArrayList = new ArrayList<>();

        validatePS = connect
                .prepareStatement("select jobid from onlinejobportal.appliedjobs where email = ?");
        validatePS.setString(1, username);

        rs = validatePS.executeQuery();

        while (rs.next()) {
            System.out.println("In while");
            int jobId = rs.getInt(1);
            // Category cat = new Category();
            jobsArrayList.add(jobId);
        }

        PreparedStatement seqPS = null;
        for (int i : jobsArrayList) {
            seqPS = connect.prepareStatement("select a.jobid,a.qualification,a.jobDescription,b.applieddate,b.status from onlinejobportal.job a,onlinejobportal.appliedjobs b where a.jobid = ? and b.jobid=?");
            seqPS.setString(1, Integer.toString(i));
            seqPS.setString(2, Integer.toString(i));
            rs = seqPS.executeQuery();

            while (rs.next()) {
                System.out.println("In while");
                int jobId = rs.getInt(1);
                String jobTitle = rs.getString(2);
                String jobDescription = rs.getString(3);
                String applieddate = rs.getString(4);
                String status = rs.getString(5);
                // Category cat = new Category();
                MyJobs job = new MyJobs();

                job.setJobId(jobId);
                job.setJobTitle(jobTitle);
                job.setJobDescription(jobDescription);
                job.setAppliedDate(applieddate);
                job.setStatus(status);

                myJobs.add(job);
            }
        }
        return myJobs;
    }

    public String validateuserlogin(String username1, String password)
            throws SQLException {
        User user = new User();
        Connection connect = DBConnection.getConnection();
        PreparedStatement validatePS = null;
        PreparedStatement seqPS = null;
        ResultSet rs = null;
        String password1 = null;
        String role;
        boolean status1;
        validatePS = connect
                .prepareStatement("select password from onlinejobportal.student where emailid = ?");
        validatePS.setString(1, username1);
        System.out.println("in userdao after query");

        rs = validatePS.executeQuery();
        while (rs.next()) {
            System.out.println("in while user dao");
            password1 = rs.getString("password");
            System.out.println("Verified password :" + password1);
        }

        try {
            if (password.equals(password1) && username1 != null) {
                status1 = true;
                System.out.println("usename in USERDAO is " + username1);
                return username1;

            }
        } catch (Exception e) {
            e.printStackTrace();
            // TODO: handle exception
        }

        return null;
    }
}
