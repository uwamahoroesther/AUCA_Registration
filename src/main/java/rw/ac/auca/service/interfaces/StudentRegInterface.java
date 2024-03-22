package rw.ac.auca.service.interfaces;

import rw.ac.auca.model.*;
import rw.ac.auca.model.enums.ERegistrationStatus;

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.List;

public interface StudentRegInterface extends Remote {
    public boolean newStudentRegistration(StudentRegistration studentRegistration) throws RemoteException;
    public boolean updateStudentRegistration(StudentRegistration studentRegistration) throws RemoteException;
    public boolean deleteStudentRegistration(StudentRegistration studentRegistration) throws RemoteException;
    public List<StudentRegistration> studentRegistrationList() throws RemoteException;
    public StudentRegistration getStudentRegistrationByStudentId(String studentId) throws RemoteException;
    public List<StudentRegistration> getStudentsBySemester(Semester semester) throws RemoteException;
    public List<StudentRegistration> getStudentsByDepartmentAndSemester(AccademicUnit department, Semester semester) throws RemoteException;
    //public List<StudentRegistration> getStudentsByCourseAndSemester(Cource cource, Semester semester) throws RemoteException;
    public boolean updateRegistrationStatus(String studentId, ERegistrationStatus newStatus)throws RemoteException;
}
