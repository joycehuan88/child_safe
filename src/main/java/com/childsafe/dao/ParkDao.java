package com.childsafe.dao;

import com.childsafe.model.Park;

import java.util.List;

/**
 * Created by ZhangHuan on 1/09/2016.
 */
public interface ParkDao {


    Park getParkbById (int parkId);

    List<Park> getAllParks();

    Park getParkByName (String parkname);

    void addPark(Park park);
    List<Park> getParkByFilter(String toilet, String parking,String toddler,String fenced,String bike);
}
