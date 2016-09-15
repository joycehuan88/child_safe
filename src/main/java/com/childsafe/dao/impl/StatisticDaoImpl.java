package com.childsafe.dao.impl;

import com.childsafe.dao.StatisticDao;
import com.childsafe.model.Statistic;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ZhangHuan on 6/09/2016.
 */
@Repository
@Transactional
public class StatisticDaoImpl implements StatisticDao {

    @Autowired
    private SessionFactory sessionFactory;

    public Statistic getStatisticById(int statId) {
        Session session = sessionFactory.getCurrentSession();
        return (Statistic) session.get(Statistic.class, statId);
    }

    public List<Statistic> getAllStatistics() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Statistic");
        List<Statistic> statisticList = query.list();

        return statisticList;
    }

    public List<Statistic>  getStatisticByCouncilName(String councilName) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Statistic where councilname = ?");
        query.setString(0, councilName);
        List<Statistic> statisticList = query.list();

        return statisticList;
    }

    public void addStatistic(Statistic statistic) {

        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(statistic);
        session.flush();
    }
}
