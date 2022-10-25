/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 *
 * @author carl
 */
@Entity
public class Vote implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToOne
    private Student voted_by;
    @ManyToOne
    private Seat voted_for;
    private Long time_voted;

    public Student getVoted_by() {
        return voted_by;
    }

    public void setVoted_by(Student voted_by) {
        this.voted_by = voted_by;
    }

    public Seat getVoted_for() {
        return voted_for;
    }

    public void setVoted_for(Seat voted_for) {
        this.voted_for = voted_for;
    }

    public Long getTime_voted() {
        return time_voted;
    }

    public void setTime_voted(Long time_voted) {
        this.time_voted = time_voted;
    }
    
    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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
        if (!(object instanceof Vote)) {
            return false;
        }
        Vote other = (Vote) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Vote[ id=" + id + " ]";
    }
    
}
