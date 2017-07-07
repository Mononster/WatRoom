package com.endercrest.uwaterlooapi.base.models;

import com.google.gson.annotations.SerializedName;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 11/27/2016.
 */
public class UWLocation {

    @SerializedName("outlet_id")
    private int outletId;
    @SerializedName("outlet_name")
    private String outletName;
    private String building;
    private String logo;
    private float latitude;
    private float longitude;
    private String description;
    private String notice;
    @SerializedName("is_open_now")
    private boolean isOpenNow;
    @SerializedName("opening_hours")
    private UWOpenHours openingHours;
    @SerializedName("special_hours")
    private List<UWSpecialDay> specialHours;
    @SerializedName("dates_closed")
    private List<String> datesClosed;

    public int getOutletId() {
        return outletId;
    }

    public void setOutletId(int outletId) {
        this.outletId = outletId;
    }

    public String getOutletName() {
        return outletName;
    }

    public void setOutletName(String outletName) {
        this.outletName = outletName;
    }

    public String getBuilding() {
        return building;
    }

    public void setBuilding(String building) {
        this.building = building;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public float getLatitude() {
        return latitude;
    }

    public void setLatitude(float latitude) {
        this.latitude = latitude;
    }

    public float getLongitude() {
        return longitude;
    }

    public void setLongitude(float longitude) {
        this.longitude = longitude;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice;
    }

    public boolean isOpenNow() {
        return isOpenNow;
    }

    public void setOpenNow(boolean openNow) {
        isOpenNow = openNow;
    }

    public UWOpenHours getOpeningHours() {
        return openingHours;
    }

    public void setOpeningHours(UWOpenHours openingHours) {
        this.openingHours = openingHours;
    }

    public List<UWSpecialDay> getSpecialHours() {
        return specialHours;
    }

    public void setSpecialHours(List<UWSpecialDay> specialHours) {
        this.specialHours = specialHours;
    }

    public List<String> getDatesClosed() {
        return datesClosed;
    }

    public void setDatesClosed(List<String> datesClosed) {
        this.datesClosed = datesClosed;
    }
}
