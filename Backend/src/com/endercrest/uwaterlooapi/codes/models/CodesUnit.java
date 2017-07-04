package com.endercrest.uwaterlooapi.codes.models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 12/5/2016.
 */
public class CodesUnit {

    @SerializedName("unit_code")
    private String unitCode;
    @SerializedName("group_code")
    private String groupCode;
    @SerializedName("unit_short_name")
    private String unitShortName;
    @SerializedName("unit_full_name")
    private String unitFullName;

    public String getUnitCode() {
        return unitCode;
    }

    public void setUnitCode(String unitCode) {
        this.unitCode = unitCode;
    }

    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode;
    }

    public String getUnitShortName() {
        return unitShortName;
    }

    public void setUnitShortName(String unitShortName) {
        this.unitShortName = unitShortName;
    }

    public String getUnitFullName() {
        return unitFullName;
    }

    public void setUnitFullName(String unitFullName) {
        this.unitFullName = unitFullName;
    }
}
