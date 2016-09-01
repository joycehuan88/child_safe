package com.childsafe.dao;

import com.childsafe.model.Council;

import java.util.List;

/**
 * Created by ZhangHuan on 19/08/2016.
 */
public interface CouncilDao {


    Council getCouncilById (int councilId);

    List<Council> getAllCouncils();

    Council getCouncilByCouncilName (String councilname);

    void addCouncil(Council council);

    List<Council> getCouncilByCrimeRate();

    List<Council> getCouncilByAbuseRate();

    List<Council> getCouncilByVaccRate();

    List<Council> getCouncilByBullyRate();

    List<Council> getCouncilByDrugRate();

    List<Council> getCouncilByAbdctionRate();

    List<Council> getCouncilByBlackmailRate();

    List<Council> getCouncilBySexualRate();
}
