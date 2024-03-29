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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;

/**
 *
 * @author carl
 */
@Entity
@NamedQueries({
    @NamedQuery(name = "Seat.userRegsitered", query = "SELECT s FROM Seat s WHERE s.contested_by = :myuser"),
    @NamedQuery(name = "Seat.seatsWithPosition", query = "SELECT s FROM Seat s WHERE s.seat_for = :position"),

})
public class Seat implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @OneToOne
    private MyUser contested_by; 
    @ManyToOne
    private Position seat_for;

    public MyUser getContested_by() {
        return contested_by;
    }

    public void setContested_by(MyUser contested_by) {
        this.contested_by = contested_by;
    }

    public Position getSeat_for() {
        return seat_for;
    }

    public void setSeat_for(Position seat_for) {
        this.seat_for = seat_for;
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
        if (!(object instanceof Seat)) {
            return false;
        }
        Seat other = (Seat) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Seat[ id=" + id + " ]";
    }
    
}
