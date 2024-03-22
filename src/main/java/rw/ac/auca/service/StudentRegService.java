package rw.ac.auca.service;

import rw.ac.auca.dao.StudentRegistrationDao;
import rw.ac.auca.model.*;
import rw.ac.auca.model.enums.ERegistrationStatus;
import rw.ac.auca.service.interfaces.StudentRegInterface;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.List;

public class StudentRegService extends UnicastRemoteObject implements StudentRegInterface {
    public StudentRegService() throws RemoteException {
        super();
    }
    StudentRegistrationDao dao= new StudentRegistrationDao();
    @Override
    public boolean newStudentRegistration(StudentRegistration studentRegistration) throws RemoteException {
        return dao.newStudentRegistration(studentRegistration);
    }

    @Override
    public boolean updateStudentRegistration(StudentRegistration studentRegistration) throws RemoteException {
        return dao.updateStudentRegistration(studentRegistration);
    }

    @Override
    public boolean deleteStudentRegistration(StudentRegistration studentRegistration) throws RemoteException {
        return dao.deleteStudentRegistration(studentRegistration);
    }

    @Override
    public List<StudentRegistration> studentRegistrationList() throws RemoteException {
        return dao.studentRegistrationList();
    }

    @Override
    public StudentRegistration getStudentRegistrationByStudentId(String studentId) throws RemoteException {
        return dao.getStudentRegistrationByStudentId(studentId);
    }

    @Override
    public List<StudentRegistration> getStudentsBySemester(Semester semester) throws RemoteException {
        return dao.getStudentsBySemester(semester);
    }

    @Override
    public List<StudentRegistration> getStudentsByDepartmentAndSemester(AccademicUnit department, Semester semester) throws RemoteException {
        return dao.getStudentsByDepartmentAndSemester(department,semester);
    }

    @Override
    public boolean updateRegistrationStatus(String studentId, ERegistrationStatus newStatus) throws RemoteException {
        return dao.updateRegistrationStatus(studentId,newStatus);
    }

//    @Override
//    public List<StudentRegistration> getStudentsByCourseAndSemester(Cource cource, Semester semester) throws RemoteException {
//        return dao.getStudentsByCourseAndSemester(cource,semester);
//    }
}
