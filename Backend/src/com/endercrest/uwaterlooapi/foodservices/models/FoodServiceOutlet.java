package com.endercrest.uwaterlooapi.foodservices.models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 11/25/2016.
 */
public class FoodServiceOutlet {

    @SerializedName("outlet_id")
    private String outletId;
    @SerializedName("outlet_name")
    private String outletName;
    @SerializedName("has_breakfast")
    private boolean hasBreakfast;
    @SerializedName("has_lunch")
    private boolean hasLunch;
    @SerializedName("has_dinner")
    private boolean hasDinner;

    public String getOutletId() {
        return outletId;
    }

    public void setOutletId(String outletId) {
        this.outletId = outletId;
    }

    public String getOutletName() {
        return outletName;
    }

    public void setOutletName(String outletName) {
        this.outletName = outletName;
    }

    public boolean isHasBreakfast() {
        return hasBreakfast;
    }

    public void setHasBreakfast(boolean hasBreakfast) {
        this.hasBreakfast = hasBreakfast;
    }

    public boolean isHasLunch() {
        return hasLunch;
    }

    public void setHasLunch(boolean hasLunch) {
        this.hasLunch = hasLunch;
    }

    public boolean isHasDinner() {
        return hasDinner;
    }

    public void setHasDinner(boolean hasDinner) {
        this.hasDinner = hasDinner;
    }
}
