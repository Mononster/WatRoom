package com.endercrest.uwaterlooapi.base.models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 12/1/2016.
 */
public class UWDay{

        @SerializedName("opening_hour")
        private String openingHour;
        @SerializedName("closing_hour")
        private String closingHour;
        @SerializedName("is_closed")
        private boolean isClosed;

        public String getOpeningHour() {
            return openingHour;
        }

        public void setOpeningHour(String openingHour) {
            this.openingHour = openingHour;
        }

        public String getClosingHour() {
            return closingHour;
        }

        public void setClosingHour(String closingHour) {
            this.closingHour = closingHour;
        }

        public boolean isClosed() {
            return isClosed;
        }

        public void setClosed(boolean closed) {
            isClosed = closed;
        }
    }