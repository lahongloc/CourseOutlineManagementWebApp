/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories.impl;

import com.comwe.controllers.HomeController;
import com.comwe.pojo.AcademicYear;
import com.comwe.pojo.Major;
import com.comwe.pojo.Student;
import com.comwe.pojo.User;
import com.comwe.pojo.Grade;
import com.comwe.repositories.StudentRepositorty;
import com.comwe.services.AcademicYearService;
import com.comwe.services.MajorService;
import com.comwe.services.UserService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import com.comwe.services.GradeService;
import com.comwe.services.StudentService;

/**
 *
 * @author kitj3
 */
@Repository
public class StudentRepositoryImpl implements StudentRepositorty {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Autowired
    private UserService userService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private HomeController homeController;

    @Autowired
    private AcademicYearService academicYearService;
    @Autowired
    private GradeService gradeService;
    @Autowired
    private MajorService majorService;

    @Override
    @Transactional
    public List<Object> getStudents(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder c = s.getCriteriaBuilder();
        CriteriaQuery<Object> q = c.createQuery(Object.class);
        Root r = q.from(Student.class);
        q.select(r);

        List<Predicate> predicates = new ArrayList<>();

        String userId = params.get("userId");
        String academicYearId = params.get("academicYearId");
        String majorId = params.get("majorId");
        String studentCode = params.get("studentCode");
        String gradeId = params.get("gradeId");
        String name = params.get("name");
        String id = params.get("id");
        String facultyId = params.get("facultyId");

        if (userId != null && !userId.isEmpty()) {
            predicates.add(c.equal(r.get("userId"), Integer.parseInt(userId)));
        }

        if (academicYearId != null && !academicYearId.isEmpty()) {
            predicates.add(c.equal(r.get("academicYearId"), Integer.parseInt(academicYearId)));
        }

        if (majorId != null && !majorId.isEmpty()) {
            predicates.add(c.equal(r.get("majorId"), Integer.parseInt(majorId)));
        }

        if (studentCode != null && !studentCode.isEmpty()) {
            predicates.add(c.like(r.get("studentCode"), String.format("%%%s%%", studentCode)));
        }

        if (gradeId != null && !gradeId.isEmpty()) {
            predicates.add(c.equal(r.get("gradeId"), Integer.parseInt(gradeId)));
        }

        if (id != null && !id.isEmpty()) {
            predicates.add(c.equal(r.get("id"), Integer.parseInt(id)));
        }

        if (name != null && !name.isEmpty()) {
            predicates.add(c.like(r.get("userId").get("name"), String.format("%%%s%%", name)));
        }

        if (facultyId != null && !facultyId.isEmpty()) {
            predicates.add(c.equal(r.get("majorId").get("facultyId"), Integer.parseInt(facultyId)));
        }

        q.where(predicates.toArray(Predicate[]::new));

        Query qr = s.createQuery(q);

        List<Object> studentsInfo = new ArrayList<>();

        List<Student> students = qr.getResultList();
        students.forEach(stu -> {
            HashMap<Object, Object> temp = new HashMap<>();
            temp.put("id", stu.getId());
            temp.put("userId", stu.getUserId().getId());
            temp.put("studentCode", stu.getStudentCode());
            temp.put("name", stu.getUserId().getName());
            temp.put("academicYearId", stu.getAcademicYearId().getName());
            temp.put("gradeId", stu.getGradeId().getName());
            temp.put("majorId", stu.getMajorId().getName());
            temp.put("facultyId", stu.getMajorId().getFacultyId().getName());

            studentsInfo.add(temp);
        });

        return studentsInfo;
    }

    @Override
    @Transactional
    public List<Object> getStudentById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Student o = s.get(Student.class, id);

        List<Object> student = new ArrayList<>();

        try {
            HashMap<Object, Object> temp = new HashMap<>();
            Student stu = s.get(Student.class, id);;
            temp.put("id", stu.getId());
            temp.put("userId", stu.getUserId().getId());
            temp.put("studentCode", stu.getStudentCode());
            temp.put("name", stu.getUserId().getName());
            temp.put("academicYearId", stu.getAcademicYearId().getName());
            temp.put("gradeId", stu.getGradeId().getName());
            temp.put("majorId", stu.getMajorId().getName());
            temp.put("facultyId", stu.getMajorId().getFacultyId().getName());

            student.add(temp);
        } catch (Exception ex) {
            return null;
        }

        return student;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean addStudent(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();

        try {
            User user = this.userService.addUser(params, null);
            String gradeId = params.get("gradeId");
            String academicYearId = params.get("academicYearId");
            String majorId = params.get("majorId");
            String studentCode = params.get("studentCode");

            if (gradeId != null && !gradeId.isEmpty()
                    && academicYearId != null && !academicYearId.isEmpty()
                    && majorId != null && !majorId.isEmpty()
                    && studentCode != null && !studentCode.isEmpty()) {
                Grade c = this.gradeService.getGradeById(Integer.parseInt(gradeId));
                AcademicYear a = this.academicYearService.getAcademicYearById(Integer.parseInt(academicYearId));
                Major m = this.majorService.getMajorById(Integer.parseInt(majorId));

                Student student = new Student();
                student.setUserId(user);
                student.setGradeId(c);
                student.setAcademicYearId(a);
                student.setMajorId(m);
                student.setStudentCode(studentCode);
                s.save(student);
            }

            return true;
        } catch (HibernateException ex) {
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean updateStudent(Map<String, String> params, MultipartFile avatar) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            String role = params.get("role");
            if (role.equals("ROLE_STUDENT")) {
                User user = this.userService.updateUser(params, avatar);

                Student student = this.studentService.getStudentByUserId(user.getId());

                String content = String.format(
                        "<p>Xin chào <strong>%s</strong>,</p>"
                        + "<p>Mã số sinh viên: <strong>%s.</strong></p>"
                        + "<p>Lớp: <strong>%s.</strong></p>"
                        + "<p>Ngành: <strong>%s.</strong></p>"
                        + "<p>Khoa: <strong>%s.</strong></p>"
                        + "<p>Niên khóa: <strong>%s.</strong></p>"
                        + "<p>Thông báo bạn đã <strong>cập nhật tài khoản thành công!</strong> Bây giờ bạn đã có thể đăng nhập vào hệ thống.</p>"
                        + "<p>Link: <a href=\"http://localhost:3000/login\"> Tại đây</a></p>"
                        + "<p>Vui lòng không phản hồi lại gmail này! Cảm ơn bạn!</p>"
                        + "<p><strong>Admin</strong></p>",
                        user.getName(), student.getStudentCode(),
                        student.getGradeId().getName(),
                        student.getMajorId().getName(),
                        student.getMajorId().getFacultyId().getName(),
                        student.getAcademicYearId().getName()
                );

                this.homeController.sendMail("2151050219kiet@ou.edu.vn",
                        "ACCOUNT ACTIVATED FOR STUDENT",
                        content);

            } else {
                return false;
            }

            return true;
        } catch (HibernateException ex) {
            return false;
        }
    }

    @Override
    public Student getStudentByUserId(int id
    ) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder c = s.getCriteriaBuilder();
        CriteriaQuery<Object> q = c.createQuery(Object.class);
        Root r = q.from(Student.class);
        q.select(r);

        q.where(c.equal(r.get("userId"), id));

        return (Student) s.createQuery(q).getSingleResult();
    }

}
