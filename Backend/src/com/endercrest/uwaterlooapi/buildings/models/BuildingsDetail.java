package com.endercrest.uwaterlooapi.buildings.models;

import com.google.gson.annotations.SerializedName;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/6/2016.
 */
public class BuildingsDetail {

    @SerializedName("building_id")
    private String buildingId;
    @SerializedName("building_code")
    private String buildingCode;
    @SerializedName("building_name")
    private String buildingName;
    @SerializedName("alternate_names")
    private List<String> alternateNames;
    private float latitude;
    private float longitude;
    @SerializedName("building_sections")
    private List<BuildingsDetailSection> buildingSections;

    public String getBuildingId() {
        return buildingId;
    }

    public void setBuildingId(String buildingId) {
        this.buildingId = buildingId;
    }

    public String getBuildingCode() {
        return buildingCode;
    }

    public void setBuildingCode(String buildingCode) {
        this.buildingCode = buildingCode;
    }

    public String getBuildingName() {
        return buildingName;
    }

    public void setBuildingName(String buildingName) {
        this.buildingName = buildingName;
    }

    public List<String> getAlternateNames() {
        return alternateNames;
    }

    public void setAlternateNames(List<String> alternateNames) {
        this.alternateNames = alternateNames;
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

    public List<BuildingsDetailSection> getBuildingSections() {
        return buildingSections;
    }

    public void setBuildingSections(List<BuildingsDetailSection> buildingSections) {
        this.buildingSections = buildingSections;
    }

    public class BuildingsDetailSection{

        @SerializedName("section_name")
        private String sectionName;
        private float latitude;
        private float longitude;

        public String getSectionName() {
            return sectionName;
        }

        public void setSectionName(String sectionName) {
            this.sectionName = sectionName;
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
    }
}
