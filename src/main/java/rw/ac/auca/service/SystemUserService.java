package rw.ac.auca.service;

import rw.ac.auca.dao.SystemUserDao;
import rw.ac.auca.model.SystemUser;
import rw.ac.auca.service.interfaces.SystemUserInterface;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.List;

public class SystemUserService extends UnicastRemoteObject implements SystemUserInterface {
    public SystemUserService() throws RemoteException {
        super();
    }
    SystemUserDao dao= new SystemUserDao();

    @Override
    public boolean newSystemUser(SystemUser systemUser) throws RemoteException {
        return dao.newSystemUser(systemUser);
    }

    @Override
    public boolean updateSystemUser(SystemUser systemUser) throws RemoteException {
        return dao.updateSystemUser(systemUser);
    }

    @Override
    public boolean deleteSystemUser(SystemUser systemUser) throws RemoteException {
        return dao.deleteSystemUser(systemUser);
    }

    @Override
    public List<SystemUser> systemUserList() throws RemoteException {
        return dao.systemUserList();
    }
}
