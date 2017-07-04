package com.endercrest.uwaterlooapi.codes.models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 12/5/2016.
 */
public class CodesGroup {

    @SerializedName("group_code")
    private String groupCode;
    @SerializedName("group_short_name")
    private String groupShortName;
    @SerializedName("group_full_name")
    private String groupFullName;

    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode;
    }

    public String getGroupShortName() {
        return groupShortName;
    }

    public void setGroupShortName(String groupShortName) {
        this.groupShortName = groupShortName;
    }

    public String getGroupFullName() {
        return groupFullName;
    }

    public void setGroupFullName(String groupFullName) {
        this.groupFullName = groupFullName;
    }
}
