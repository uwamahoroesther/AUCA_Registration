package rw.ac.auca.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.exception.ConstraintViolationException;
import rw.ac.auca.model.SystemUser;
import java.util.List;

public class SystemUserDao {
    public boolean newSystemUser(SystemUser systemUser){
        try {
            boolean result= true;
            Session ss= HibernateUtil.getSessionFactory().openSession();
            Transaction tr=ss.beginTransaction();
            ss.save(systemUser);
            tr.commit();
            ss.close();
            return result;

        }catch (ConstraintViolationException ex){
            ex.printStackTrace();
            return false;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
    public boolean updateSystemUser(SystemUser systemUser){
        try {
            boolean result= true;
            Session ss= HibernateUtil.getSessionFactory().openSession();
            Transaction tr=ss.beginTransaction();
            ss.update(systemUser);
            tr.commit();
            ss.close();
            return result;

        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
    public boolean deleteSystemUser(SystemUser systemUser){
        try {
            boolean result= true;
            Session ss= HibernateUtil.getSessionFactory().openSession();
            Transaction tr=ss.beginTransaction();
            ss.delete(systemUser);
            tr.commit();
            ss.close();
            return result;

        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
    public List<SystemUser> systemUserList(){
        try {
            Session ss = HibernateUtil.getSessionFactory().openSession();
            List<SystemUser> systemUsers= ss.createQuery("select user from SystemUser user").list();
            ss.close();
            return systemUsers;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }
}
