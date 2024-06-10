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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author kitj3
 */
@Entity
@Table(name = "outline_subject")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OutlineSubject.findAll", query = "SELECT o FROM OutlineSubject o"),
    @NamedQuery(name = "OutlineSubject.findById", query = "SELECT o FROM OutlineSubject o WHERE o.id = :id"),
    @NamedQuery(name = "OutlineSubject.findByType", query = "SELECT o FROM OutlineSubject o WHERE o.type = :type")})
public class OutlineSubject implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 50)
    @Column(name = "type")
    private String type;
    @JoinColumn(name = "outline_id", referencedColumnName = "id")
    @ManyToOne
    @JsonIgnore
    private Outline outlineId;
    @JoinColumn(name = "subject_id", referencedColumnName = "id")
    @ManyToOne
    @JsonIgnore
    private Subject subjectId;

    public OutlineSubject() {
    }

    public OutlineSubject(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Outline getOutlineId() {
        return outlineId;
    }

    public void setOutlineId(Outline outlineId) {
        this.outlineId = outlineId;
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
        if (!(object instanceof OutlineSubject)) {
            return false;
        }
        OutlineSubject other = (OutlineSubject) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.comwe.pojo.OutlineSubject[ id=" + id + " ]";
    }
    
}
