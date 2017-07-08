package com.endercrest.uwaterlooapi.data;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 11/23/2016.
 */
public class Meta {

    private int requests;
    private int timestamp;
    private int status;
    private int version;
    @SerializedName("method_id")
    private int methodId;
    private String message;

    public int getRequests() {
        return requests;
    }

    public void setRequests(int requests) {
        this.requests = requests;
    }

    public int getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(int timestamp) {
        this.timestamp = timestamp;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    public int getMethodId() {
        return methodId;
    }

    public void setMethodId(int methodId) {
        this.methodId = methodId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
