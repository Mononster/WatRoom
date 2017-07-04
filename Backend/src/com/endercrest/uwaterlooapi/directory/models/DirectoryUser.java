package com.endercrest.uwaterlooapi.directory.models;

import com.google.gson.annotations.SerializedName;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/6/2016.
 */
public class DirectoryUser {

    @SerializedName("full_name")
    private String fullName;
    @SerializedName("given_name")
    private String givenName;
    @SerializedName("last_name")
    private String lastName;
    @SerializedName("user_id")
    private String userId;
    private String department;
    @SerializedName("common_names")
    private List<String> commonNames;
    private List<String> offices;
    @SerializedName("telephone_numbers")
    private List<String> telephoneNumbers;
    private String homepage;

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getGivenName() {
        return givenName;
    }

    public void setGivenName(String givenName) {
        this.givenName = givenName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public List<String> getCommonNames() {
        return commonNames;
    }

    public void setCommonNames(List<String> commonNames) {
        this.commonNames = commonNames;
    }

    public List<String> getOffices() {
        return offices;
    }

    public void setOffices(List<String> offices) {
        this.offices = offices;
    }

    public List<String> getTelephoneNumbers() {
        return telephoneNumbers;
    }

    public void setTelephoneNumbers(List<String> telephoneNumbers) {
        this.telephoneNumbers = telephoneNumbers;
    }

    public String getHomepage() {
        return homepage;
    }

    public void setHomepage(String homepage) {
        this.homepage = homepage;
    }
}
