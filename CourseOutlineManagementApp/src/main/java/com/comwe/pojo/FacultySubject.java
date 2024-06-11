/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author lahon
 */
@Entity
@Table(name = "faculty_subject")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "FacultySubject.findAll", query = "SELECT f FROM FacultySubject f"),
    @NamedQuery(name = "FacultySubject.findById", query = "SELECT f FROM FacultySubject f WHERE f.id = :id")})
public class FacultySubject implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @JoinColumn(name = "faculty_id", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    @JsonIgnore
    private Faculty facultyId;
    @JoinColumn(name = "subject_id", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    @JsonIgnore
    private Subject subjectId;

    public FacultySubject() {
    }

    public FacultySubject(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Faculty getFacultyId() {
        return facultyId;
    }

    public void setFacultyId(Faculty facultyId) {
        this.facultyId = facultyId;
    }

    public Subject getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Subject subjectId) {
        this.subjectId = subjectId;
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
        if (!(object instanceof FacultySubject)) {
            return false;
        }
        FacultySubject other = (FacultySubject) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.comwe.pojo.FacultySubject[ id=" + id + " ]";
    }
    
}
