package com.endercrest.uwaterlooapi.base.models;

import com.google.gson.annotations.SerializedName;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/5/2016.
 */
public class UWInfoSession {

    private String id;
    private String employer;
    private String date;
    @SerializedName("start_time")
    private String startTime;
    @SerializedName("end_time")
    private String endTime;
    private String description;
    private String website;
    private UWInfoSessionBuilding building;
    private List<String> audience;
    private String link;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmployer() {
        return employer;
    }

    public void setEmployer(String employer) {
        this.employer = employer;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public UWInfoSessionBuilding getBuilding() {
        return building;
    }

    public void setBuilding(UWInfoSessionBuilding building) {
        this.building = building;
    }

    public List<String> getAudience() {
        return audience;
    }

    public void setAudience(List<String> audience) {
        this.audience = audience;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public class UWInfoSessionBuilding{
        private String code;
        private String name;
        private String room;
        private float latitude;
        private float longitude;
        @SerializedName("map_url")
        private String mapUrl;

        public String getCode() {
            return code;
        }

        public void setCode(String code) {
            this.code = code;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getRoom() {
            return room;
        }

        public void setRoom(String room) {
            this.room = room;
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

        public String getMapUrl() {
            return mapUrl;
        }

        public void setMapUrl(String mapUrl) {
            this.mapUrl = mapUrl;
        }
    }
}