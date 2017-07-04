package com.endercrest.uwaterlooapi.foodservices.models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 12/1/2016.
 */
public class FoodServiceAnnouncement {

    private String date;
    @SerializedName("ad_text")
    private String adText;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAdText() {
        return adText;
    }

    public void setAdText(String adText) {
        this.adText = adText;
    }
}
