/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
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
public class VoteFacade extends AbstractFacade<Vote> {

    @PersistenceContext(unitName = "EnterpriseApplication1-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public VoteFacade() {
        super(Vote.class);
    }
    
    public boolean userHasVotedPosition(MyUser voter, Position pos){
        Query query = em.createNamedQuery("Vote.userHasVotedPosition");
        query.setParameter("voter", voter);
        query.setParameter("pos", pos);
        
        return (query.getResultList().size() > 0);
    }
    
    public int numberOfUniqueVoters(){
        List<Vote> all = this.findAll();
        List<Long> uniqueVotersId = new ArrayList<Long>();
        for(Vote v : all){
            if (!uniqueVotersId.contains(v.getVoted_by().getId())){
                uniqueVotersId.add(v.getVoted_by().getId());
            }
        }
        return uniqueVotersId.size();
    }
    
}
