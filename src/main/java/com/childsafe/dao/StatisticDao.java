package com.childsafe.dao;

import com.childsafe.model.Statistic;

import java.util.List;

/**
 * Created by ZhangHuan on 6/09/2016.
 */
public interface StatisticDao {

    Statistic getStatisticById (int statId);

    List<Statistic> getAllStatistics();

    List<Statistic> getStatisticByCouncilName (String councilName);

    void addStatistic(Statistic statistic);
}
