/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories.impl;

import com.comwe.pojo.AcademicYear;
import com.comwe.pojo.Admin;
import com.comwe.pojo.DTOs.OutlineDTO;
import com.comwe.pojo.Document;
import com.comwe.pojo.Faculty;
import com.comwe.pojo.Lecturer;
import com.comwe.pojo.Major;
import com.comwe.pojo.Outline;
import com.comwe.pojo.OutlineAcademicYear;
import com.comwe.pojo.OutlineScore;
import com.comwe.pojo.OutlineSubject;
import com.comwe.pojo.Score;
import com.comwe.pojo.Subject;
import com.comwe.pojo.User;
import com.comwe.repositories.OutlineRepository;
import com.comwe.services.DocumentService;
import com.comwe.services.FileStorageService;
import com.comwe.services.PdfService;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.persistence.Query;
import javax.persistence.Tuple;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author lahon
 */
@Repository
@Transactional
@PropertySource("classpath:configs.properties")
public class OutlineRepositoryImpl implements OutlineRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Autowired
    private Environment env;

    @Autowired
    private PdfService pdfService;

    @Override
    public List<OutlineDTO> getOutlines(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder c = s.getCriteriaBuilder();
        CriteriaQuery<Tuple> q = c.createQuery(Tuple.class);

        try {
            Root<Outline> rootOutline = q.from(Outline.class);
            Join<Outline, Lecturer> rootLecturer = rootOutline.join("lecturerId");
            Join<Lecturer, User> rootUser = rootLecturer.join("userId");
            Join<Outline, Subject> rootSubject = rootOutline.join("subjectId");
            Join<Lecturer, Faculty> rootFaculty = rootLecturer.join("facultyId");
            Join<Outline, OutlineAcademicYear> rootOutlineAcademicYear
                    = rootOutline.join("outlineAcademicYearSet", JoinType.LEFT); // gồm các Outline mà không có OutlineAcademicYear tương ứng

            String kw = params.get("kw");
            String page = params.get("page");
            String lecturerId = params.get("lecturerId");
            String status = params.get("status");
            String outlineId = params.get("outlineId");
            String title = params.get("name");
            String facultyId = params.get("facultyId");
            String subjectId = params.get("subjectId");
            String academicYearId = params.get("academicYearId");
            String theoCreditHour = params.get("theoCreditHour");
            String pracCreditHour = params.get("pracCreditHour");
            String academicYearRange = params.get("academicYearRange");

            q.multiselect(
                    rootOutline.get("id").alias("outlineId"),
                    rootOutline.get("startedDatetime").alias("startedDate"),
                    rootOutline.get("expiredDatetime").alias("expiredDate"),
                    rootOutline.get("description").alias("description"),
                    rootOutline.get("theoCreditHour").alias("theory"),
                    rootOutline.get("pracCreditHour").alias("practice"),
                    rootUser.get("name").alias("lecturer"),
                    rootSubject.get("name").alias("subject"),
                    rootFaculty.get("name").alias("faculty"),
                    rootOutline.get("price").alias("price")
            );

            List<Predicate> predicates = new ArrayList<>();

            if (academicYearRange != null && !academicYearRange.isEmpty()) {
                String[] years = academicYearRange.split("-");
                if (years.length == 2) {
                    String startYear = years[0].trim() + "-" + (Integer.parseInt(years[0].trim()) + 4);
                    String endYear = years[1].trim() + "-" + (Integer.parseInt(years[1].trim()) + 4);

                    Predicate startYearPredicate = c.equal(
                            rootOutlineAcademicYear.get("academicYearId").get("name"),
                            startYear
                    );
                    Predicate endYearPredicate = c.equal(
                            rootOutlineAcademicYear.get("academicYearId").get("name"),
                            endYear
                    );

                    predicates.add(c.or(startYearPredicate, endYearPredicate));
                }
            }

            if (academicYearId != null && !academicYearId.isEmpty()) {
                predicates.add(c.equal(rootOutlineAcademicYear.get("academicYearId"), Integer.parseInt(academicYearId)));
            }

            if (facultyId != null && !facultyId.isEmpty()) {
                predicates.add(c.equal(rootOutline.get("lecturerId").get("facultyId"), Integer.parseInt(facultyId)));
            }

            if (subjectId != null && !subjectId.isEmpty()) {
                predicates.add(c.equal(rootOutline.get("subjectId"), Integer.parseInt(subjectId)));
            }

            if (title != null && !title.isEmpty()) {
                predicates.add(c.like(rootOutline.get("description"), "%" + title + "%"));
            }

            if (kw != null && !kw.isEmpty()) {
                predicates.add(c.like(rootOutline.get("description"), String.format("%%%s%%", kw)));
            }

            if (lecturerId != null && !lecturerId.isEmpty()) {
                predicates.add(c.equal(rootOutline.get("lecturerId"), Integer.parseInt(lecturerId)));
            }

            if (status != null && !status.isEmpty()) {
                predicates.add(c.like(rootOutline.get("status"), status));
            }

            if (outlineId != null && !outlineId.isEmpty()) {
                predicates.add(c.equal(rootOutline.get("id"), Integer.parseInt(outlineId)));
            }

            if (theoCreditHour != null && !theoCreditHour.isEmpty()) {
                predicates.add(c.equal(rootOutline.get("theoCreditHour"), Integer.parseInt(theoCreditHour)));
            }

            if (pracCreditHour != null && !pracCreditHour.isEmpty()) {
                predicates.add(c.equal(rootOutline.get("pracCreditHour"), Integer.parseInt(pracCreditHour)));
            }

            q.where(predicates.toArray(Predicate[]::new));
            q.orderBy(c.asc(rootOutline.get("id")));

            q.distinct(true);

            TypedQuery<Tuple> qr = s.createQuery(q);

            if (page != null && !page.isEmpty()) {
                int pageSize = Integer.parseInt(this.env.getProperty("pageSize"));

                qr.setMaxResults(pageSize);
                qr.setFirstResult((Integer.parseInt(page) - 1) * pageSize);
            }

            List<Tuple> resultList = qr.getResultList();

            List<OutlineDTO> outlinesInfo = new ArrayList<>();
            for (Tuple tuple : resultList) {
                OutlineDTO temp = new OutlineDTO(
                        (Integer) tuple.get("outlineId"),
                        (Date) tuple.get("startedDate"),
                        (Date) tuple.get("expiredDate"),
                        (String) tuple.get("description"),
                        (Integer) tuple.get("theory"),
                        (Integer) tuple.get("practice"),
                        (String) tuple.get("lecturer"),
                        (String) tuple.get("subject"),
                        (String) tuple.get("faculty"),
                        (Float) tuple.get("price")
                );
                outlinesInfo.add(temp);
            }

            return outlinesInfo;
        } catch (Exception e) {
            System.out.println("Error of GETOUTLINES is: " + e.toString());
            return null;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void addOutline(int lecturerId, int subjectId, int academicYearId1, int academicYearId2) {
        Session s = this.factory.getObject().getCurrentSession();

        User user = s.get(User.class, lecturerId);
        Lecturer lecturer = user.getLecturerSet().stream().findFirst().get();

        Subject subject = s.get(Subject.class, subjectId);

        Outline outline = new Outline();
        outline.setSubjectId(subject);
        outline.setLecturerId(lecturer);
        outline.setStatus("HOLDING");
        System.out.println("chuan bi luu");
        s.save(outline);
        System.out.println("Qua luu");

        AcademicYear academicYear1 = s.get(AcademicYear.class, academicYearId1);
        OutlineAcademicYear oc1 = new OutlineAcademicYear();
        oc1.setAcademicYearId(academicYear1);
        oc1.setOutlineId(outline);
        s.save(oc1);

        if (academicYearId2 > 0) {
            AcademicYear academicYear2 = s.get(AcademicYear.class, academicYearId2);
            OutlineAcademicYear oc2 = new OutlineAcademicYear();
            oc2.setAcademicYearId(academicYear2);
            oc2.setOutlineId(outline);
            s.save(oc2);
        }

    }

    @Override
    public boolean checkOutlineExist(int subjectId, int academicYearId1, int academicYearId2) {
        Session s = this.factory.getObject().getCurrentSession();
        Subject subject = s.get(Subject.class, subjectId);
        int outlineNumber = subject.getOutlineSet().size();
        if (outlineNumber > 0) {
            AcademicYear acy1 = s.get(AcademicYear.class, academicYearId1);
            int acy1OutlineNumber = acy1.getOutlineAcademicYearSet().size();
            if (acy1OutlineNumber > 0) {
                return false;
            } else {
                if (academicYearId2 > 0) {
                    AcademicYear acy2 = s.get(AcademicYear.class, academicYearId2);
                    int acy2OutlineNumber = acy2.getOutlineAcademicYearSet().size();
                    return acy2OutlineNumber <= 0;
                }
                return true;
            }
        } else {
            return true;
        }
    }

    public List<Object> getOutlineById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Outline o = s.get(Outline.class, id);

        List<Object> outline = new ArrayList<>();

        try {
            HashMap<Object, Object> temp = new HashMap<>();
            temp.put("outlineId", o.getId());
            temp.put("lecturer", o.getLecturerId().getUserId().getName());
            temp.put("subject", o.getSubjectId().getName());
            temp.put("faculty", o.getLecturerId().getFacultyId().getName());
            temp.put("startedDate", o.getStartedDatetime());
            temp.put("expiredDate", o.getExpiredDatetime());
            temp.put("description", o.getDescription());
            temp.put("theory", o.getTheoCreditHour());
            temp.put("practice", o.getPracCreditHour());
            String status = o.getStatus();
            temp.put("status", status);
            
            if (status.equals("ACCEPTED")) {
                temp.put("document", o.getDocumentId().getUrl());
            }

            outline.add(temp);
        } catch (Exception ex) {
            return null;
        }

        return outline;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean updateOutline(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();

        params.keySet().forEach(k -> System.out.println(k.toString() + " la: " + params.get(k)));

        try {
            // take the curent outline id
            int outlineId = Integer.parseInt(params.get("outline"));
            // take the ensential params for outline updating
            int pracCreditHour = Integer.parseInt(params.get("prac"));
            int theoCreditHour = Integer.parseInt(params.get("theory"));
            String description = params.get("description");

            // update outline
            Outline outline = s.get(Outline.class, outlineId);
            outline.setPracCreditHour(pracCreditHour);
            outline.setTheoCreditHour(theoCreditHour);
            outline.setDescription(description);
            s.update(outline);

            // take score id and percent corresspondingly
            String[] outlineScoreIds = {params.get("outlineScoreId1"), params.get("outlineScoreId2"), params.get("outlineScoreId3"), params.get("outlineScoreId4"), params.get("outlineScoreId5")};
            String[] percents = {params.get("percent1"), params.get("percent2"), params.get("percent3"), params.get("percent4"), params.get("percent5")};

            // update or add OutlineScore
            System.out.println("lay cac cot co san");
            List<OutlineScore> existingOutlineScores = s.createQuery("FROM OutlineScore WHERE outline_id = :outlineId", OutlineScore.class)
                    .setParameter("outlineId", outlineId)
                    .getResultList();

            List<Integer> processedIds = new ArrayList<>();
            for (int i = 0; i < outlineScoreIds.length; i++) {
                if (outlineScoreIds[i] != null && !outlineScoreIds[i].isEmpty() && percents[i] != null && !percents[i].isEmpty()) {
                    int scoreId = Integer.parseInt(outlineScoreIds[i]);
                    float percent = Float.parseFloat(percents[i]);

                    OutlineScore outlineScore = existingOutlineScores.stream()
                            .filter(os -> os.getScoreId().getId() == scoreId)
                            .findFirst()
                            .orElse(null);

                    if (outlineScore != null) {
                        // Nếu OutlineScore đã tồn tại, cập nhật nếu cần thiết
                        outlineScore.setPercent(percent);
                        s.update(outlineScore);
                        processedIds.add(outlineScore.getId());
                    } else {
                        // Nếu OutlineScore chưa tồn tại, tạo mới
                        outlineScore = new OutlineScore();
                        outlineScore.setOutlineId(outline);
                        outlineScore.setScoreId(s.get(Score.class, scoreId)); // Liên kết với Score dựa trên scoreId
                        outlineScore.setPercent(percent);
                        s.save(outlineScore);
                        processedIds.add(outlineScore.getId());
                    }
                }
            }

            // delete Outline score not in the new list
            for (OutlineScore os : existingOutlineScores) {
                if (!processedIds.contains(os.getId())) {
                    s.delete(os);
                }
            }

            // resolve preSubs and update OutlineSubject table
            int[] preSubs = Arrays.stream(params.get("preSubs").split(",")).mapToInt(Integer::parseInt).toArray();
            List<OutlineSubject> existingOutlineSubjects = s.createQuery("FROM OutlineSubject WHERE outline_id = :outlineId", OutlineSubject.class)
                    .setParameter("outlineId", outlineId)
                    .getResultList();

            List<Integer> processedSubjectIds = new ArrayList<>(preSubs.length);
            for (int subjectId : preSubs) {
                OutlineSubject outlineSubject = existingOutlineSubjects.stream()
                        .filter(os -> os.getSubjectId().getId() == subjectId)
                        .findFirst()
                        .orElse(null);

                if (outlineSubject != null) {
                    // if OutlineSubject existed, skip
                    processedSubjectIds.add(outlineSubject.getId());
                } else {
                    // if it not existed, create new and update corresspondingly
                    outlineSubject = new OutlineSubject();
                    outlineSubject.setOutlineId(outline);
                    outlineSubject.setSubjectId(s.get(Subject.class, subjectId));
                    outlineSubject.setType("PRE"); // pre-requisite subjects
                    s.save(outlineSubject);
                    processedSubjectIds.add(outlineSubject.getId());
                }
            }

            for (OutlineSubject os : existingOutlineSubjects) {
                if (!processedSubjectIds.contains(os.getId())) {
                    s.delete(os);
                }
            }

            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    @Autowired
    private FileStorageService fileStorageService;

    @Autowired
    private DocumentService documentService;

    @Override
    public boolean accept(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Outline o = s.get(Outline.class, id);

        try {
            // Tạo file PDF từ thông tin được truyền vào
            ByteArrayInputStream pdfInputStream = this.pdfService.createPdf(o);

            // Lưu file PDF vào hệ thống tạm thời
            File tempFile = File.createTempFile("document", ".pdf");
            try (FileOutputStream fos = new FileOutputStream(tempFile)) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = pdfInputStream.read(buffer)) != -1) {
                    fos.write(buffer, 0, bytesRead);
                }
            }

            // Upload file lên dịch vụ lưu trữ (ví dụ: S3)
            String fileUrl = fileStorageService.uploadFile(tempFile);

            // Lưu thông tin Document vào cơ sở dữ liệu
            Document document = this.documentService.saveDocument(
                    o.getSubjectId().getName(),
                    fileUrl,
                    o.getId()
            );

            o.setStatus("ACCEPTED");
            s.update(o);

            return true;
        } catch (IOException ex) {
            ex.printStackTrace(); // Xử lý ngoại lệ theo logic của bạn
            return false;
        }
    }

    @Override
    public Outline getAnOutlineById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Outline o = s.get(Outline.class, id);
        return o;
    }

    @Override
    public String getDocumentUrl(int outlineId) {
        Session s = this.factory.getObject().getCurrentSession();
        Outline o = s.get(Outline.class, outlineId);
        return o.getDocumentId().getUrl();
    }
}
