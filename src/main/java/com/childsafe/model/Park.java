package com.childsafe.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

/**
 * Created by ZhangHuan on 1/09/2016.
 */
@Entity
public class Park {

    @Id
    @GeneratedValue
    private int parkId;
    @ManyToOne
    @JoinColumn(name = "councilId")
    @JsonIgnore
    private Council council;

    private String suburb;
    private String Street;
    private String parkname;
    private String facility;
    private String carparking;
    private String toddler;
    private String sunshade;
    private String bbq;
    private String toilet;
    private String bikepath;
    private String fenced;
    private Double latitude;
    private Double longitude;

    public int getParkId() {
        return parkId;
    }

    public void setParkId(int parkId) {
        this.parkId = parkId;
    }

    public Council getCouncil() {
        return council;
    }

    public void setCouncil(Council council) {
        this.council = council;
    }

    public String getSuburb() {
        return suburb;
    }

    public void setSuburb(String suburb) {
        this.suburb = suburb;
    }

    public String getStreet() {
        return Street;
    }

    public void setStreet(String street) {
        Street = street;
    }

    public String getPark_name() {
        return parkname;
    }

    public void setPark_name(String park_name) {
        this.parkname = park_name;
    }

    public String getFacility() {
        return facility;
    }

    public void setFacility(String facility) {
        this.facility = facility;
    }

    public String getCar_parking() {
        return carparking;
    }

    public void setCar_parking(String car_parking) {
        this.carparking = car_parking;
    }

    public String getToddler() {
        return toddler;
    }

    public void setToddler(String toddler) {
        this.toddler = toddler;
    }

    public String getSun_shade() {
        return sunshade;
    }

    public void setSun_shade(String sun_shade) {
        this.sunshade = sun_shade;
    }

    public String getBbq() {
        return bbq;
    }

    public void setBbq(String bbq) {
        this.bbq = bbq;
    }

    public String getToilet() {
        return toilet;
    }

    public void setToilet(String toilet) {
        this.toilet = toilet;
    }

    public String getBikepath() {
        return bikepath;
    }

    public void setBikepath(String bikepath) {
        this.bikepath = bikepath;
    }

    public String getFenced() {
        return fenced;
    }

    public void setFenced(String fenced) {
        this.fenced = fenced;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }
}
