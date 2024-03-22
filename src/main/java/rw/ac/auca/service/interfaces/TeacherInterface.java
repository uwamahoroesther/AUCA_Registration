package rw.ac.auca.service.interfaces;

import rw.ac.auca.model.Teacher;

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.List;

public interface TeacherInterface extends Remote {
    public boolean newTeacher(Teacher teacher) throws RemoteException;
    public List<Teacher> teacherList() throws RemoteException;
    public List<Teacher> findById(Teacher teacher) throws RemoteException;
    public boolean deleteTeacher(Teacher teacher) throws RemoteException;
    public boolean updateTeacher(Teacher teacher) throws RemoteException;

}
