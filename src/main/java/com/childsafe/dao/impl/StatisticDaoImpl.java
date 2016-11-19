package com.childsafe.dao.impl;

import com.childsafe.dao.StatisticDao;
import com.childsafe.model.Statistic;
import org.hibernate.*;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

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
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Query query = session.createQuery("from Statistic where councilname = ?");
        query.setString(0, councilName);
        List<Statistic> statisticList = query.list();
        session.getTransaction().commit();
        session.close();

        return statisticList;
    }


    public void addStatistic(Statistic statistic) {

        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(statistic);
        session.flush();
    }

    public JSONArray getAverageStat(){

        Session session = sessionFactory.openSession();
        session.beginTransaction();
        JSONArray jsonArray = new JSONArray();
        String hql = " SELECT  ROUND(avg(stat12),2) as AVGABDUCTION2012, ROUND(avg(stat13),2) as AVGABDUCTION2013, ROUND(avg(stat14),2) as AVGABDUCTION2014, ROUND(avg(stat15),2) as AVGABDUCTION2015,ROUND(avg(stat16),2) as AVGABDUCTION2016 FROM Statistic  where type='abduction' ";
        Query abductionquery = session.createQuery(hql);
        abductionquery.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
        List abductiondata = abductionquery.list();

        JSONObject abductionobj = new JSONObject();

        for(Object object : abductiondata)
        {
            Map row = (Map)object;
            abductionobj.put("2012", row.get("AVGABDUCTION2012"));
            abductionobj.put("2013", row.get("AVGABDUCTION2013"));
            abductionobj.put("2014", row.get("AVGABDUCTION2014"));
            abductionobj.put("2015", row.get("AVGABDUCTION2015"));
            abductionobj.put("2016", row.get("AVGABDUCTION2016"));
        }
        jsonArray.add(abductionobj);
        System.out.println("Abdction :"+abductionobj.toJSONString());
        session.getTransaction().commit();


        session.getTransaction().begin();

        Query sexualQuery = session.createQuery("SELECT ROUND(avg(stat12),2) as AVGSEXUAL2012, ROUND(avg(stat13),2) as AVGSEXUAL2013, ROUND(avg(stat14),2) as AVGSEXUAL2014, ROUND(avg(stat15),2) as AVGSEXUAL2015, ROUND(avg(stat16),2) as AVGSEXUAL2016  FROM Statistic  where type='sexual'");
        sexualQuery.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
        List sexualData = sexualQuery.list();
        JSONObject sexualObj = new JSONObject();

        for (Object object : sexualData) {
            Map row = (Map) object;
            sexualObj.put("2012", row.get("AVGSEXUAL2012"));
            sexualObj.put("2013", row.get("AVGSEXUAL2013"));
            sexualObj.put("2014", row.get("AVGSEXUAL2014"));
            sexualObj.put("2015", row.get("AVGSEXUAL2015"));
            sexualObj.put("2016", row.get("AVGSEXUAL2016"));

        }
        jsonArray.add(sexualObj);
        System.out.println("sexual:"+sexualObj.toJSONString());
        session.getTransaction().commit();

        session.getTransaction().begin();
        Query crimeQuery = session.createQuery("SELECT   ROUND(avg(stat12),2) as AVGCRIME2012, ROUND(avg(stat13),2) as AVGCRIME2013, ROUND(avg(stat14),2) as AVGCRIME2014, ROUND(avg(stat15),2) as AVGCRIME2015, ROUND(avg(stat16),2) as AVGCRIME2016 FROM Statistic  where type='crime'");
        crimeQuery.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
        List crimeData = crimeQuery.list();
        JSONObject crimeObj = new JSONObject();
        for(Object object : crimeData) {
            Map row = (Map) object;
            crimeObj.put("2012", row.get("AVGCRIME2012"));
            crimeObj.put("2013", row.get("AVGCRIME2013"));
            crimeObj.put("2014", row.get("AVGCRIME2014"));
            crimeObj.put("2015", row.get("AVGCRIME2015"));
            crimeObj.put("2016", row.get("AVGCRIME2016"));

        }
        jsonArray.add(crimeObj);
        System.out.println("crime:"+crimeObj.toJSONString());
        session.getTransaction().commit();



        session.getTransaction().begin();
        Query bullyQuery = session.createQuery("SELECT   ROUND(avg(stat12),2) as AVGBULLY2012, ROUND(avg(stat13),2) as AVGBULLY2013, ROUND(avg(stat14),2) as AVGBULLY2014, ROUND(avg(stat15),2) as AVGBULLY2015, ROUND(avg(stat16),2) as AVGBULLY2016 FROM Statistic  where type='bully'");
        bullyQuery.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
        List bullyData = bullyQuery.list();
        JSONObject bullyObj = new JSONObject();
        for(Object object : bullyData)
        {
            Map row = (Map)object;
            bullyObj.put("2012", row.get("AVGBULLY2012"));
            bullyObj.put("2013", row.get("AVGBULLY2013"));
            bullyObj.put("2014", row.get("AVGBULLY2014"));
            bullyObj.put("2015", row.get("AVGBULLY2015"));
            bullyObj.put("2016", row.get("AVGBULLY2016"));

        }
        jsonArray.add(bullyObj);
        System.out.println("bully:"+bullyObj.toJSONString());


        session.close();
        return jsonArray;

    }

}
