/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.pojo;

import java.io.Serializable;
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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author lahon
 */
@Entity
@Table(name = "outline_academic_year")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OutlineAcademicYear.findAll", query = "SELECT o FROM OutlineAcademicYear o"),
    @NamedQuery(name = "OutlineAcademicYear.findById", query = "SELECT o FROM OutlineAcademicYear o WHERE o.id = :id")})
public class OutlineAcademicYear implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @JoinColumn(name = "academic_year_id", referencedColumnName = "id")
    @ManyToOne
    private AcademicYear academicYearId;
    @JoinColumn(name = "outline_id", referencedColumnName = "id")
    @ManyToOne
    private Outline outlineId;

    public OutlineAcademicYear() {
    }

    public OutlineAcademicYear(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public AcademicYear getAcademicYearId() {
        return academicYearId;
    }

    public void setAcademicYearId(AcademicYear academicYearId) {
        this.academicYearId = academicYearId;
    }

    public Outline getOutlineId() {
        return outlineId;
    }

    public void setOutlineId(Outline outlineId) {
        this.outlineId = outlineId;
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
        if (!(object instanceof OutlineAcademicYear)) {
            return false;
        }
        OutlineAcademicYear other = (OutlineAcademicYear) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.comwe.pojo.OutlineAcademicYear[ id=" + id + " ]";
    }
    
}
