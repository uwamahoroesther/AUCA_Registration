package rw.ac.auca.service.interfaces;

import rw.ac.auca.model.SystemUser;

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.List;

public interface SystemUserInterface extends Remote {
    public boolean newSystemUser(SystemUser systemUser) throws RemoteException;
    public boolean updateSystemUser(SystemUser systemUser) throws RemoteException;
    public boolean deleteSystemUser(SystemUser systemUser) throws RemoteException;
    public List<SystemUser> systemUserList() throws RemoteException;

}
