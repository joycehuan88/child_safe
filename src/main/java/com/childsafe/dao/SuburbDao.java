package com.childsafe.dao;

import com.childsafe.model.Suburb;

import java.util.List;

/**
 * Created by ZhangHuan on 19/08/2016.
 */
public interface SuburbDao {

    Suburb getSuburbById (int suburbId);

    List<Suburb> getAllSuburbs();

    Suburb getSuburbByName (String suburbname);

    void addSuburb(Suburb suburb);

}
