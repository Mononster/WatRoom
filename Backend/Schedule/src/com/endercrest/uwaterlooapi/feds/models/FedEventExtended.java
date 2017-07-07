package com.endercrest.uwaterlooapi.feds.models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 11/25/2016.
 */
public class FedEventExtended extends FedEvent {

    private String description;
    @SerializedName("description_raw")
    private String descriptionRaw;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescriptionRaw() {
        return descriptionRaw;
    }

    public void setDescriptionRaw(String descriptionRaw) {
        this.descriptionRaw = descriptionRaw;
    }
}
