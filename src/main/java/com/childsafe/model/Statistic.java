package com.childsafe.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * Created by ZhangHuan on 6/09/2016.
 */
@Entity
public class Statistic {

    @Id
    @GeneratedValue
    private int statId;

    private String councilname;
    private String type;
    private Double stat12;
    private Double stat13;
    private Double stat14;
    private Double stat15;
    private Double stat16;

    public int getStatId() {
        return statId;
    }

    public void setStatId(int statId) {
        this.statId = statId;
    }

    public String getCouncilname() {
        return councilname;
    }

    public void setCouncilname(String councilname) {
        this.councilname = councilname;
    }

    public Double getStat12() {
        return stat12;
    }

    public void setStat12(Double stat12) {
        this.stat12 = stat12;
    }

    public Double getStat13() {
        return stat13;
    }

    public void setStat13(Double stat13) {
        this.stat13 = stat13;
    }

    public Double getStat14() {
        return stat14;
    }

    public void setStat14(Double stat14) {
        this.stat14 = stat14;
    }

    public Double getStat15() {
        return stat15;
    }

    public void setStat15(Double stat15) {
        this.stat15 = stat15;
    }

    public Double getStat16() {
        return stat16;
    }

    public void setStat16(Double stat16) {
        this.stat16 = stat16;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
