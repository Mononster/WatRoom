package com.endercrest.uwaterlooapi.foodservices.models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 11/28/2016.
 */
public class FoodServiceWatcardVendor {

    @SerializedName("vendor_id")
    private int vendorId;
    @SerializedName("vendor_name")
    private String vendorName;

    public int getVendorId() {
        return vendorId;
    }

    public void setVendorId(int vendorId) {
        this.vendorId = vendorId;
    }

    public String getVendorName() {
        return vendorName;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }
}
