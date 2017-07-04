package com.endercrest.uwaterlooapi.base.models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 12/1/2016.
 */
public class UWSpecialDay{

    private String date;
    @SerializedName("opening_hour")
    private String openingHour;
    @SerializedName("closing_hour")
    private String closingHour;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getOpeningHour() {
        return openingHour;
    }

    public void setOpeningHour(String openingHour) {
        this.openingHour = openingHour;
    }

    public String getClosingHour() {
        return closingHour;
    }

    public void setClosingHour(String closingHour) {
        this.closingHour = closingHour;
    }
}
