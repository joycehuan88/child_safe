package com.childsafe.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * Created by ZhangHuan on 17/08/2016.
 */
@Entity
public class Council  {



    @Id
    @GeneratedValue
    private int councilId;
    private String councilname;
    private double vacc_rate;
    private double crime_rate;
    private double bullying_rate;
    private double abuse_rate;
    private double drug_dealing;
    private double abduction_rated;
    private double blackmail_extortion;
    private double sexual_offense;


    @OneToMany(mappedBy = "council", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Suburb> suburbs;

    public int getCouncilId() {
        return councilId;
    }

    public void setCouncilId(int councilId) {
        this.councilId = councilId;
    }

    public String getCouncilName() {
        return councilname;
    }

    public void setCouncilName(String councilName) {
        this.councilname = councilName;
    }

    public double getVacc_rate() {
        return vacc_rate;
    }

    public void setVacc_rate(double vacc_rate) {
        this.vacc_rate = vacc_rate;
    }

    public double getCrime_rate() {
        return crime_rate;
    }

    public void setCrime_rate(double crime_rate) {
        this.crime_rate = crime_rate;
    }

    public double getBullying_rate() {
        return bullying_rate;
    }

    public void setBullying_rate(double bullying_rate) {
        this.bullying_rate = bullying_rate;
    }

    public double getAbuse_rate() {
        return abuse_rate;
    }

    public void setAbuse_rate(double abuse_rate) {
        this.abuse_rate = abuse_rate;
    }

    public double getDrug_dealing() {
        return drug_dealing;
    }

    public void setDrug_dealing(double drug_dealing) {
        this.drug_dealing = drug_dealing;
    }

    public double getAbduction_rated() {
        return abduction_rated;
    }

    public void setAbduction_rated(double abduction_rated) {
        this.abduction_rated = abduction_rated;
    }

    public double getBlackmail_extortion() {
        return blackmail_extortion;
    }

    public void setBlackmail_extortion(double blackmail_extortion) {
        this.blackmail_extortion = blackmail_extortion;
    }

    public double getSexual_offense() {
        return sexual_offense;
    }

    public void setSexual_offense(double sexual_offense) {
        this.sexual_offense = sexual_offense;
    }

    public List<Suburb> getSuburbs() {
        return suburbs;
    }

    public void setSuburbs(List<Suburb> suburbs) {
        this.suburbs = suburbs;
    }
}
