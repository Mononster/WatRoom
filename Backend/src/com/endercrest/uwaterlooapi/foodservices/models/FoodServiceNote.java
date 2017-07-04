package com.endercrest.uwaterlooapi.foodservices.models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 11/25/2016.
 */
public class FoodServiceNote {

    private String date;
    @SerializedName("outlet_name")
    private String outletName;
    @SerializedName("outlet_id")
    private String outletId;
    private String note;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getOutletName() {
        return outletName;
    }

    public void setOutletName(String outletName) {
        this.outletName = outletName;
    }

    public String getOutletId() {
        return outletId;
    }

    public void setOutletId(String outletId) {
        this.outletId = outletId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
