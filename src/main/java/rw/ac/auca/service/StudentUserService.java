package rw.ac.auca.service;

import rw.ac.auca.dao.UserDao;
import rw.ac.auca.model.StudentUser;
import rw.ac.auca.model.SystemUser;
import rw.ac.auca.service.interfaces.StudentUserInterface;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

public class StudentUserService extends UnicastRemoteObject implements StudentUserInterface {
    UserDao dao= new UserDao();



    public StudentUserService() throws RemoteException {
        super();
    }

    @Override
    public StudentUser StudentUserLogin(StudentUser studentUser) throws RuntimeException {
        return dao.StudentLogin(studentUser);
    }

    @Override
    public SystemUser sytemUserLogin(SystemUser systemUser) throws RemoteException {
        return dao.SystemUserLogin(systemUser);
    }
}
