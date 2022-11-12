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
public class MyUserFacade extends AbstractFacade<MyUser> {

    @PersistenceContext(unitName = "EnterpriseApplication1-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MyUserFacade() {
        super(MyUser.class);
    }
    
    
   public List<MyUser> findAllCommitteeUsernameSimilarTo(String username){
        Query query = em.createNamedQuery("MyUser.findAllCommitteeUsernameSimilarTo");
        query.setParameter("username", "%" + username + "%");
        List<MyUser> all = query.getResultList(); 

        return all; 
        
    }
    
    public MyUser findUsername(String username){
        MyUser found = null; 
        
        Query query = em.createNamedQuery("MyUser.findUsername");
        query.setParameter("username", username);
        List<MyUser> all = query.getResultList(); 
        if (all.size() > 0 ){
            found = all.get(0);
        }
        
        return found; 
        
    }
    
    
    
}
