package login;

import java.sql.SQLException;
import java.util.ArrayList;

import login.UserDAO;
import login.User;

public class UserService {

    public void addUser(User user) throws Exception {

        UserDAO udao = new UserDAO();
        udao.addUser(user);

    }

    public String validateuserlogin(String username, String password) throws Exception {
        UserDAO udao = new UserDAO();
        return udao.validateuserlogin(username, password);

    }

    public ArrayList<MyJobs> getMyJobs(String username) throws Exception {
        UserDAO udao = new UserDAO();
        return udao.getMyJobs(username);
    }

    public ArrayList<User> getMyProfile(String username) throws Exception {
        UserDAO udao = new UserDAO();
        return udao.getMyProfile(username);
    }

    public boolean verifyusername(User customer) throws Exception {
        UserDAO udao = new UserDAO();
        System.out.println("customer dao : " + udao.verifyusername(customer));
        return udao.verifyusername(customer);
    }

//	public String getrole(String username, String password) throws SQLException {
//		CustomerDAO cdao=new CustomerDAO();
//		 return	cdao.getrole(username,password);
//	}

    /* public String validateusername(String string) {
     // TODO Auto-generated method stub
     CustomerDAO cdao=new CustomerDAO();
     return	cdao.validateusername(string);
     } */
}
