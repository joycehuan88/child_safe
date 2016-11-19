package com.childsafe.dao.impl;

import com.childsafe.dao.SuburbDao;
import com.childsafe.model.Council;
import com.childsafe.model.Suburb;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ZhangHuan on 19/08/2016.
 */
@Repository
@Transactional
public class SuburbDaoImpl implements SuburbDao {

    @Autowired
    private SessionFactory sessionFactory;

    public Suburb getSuburbById(int suburbId) {
        Session session = sessionFactory.getCurrentSession();
        return (Suburb) session.get(Suburb.class, suburbId);
    }

    public List<Suburb> getAllSuburbs() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Suburb");
        List<Suburb> suburbList = query.list();

        return suburbList;
    }

    public Suburb getSuburbByName(String suburbname) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Suburb where suburbname = ?");
        query.setString(0, suburbname);

        return (Suburb) query.uniqueResult();
    }

    public void addSuburb(Suburb suburb) {

        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(suburb);
        session.flush();

    }
}
