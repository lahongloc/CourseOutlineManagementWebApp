/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.pojo;

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
    @NamedQuery(name = "Outline.findByStartedDate", query = "SELECT o FROM Outline o WHERE o.startedDate = :startedDate"),
    @NamedQuery(name = "Outline.findByExpiredDate", query = "SELECT o FROM Outline o WHERE o.expiredDate = :expiredDate"),
    @NamedQuery(name = "Outline.findByTitle", query = "SELECT o FROM Outline o WHERE o.title = :title"),
    @NamedQuery(name = "Outline.findByContentFile", query = "SELECT o FROM Outline o WHERE o.contentFile = :contentFile"),
    @NamedQuery(name = "Outline.findByCreditHour", query = "SELECT o FROM Outline o WHERE o.creditHour = :creditHour")})
public class Outline implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "startedDate")
    @Temporal(TemporalType.DATE)
    private Date startedDate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "expiredDate")
    @Temporal(TemporalType.DATE)
    private Date expiredDate;
    @Size(max = 100)
    @Column(name = "title")
    private String title;
    @Size(max = 500)
    @Column(name = "contentFile")
    private String contentFile;
    @Basic(optional = false)
    @NotNull
    @Column(name = "creditHour")
    private int creditHour;
    @OneToMany(mappedBy = "outlineId")
    private Set<Feedback> feedbackSet;
    @JoinColumn(name = "lecturer_id", referencedColumnName = "id")
    @ManyToOne
    private Lecturer lecturerId;
    @JoinColumn(name = "subject_id", referencedColumnName = "id")
    @ManyToOne
    private Subject subjectId;
    @OneToMany(mappedBy = "outlineId")
    private Set<Comment> commentSet;

    public Outline() {
    }

    public Outline(Integer id) {
        this.id = id;
    }

    public Outline(Integer id, Date startedDate, Date expiredDate, int creditHour) {
        this.id = id;
        this.startedDate = startedDate;
        this.expiredDate = expiredDate;
        this.creditHour = creditHour;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getStartedDate() {
        return startedDate;
    }

    public void setStartedDate(Date startedDate) {
        this.startedDate = startedDate;
    }

    public Date getExpiredDate() {
        return expiredDate;
    }

    public void setExpiredDate(Date expiredDate) {
        this.expiredDate = expiredDate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContentFile() {
        return contentFile;
    }

    public void setContentFile(String contentFile) {
        this.contentFile = contentFile;
    }

    public int getCreditHour() {
        return creditHour;
    }

    public void setCreditHour(int creditHour) {
        this.creditHour = creditHour;
    }

    @XmlTransient
    public Set<Feedback> getFeedbackSet() {
        return feedbackSet;
    }

    public void setFeedbackSet(Set<Feedback> feedbackSet) {
        this.feedbackSet = feedbackSet;
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
