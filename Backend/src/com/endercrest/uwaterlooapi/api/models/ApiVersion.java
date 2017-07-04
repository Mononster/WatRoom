package com.endercrest.uwaterlooapi.api.models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 12/6/2016.
 */
public class ApiVersion {

    private float version;
    @SerializedName("release_date")
    private String releaseDate;

    public float getVersion() {
        return version;
    }

    public void setVersion(float version) {
        this.version = version;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }
}
