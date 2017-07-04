package com.endercrest.uwaterlooapi.parking.models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 12/6/2016.
 */
public class ParkingCapacity {

    @SerializedName("lot_name")
    private String lotName;
    private float latitude;
    private float longitude;
    private int capacity;
    @SerializedName("current_count")
    private int currentCount;
    @SerializedName("percent_filled")
    private int percentFilled;
    @SerializedName("last_update")
    private String lastUpdate;

    public String getLotName() {
        return lotName;
    }

    public void setLotName(String lotName) {
        this.lotName = lotName;
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

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getCurrentCount() {
        return currentCount;
    }

    public void setCurrentCount(int currentCount) {
        this.currentCount = currentCount;
    }

    public int getPercentFilled() {
        return percentFilled;
    }

    public void setPercentFilled(int percentFilled) {
        this.percentFilled = percentFilled;
    }

    public String getLastUpdate() {
        return lastUpdate;
    }

    public void setLastUpdate(String lastUpdate) {
        this.lastUpdate = lastUpdate;
    }
}
