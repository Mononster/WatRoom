package com.endercrest.uwaterlooapi.courses.models;

import com.google.gson.annotations.SerializedName;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 11/24/2016.
 */
public class CoursePrerequisite {

    private String subject;
    @SerializedName("catalog_number")
    private String catalogNumber;
    private String title;
    private String prerequisites;
    @SerializedName("prerequisites_parsed")
    private List<Object> prerequisitesParsed;

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

    public String getPrerequisites() {
        return prerequisites;
    }

    public void setPrerequisites(String prerequisites) {
        this.prerequisites = prerequisites;
    }

    public List<Object> getPrerequisitesParsed() {
        return prerequisitesParsed;
    }

    public void setPrerequisitesParsed(List<Object> prerequisitesParsed) {
        this.prerequisitesParsed = prerequisitesParsed;
    }
}
