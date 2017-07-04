package com.endercrest.uwaterlooapi.api.models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 12/6/2016.
 */
public class ApiUsage {

    private String name;
    @SerializedName("api_key")
    private String apiKey;
    @SerializedName("monthly_calls")
    private int monthlyCalls;
    @SerializedName("total_calls")
    private int totalCalls;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getApiKey() {
        return apiKey;
    }

    public void setApiKey(String apiKey) {
        this.apiKey = apiKey;
    }

    public int getMonthlyCalls() {
        return monthlyCalls;
    }

    public void setMonthlyCalls(int monthlyCalls) {
        this.monthlyCalls = monthlyCalls;
    }

    public int getTotalCalls() {
        return totalCalls;
    }

    public void setTotalCalls(int totalCalls) {
        this.totalCalls = totalCalls;
    }
}
