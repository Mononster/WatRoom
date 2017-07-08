package com.endercrest.uwaterlooapi.buildings.models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 12/6/2016.
 */
public class BuildingAccessPoint {

    @SerializedName("ap_name")
    private String apName;
    @SerializedName("aruba_ap_model")
    private String arubaApModel;
    @SerializedName("ip_address")
    private String ipAddress;
    @SerializedName("mac_address")
    private String macAddress;
    private String ssid;
    @SerializedName("building_code")
    private String buildingCode;
    @SerializedName("mac_address_secondary")
    private String macAddressSecondary;
    private float latitude;
    private float longitude;
    private float floor;

    public String getApName() {
        return apName;
    }

    public void setApName(String apName) {
        this.apName = apName;
    }

    public String getArubaApModel() {
        return arubaApModel;
    }

    public void setArubaApModel(String arubaApModel) {
        this.arubaApModel = arubaApModel;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public String getMacAddress() {
        return macAddress;
    }

    public void setMacAddress(String macAddress) {
        this.macAddress = macAddress;
    }

    public String getSsid() {
        return ssid;
    }

    public void setSsid(String ssid) {
        this.ssid = ssid;
    }

    public String getBuildingCode() {
        return buildingCode;
    }

    public void setBuildingCode(String buildingCode) {
        this.buildingCode = buildingCode;
    }

    public String getMacAddressSecondary() {
        return macAddressSecondary;
    }

    public void setMacAddressSecondary(String macAddressSecondary) {
        this.macAddressSecondary = macAddressSecondary;
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

    public float getFloor() {
        return floor;
    }

    public void setFloor(float floor) {
        this.floor = floor;
    }
}
