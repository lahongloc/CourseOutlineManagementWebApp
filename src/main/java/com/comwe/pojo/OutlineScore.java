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
@Table(name = "outline_score")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OutlineScore.findAll", query = "SELECT o FROM OutlineScore o"),
    @NamedQuery(name = "OutlineScore.findById", query = "SELECT o FROM OutlineScore o WHERE o.id = :id"),
    @NamedQuery(name = "OutlineScore.findByPercent", query = "SELECT o FROM OutlineScore o WHERE o.percent = :percent")})
public class OutlineScore implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "percent")
    private Float percent;
    @JoinColumn(name = "outline_id", referencedColumnName = "id")
    @ManyToOne
    private Outline outlineId;
    @JoinColumn(name = "score_id", referencedColumnName = "id")
    @ManyToOne
    private Score scoreId;

    public OutlineScore() {
    }

    public OutlineScore(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Float getPercent() {
        return percent;
    }

    public void setPercent(Float percent) {
        this.percent = percent;
    }

    public Outline getOutlineId() {
        return outlineId;
    }

    public void setOutlineId(Outline outlineId) {
        this.outlineId = outlineId;
    }

    public Score getScoreId() {
        return scoreId;
    }

    public void setScoreId(Score scoreId) {
        this.scoreId = scoreId;
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
        if (!(object instanceof OutlineScore)) {
            return false;
        }
        OutlineScore other = (OutlineScore) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.comwe.pojo.OutlineScore[ id=" + id + " ]";
    }
    
}
