package com.endercrest.uwaterlooapi.events.models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 12/1/2016.
 */
public class Event extends EventBase {

    private String site;
    @SerializedName("site_name")
    private String siteName;

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }
}
