package com.endercrest.uwaterlooapi.foodservices.models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 11/25/2016.
 */
public class FoodServiceDiet {

    @SerializedName("diet_id")
    private int dietId;
    @SerializedName("diet_type")
    private String dietType;

    public int getDietId() {
        return dietId;
    }

    public void setDietId(int dietId) {
        this.dietId = dietId;
    }

    public String getDietType() {
        return dietType;
    }

    public void setDietType(String dietType) {
        this.dietType = dietType;
    }
}
