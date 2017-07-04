package com.endercrest.uwaterlooapi.server.models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 12/6/2016.
 */
public class ServerTime {

    private int timestamp;
    private String datetime;
    private String timezone;
    @SerializedName("key_reset_time")
    private int keyResetTime;

    public int getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(int timestamp) {
        this.timestamp = timestamp;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public String getTimezone() {
        return timezone;
    }

    public void setTimezone(String timezone) {
        this.timezone = timezone;
    }

    public int getKeyResetTime() {
        return keyResetTime;
    }

    public void setKeyResetTime(int keyResetTime) {
        this.keyResetTime = keyResetTime;
    }
}
