package com.endercrest.uwaterlooapi.feds.models;

import com.endercrest.uwaterlooapi.base.models.UWLocation;
import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 11/25/2016.<br>
 *
 *  All information for a single location ran by the federation of students.
 */
public class FedLocation extends UWLocation {

    private FedAdditional additional;

    public FedAdditional getAdditional() {
        return additional;
    }

    public void setAdditional(FedAdditional additional) {
        this.additional = additional;
    }

    public class FedAdditional{

        @SerializedName("menu_url")
        private String menuUrl;

        public String getMenuUrl() {
            return menuUrl;
        }

        public void setMenuUrl(String menuUrl) {
            this.menuUrl = menuUrl;
        }
    }
}
