/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author munky
 */
@Stateless
public class SeatFacade extends AbstractFacade<Seat> {

    @PersistenceContext(unitName = "EnterpriseApplication1-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SeatFacade() {
        super(Seat.class);
    }

    public boolean userAlreadyRegistered(MyUser myuser) {
        Query query = em.createNamedQuery("Seat.userRegsitered");
        query.setParameter("myuser", myuser);
        List<MyUser> all = query.getResultList();

        return (all.size() > 0);
    }
    
    public List<Seat> seatsWithPosition(Position pos) {
        Query query = em.createNamedQuery("Seat.seatsWithPosition");
        query.setParameter("position", pos);
        List<Seat> all = query.getResultList();

        return all;
    }

}
