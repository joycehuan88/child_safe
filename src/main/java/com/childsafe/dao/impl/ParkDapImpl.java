package com.childsafe.dao.impl;

import com.childsafe.dao.ParkDao;
import com.childsafe.model.Park;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ZhangHuan on 1/09/2016.
 */
@Repository
@Transactional
public class ParkDapImpl implements ParkDao {

    @Autowired
    private SessionFactory sessionFactory;

    public Park getParkbById(int parkId) {
        Session session = sessionFactory.getCurrentSession();
        return (Park) session.get(Park.class, parkId);
    }

    public List<Park> getAllParks() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Park");
        List<Park> parkList = query.list();

        return parkList;
    }

    public Park getParkByName(String parkname) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Park where parkname = ?");
        query.setString(0, parkname);

        return (Park) query.uniqueResult();
    }
    public List<Park> getParkByFilter(String toilet, String carparking,String toddler,String fenced,String bikepath) {
        Session session = sessionFactory.getCurrentSession();
        String queryString = "from Park where";
        if(toilet.equals("Y")){
            queryString = queryString+" toilet = 'Y'";
            if(carparking.equals("Y")|| toddler.equals("Y")||fenced.equals("Y") || bikepath.equals("Y")){
                queryString = queryString+" and ";
            }
        }

        if(carparking.equals("Y")){
            queryString = queryString+" carparking = 'Y' ";
            if(toddler.equals("Y")||fenced.equals("Y") || bikepath.equals("Y")){
                queryString = queryString+" and ";
            }
        }
        if(toddler.equals("Y")){
            queryString = queryString+" toddler = 'Y' ";
            if(fenced.equals("Y") || bikepath.equals("Y")){
                queryString = queryString+" and ";
            }
        }
        if(fenced.equals("Y")){
            queryString = queryString+" fenced = 'Y' ";
            if(bikepath.equals("Y")){
                queryString = queryString+" and ";
            }
        }
        if(bikepath.equals("Y")){
            queryString = queryString+" bikepath = 'Y' ";
        }
        System.out.println(queryString);
        //Query query = session.createQuery("from Park where toilet = ? and carparking = ? and toddler = ?and fenced = ?and bikepath = ?");
//        query.setString(0, toilet);
//        query.setString(1, carparking);
//        query.setString(2, toddler);
//        query.setString(3, fenced);
//        query.setString(4, bikepath);
        Query query = session.createQuery(queryString);
        List<Park> parkList = query.list();

        return parkList;
    }

    public void addPark(Park park) {

        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(park);
        session.flush();
    }
}
