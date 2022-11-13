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
public class PositionFacade extends AbstractFacade<Position> {

    @PersistenceContext(unitName = "EnterpriseApplication1-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PositionFacade() {
        super(Position.class);
    }
    
    public Position findPositionName(String name) {
        Position found = null;

        Query query = em.createNamedQuery("Position.findPosition");
        query.setParameter("pos", name);
        List<Position> all = query.getResultList();
        if (all.size() > 0) {
            found = all.get(0);
        }
        
        return found;

    }
    
    public List<Position> findAllPositionLike(String name){
        Query query = em.createNamedQuery("Position.findAllPositionLike");
        query.setParameter("pos", "%" + name + "%");
        List<Position> all = query.getResultList();

        return all;

    }
}
