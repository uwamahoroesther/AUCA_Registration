package rw.ac.auca.service.interfaces;

import rw.ac.auca.model.StudentUser;
import rw.ac.auca.model.SystemUser;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface StudentUserInterface extends Remote {
public StudentUser StudentUserLogin(StudentUser studentUser) throws RemoteException;
public SystemUser  sytemUserLogin(SystemUser systemUser) throws RemoteException;
}
