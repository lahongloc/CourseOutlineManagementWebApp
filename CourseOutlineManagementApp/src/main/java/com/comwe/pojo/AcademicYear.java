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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author kitj3
 */
@Entity
@Table(name = "academic_year")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AcademicYear.findAll", query = "SELECT a FROM AcademicYear a"),
    @NamedQuery(name = "AcademicYear.findById", query = "SELECT a FROM AcademicYear a WHERE a.id = :id"),
    @NamedQuery(name = "AcademicYear.findByName", query = "SELECT a FROM AcademicYear a WHERE a.name = :name"),
    @NamedQuery(name = "AcademicYear.findByStart", query = "SELECT a FROM AcademicYear a WHERE a.start = :start"),
    @NamedQuery(name = "AcademicYear.findByFinish", query = "SELECT a FROM AcademicYear a WHERE a.finish = :finish")})
public class AcademicYear implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 50)
    @Column(name = "name")
    private String name;
    @Column(name = "start")
    @Temporal(TemporalType.TIMESTAMP)
    private Date start;
    @Column(name = "finish")
    @Temporal(TemporalType.TIMESTAMP)
    private Date finish;
    @OneToMany(mappedBy = "academicYearId")
    private Set<Student> studentSet;
    @OneToMany(mappedBy = "academicYearId")
    private Set<OutlineAcademicYear> outlineAcademicYearSet;
    @OneToMany(mappedBy = "academicYearId")
    private Set<Semester> semesterSet;

    public AcademicYear() {
    }

    public AcademicYear(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getFinish() {
        return finish;
    }

    public void setFinish(Date finish) {
        this.finish = finish;
    }

    @XmlTransient
    public Set<Student> getStudentSet() {
        return studentSet;
    }

    public void setStudentSet(Set<Student> studentSet) {
        this.studentSet = studentSet;
    }

    @XmlTransient
    public Set<OutlineAcademicYear> getOutlineAcademicYearSet() {
        return outlineAcademicYearSet;
    }

    public void setOutlineAcademicYearSet(Set<OutlineAcademicYear> outlineAcademicYearSet) {
        this.outlineAcademicYearSet = outlineAcademicYearSet;
    }

    @XmlTransient
    public Set<Semester> getSemesterSet() {
        return semesterSet;
    }

    public void setSemesterSet(Set<Semester> semesterSet) {
        this.semesterSet = semesterSet;
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
        if (!(object instanceof AcademicYear)) {
            return false;
        }
        AcademicYear other = (AcademicYear) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.comwe.pojo.AcademicYear[ id=" + id + " ]";
    }
    
}
