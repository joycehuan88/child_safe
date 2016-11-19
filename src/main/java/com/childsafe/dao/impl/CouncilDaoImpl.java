package com.childsafe.dao.impl;

import com.childsafe.dao.CouncilDao;
import com.childsafe.model.Council;
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
public class CouncilDaoImpl implements CouncilDao {


    @Autowired
    private SessionFactory sessionFactory;

    public Council getCouncilById(int councilId) {
        Session session = sessionFactory.getCurrentSession();
        return (Council) session.get(Council.class, councilId);
    }

    public List<Council> getAllCouncils() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from heroku_6ff4c4abec8fdf8.Council");
        List<Council> councilList = query.list();

        return councilList;
    }

    public Council getCouncilByCouncilName(String councilname) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from heroku_6ff4c4abec8fdf8.Council where councilname = ?");
        query.setString(0, councilname);

        return (Council) query.uniqueResult();
    }

    public void addCouncil(Council council) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(council);
        session.flush();
    }

    public List<Council> getCouncilByCrimeRate(){
        Session session = sessionFactory.getCurrentSession();
        String queryString = "FROM heroku_6ff4c4abec8fdf8.Council WHERE crime_rate IN (SELECT MIN(crime_rate) FROM heroku_6ff4c4abec8fdf8.Council)";
        Query query = session.createQuery(queryString);
        List<Council> councilList = query.list();
        return councilList;
    }
    public List<Council> getCouncilByAbuseRate(){
        Session session = sessionFactory.getCurrentSession();
        String queryString = "FROM heroku_6ff4c4abec8fdf8.Council WHERE abuse_rate IN (SELECT MIN(abuse_rate) FROM heroku_6ff4c4abec8fdf8.Council)";
        Query query = session.createQuery(queryString);
        List<Council> councilList = query.list();
        return councilList;
    }
    public List<Council> getCouncilByVaccRate(){
        Session session = sessionFactory.getCurrentSession();
        String queryString = "FROM heroku_6ff4c4abec8fdf8.Council WHERE vacc_rate IN (SELECT MAX(vacc_rate) FROM heroku_6ff4c4abec8fdf8.Council)";
        Query query = session.createQuery(queryString);
        List<Council> councilList = query.list();
        return councilList;
    }

    public List<Council> getCouncilByBullyRate(){
        Session session = sessionFactory.getCurrentSession();
        String queryString = "FROM heroku_6ff4c4abec8fdf8.Council WHERE bullying_rate IN (SELECT MIN(bullying_rate) FROM heroku_6ff4c4abec8fdf8.Council)";
        Query query = session.createQuery(queryString);
        List<Council> councilList = query.list();
        return councilList;
    }
    public List<Council> getCouncilByDrugRate(){
        Session session = sessionFactory.getCurrentSession();
        String queryString = "FROM heroku_6ff4c4abec8fdf8.Council WHERE drug_dealing IN (SELECT MIN(drug_dealing) FROM heroku_6ff4c4abec8fdf8.Council)";
        Query query = session.createQuery(queryString);
        List<Council> councilList = query.list();
        return councilList;
    }
    public List<Council> getCouncilByAbdctionRate(){
        Session session = sessionFactory.getCurrentSession();
        String queryString = "FROM heroku_6ff4c4abec8fdf8.Council WHERE abduction_rated IN (SELECT MIN(abduction_rated) FROM heroku_6ff4c4abec8fdf8.Council)";
        Query query = session.createQuery(queryString);
        List<Council> councilList = query.list();
        return councilList;
    }

    public List<Council> getCouncilByBlackmailRate(){
        Session session = sessionFactory.getCurrentSession();
        String queryString = "FROM heroku_6ff4c4abec8fdf8.Council WHERE blackmail_extortion IN (SELECT MIN(blackmail_extortion) FROM heroku_6ff4c4abec8fdf8.Council)";
        Query query = session.createQuery(queryString);
        List<Council> councilList = query.list();
        return councilList;
    }

    public List<Council> getCouncilBySexualRate(){
        Session session = sessionFactory.getCurrentSession();
        String queryString = "FROM heroku_6ff4c4abec8fdf8.Council WHERE sexual_offense IN (SELECT MIN(sexual_offense) FROM heroku_6ff4c4abec8fdf8.Council)";
        Query query = session.createQuery(queryString);
        List<Council> councilList = query.list();
        return councilList;
    }



}
