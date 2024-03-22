package rw.ac.auca.dao;


import org.hibernate.Session;
import org.hibernate.query.Query;
import rw.ac.auca.model.StudentUser;
import rw.ac.auca.model.SystemUser;

public class UserDao {
    public StudentUser StudentLogin(StudentUser user){
        try {
            Session ss= HibernateUtil.getSessionFactory().openSession();
            Query query = ss.createQuery("SELECT usr FROM StudentUser usr WHERE usr.StudentId = :studentId AND usr.password = :password");
            query.setParameter("studentId", user.getStudentId());
            query.setParameter("password", user.getPassword());
            StudentUser newUser=  (StudentUser) query.uniqueResult();
            return newUser;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }

    }
    public SystemUser SystemUserLogin(SystemUser systemUser){
        try {
            Session ss=HibernateUtil.getSessionFactory().openSession();
            Query query=ss.createQuery("SELECT user from SystemUser user where user.Email = :email and user.password = :password");
            query.setParameter("email",systemUser.getEmail());
            query.setParameter("password",systemUser.getPassword());
            SystemUser login=(SystemUser) query.uniqueResult();
            return login;


        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
