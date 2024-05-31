/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author lahon
 */
@Entity
@Table(name = "outline")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Outline.findAll", query = "SELECT o FROM Outline o"),
    @NamedQuery(name = "Outline.findById", query = "SELECT o FROM Outline o WHERE o.id = :id"),
    @NamedQuery(name = "Outline.findByStartedDatetime", query = "SELECT o FROM Outline o WHERE o.startedDatetime = :startedDatetime"),
    @NamedQuery(name = "Outline.findByExpiredDatetime", query = "SELECT o FROM Outline o WHERE o.expiredDatetime = :expiredDatetime"),
    @NamedQuery(name = "Outline.findByDescription", query = "SELECT o FROM Outline o WHERE o.description = :description"),
    @NamedQuery(name = "Outline.findByTheoCreditHour", query = "SELECT o FROM Outline o WHERE o.theoCreditHour = :theoCreditHour"),
    @NamedQuery(name = "Outline.findByPracCreditHour", query = "SELECT o FROM Outline o WHERE o.pracCreditHour = :pracCreditHour"),
    @NamedQuery(name = "Outline.findByStatus", query = "SELECT o FROM Outline o WHERE o.status = :status")})
public class Outline implements Serializable {

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "started_datetime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date startedDatetime;
    @Basic(optional = false)
    @Column(name = "expired_datetime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date expiredDatetime;
    @Size(max = 500)
    @Column(name = "description")
    private String description;
    @Basic(optional = false)
    @Column(name = "theo_credit_hour")
    private int theoCreditHour;
    @Basic(optional = false)
    @Column(name = "prac_credit_hour")
    private int pracCreditHour;
//    @Column(name = "status")
//    private Boolean status;
    @Column(name = "status")
    private String status;
    @JsonIgnore
    @OneToMany(mappedBy = "outlineId")
    private Set<OutlineSubject> outlineSubjectSet;
    @JsonIgnore
    @OneToMany(mappedBy = "outlineId")
    private Set<Feedback> feedbackSet;
    @JsonIgnore
    @OneToMany(mappedBy = "outlineId")
    private Set<OutlineScore> outlineScoreSet;
    @JoinColumn(name = "approver_id", referencedColumnName = "id")
    @JsonIgnore
    @ManyToOne
    private Admin approverId;
    @JoinColumn(name = "lecturer_id", referencedColumnName = "id")
    @JsonIgnore
    @ManyToOne
    private Lecturer lecturerId;
    @JoinColumn(name = "subject_id", referencedColumnName = "id")
    @JsonIgnore
    @ManyToOne
    private Subject subjectId;
    @JsonIgnore
    @OneToMany(mappedBy = "outlineId")
    private Set<Comment> commentSet;
    @JsonIgnore
    @OneToMany(mappedBy = "outlineId")
    private Set<OutlineAcademicYear> outlineAcademicYearSet;

    public Outline() {
    }

    public Outline(Integer id) {
        this.id = id;
    }

    public Outline(Integer id, Date startedDatetime, Date expiredDatetime, int theoCreditHour, int pracCreditHour) {
        this.id = id;
        this.startedDatetime = startedDatetime;
        this.expiredDatetime = expiredDatetime;
        this.theoCreditHour = theoCreditHour;
        this.pracCreditHour = pracCreditHour;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getStartedDatetime() {
        return startedDatetime;
    }

    public void setStartedDatetime(Date startedDatetime) {
        this.startedDatetime = startedDatetime;
    }

    public Date getExpiredDatetime() {
        return expiredDatetime;
    }

    public void setExpiredDatetime(Date expiredDatetime) {
        this.expiredDatetime = expiredDatetime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getTheoCreditHour() {
        return theoCreditHour;
    }

    public void setTheoCreditHour(int theoCreditHour) {
        this.theoCreditHour = theoCreditHour;
    }

    public int getPracCreditHour() {
        return pracCreditHour;
    }

    public void setPracCreditHour(int pracCreditHour) {
        this.pracCreditHour = pracCreditHour;
    }

//    public Boolean getStatus() {
//        return status;
//    }
//
//    public void setStatus(Boolean status) {
//        this.setStatus(status);
//    }

    @XmlTransient
    public Set<OutlineSubject> getOutlineSubjectSet() {
        return outlineSubjectSet;
    }

    public void setOutlineSubjectSet(Set<OutlineSubject> outlineSubjectSet) {
        this.outlineSubjectSet = outlineSubjectSet;
    }

    @XmlTransient
    public Set<Feedback> getFeedbackSet() {
        return feedbackSet;
    }

    public void setFeedbackSet(Set<Feedback> feedbackSet) {
        this.feedbackSet = feedbackSet;
    }

    @XmlTransient
    public Set<OutlineScore> getOutlineScoreSet() {
        return outlineScoreSet;
    }

    public void setOutlineScoreSet(Set<OutlineScore> outlineScoreSet) {
        this.outlineScoreSet = outlineScoreSet;
    }

    public Admin getApproverId() {
        return approverId;
    }

    public void setApproverId(Admin approverId) {
        this.approverId = approverId;
    }

    public Lecturer getLecturerId() {
        return lecturerId;
    }

    public void setLecturerId(Lecturer lecturerId) {
        this.lecturerId = lecturerId;
    }

    public Subject getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Subject subjectId) {
        this.subjectId = subjectId;
    }

    @XmlTransient
    public Set<Comment> getCommentSet() {
        return commentSet;
    }

    public void setCommentSet(Set<Comment> commentSet) {
        this.commentSet = commentSet;
    }

    @XmlTransient
    public Set<OutlineAcademicYear> getOutlineAcademicYearSet() {
        return outlineAcademicYearSet;
    }

    public void setOutlineAcademicYearSet(Set<OutlineAcademicYear> outlineAcademicYearSet) {
        this.outlineAcademicYearSet = outlineAcademicYearSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Outline)) {
            return false;
        }
        Outline other = (Outline) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.comwe.pojo.Outline[ id=" + id + " ]";
    }
    
}
