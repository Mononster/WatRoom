package com.endercrest.uwaterlooapi.resources.models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 12/5/2016.
 */
public class ResourceTutor {


    private String subject;
    @SerializedName("catalog_number")
    private String catalogNumber;
    private String title;
    @SerializedName("tutors_count")
    private int tutorsCount;
    @SerializedName("contact_url")
    private String contactUrl;

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getCatalogNumber() {
        return catalogNumber;
    }

    public void setCatalogNumber(String catalogNumber) {
        this.catalogNumber = catalogNumber;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getTutorsCount() {
        return tutorsCount;
    }

    public void setTutorsCount(int tutorsCount) {
        this.tutorsCount = tutorsCount;
    }

    public String getContactUrl() {
        return contactUrl;
    }

    public void setContactUrl(String contactUrl) {
        this.contactUrl = contactUrl;
    }
}
