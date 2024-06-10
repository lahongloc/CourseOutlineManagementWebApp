/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author kitj3
 */
@Entity
@Table(name = "student_outline_download")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StudentOutlineDownload.findAll", query = "SELECT s FROM StudentOutlineDownload s"),
    @NamedQuery(name = "StudentOutlineDownload.findById", query = "SELECT s FROM StudentOutlineDownload s WHERE s.id = :id"),
    @NamedQuery(name = "StudentOutlineDownload.findByDownloadedDate", query = "SELECT s FROM StudentOutlineDownload s WHERE s.downloadedDate = :downloadedDate")})
public class StudentOutlineDownload implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "downloaded_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date downloadedDate;
    @JoinColumn(name = "outline_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    @JsonIgnore
    private Outline outlineId;
    @JoinColumn(name = "student_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    @JsonIgnore
    private Student studentId;

    public StudentOutlineDownload() {
    }

    public StudentOutlineDownload(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDownloadedDate() {
        return downloadedDate;
    }

    public void setDownloadedDate(Date downloadedDate) {
        this.downloadedDate = downloadedDate;
    }

    public Outline getOutlineId() {
        return outlineId;
    }

    public void setOutlineId(Outline outlineId) {
        this.outlineId = outlineId;
    }

    public Student getStudentId() {
        return studentId;
    }

    public void setStudentId(Student studentId) {
        this.studentId = studentId;
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
        if (!(object instanceof StudentOutlineDownload)) {
            return false;
        }
        StudentOutlineDownload other = (StudentOutlineDownload) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.comwe.pojo.StudentOutlineDownload[ id=" + id + " ]";
    }
    
}
