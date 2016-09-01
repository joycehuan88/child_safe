package com.childsafe.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * Created by ZhangHuan on 17/08/2016.
 */
@Entity
public class Suburb {



    @Id
    @GeneratedValue
    private int suburbId;
    private String suburbname;
    private String postCode;

    @ManyToOne
    @JoinColumn(name = "councilId")
    @JsonIgnore
    private Council council;

    @Transient
    private List<String> infoList;

    public int getSuburbId() {
        return suburbId;
    }

    public void setSuburbId(int suburbId) {
        this.suburbId = suburbId;
    }

    public Council getCouncil() {
        return council;
    }

    public void setCouncil(Council council) {
        this.council = council;
    }

    public String getSuburbName() {
        return suburbname;
    }

    public void setSuburbName(String suburbName) {
        this.suburbname = suburbName;
    }

    public String getPostCode() {
        return postCode;
    }

    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }

    public List<String> getInfoList() {
        return infoList;
    }

    public void setInfoList(List<String> infoList) {
        this.infoList = infoList;
    }
}
