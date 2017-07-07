package com.endercrest.uwaterlooapi.terms.models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 12/4/2016.
 */
public class TermCourseEnrollment {

    private String subject;
    @SerializedName("catalog_number")
    private String catalogNumber;
    @SerializedName("class_number")
    private int classNumber;
    private String section;
    @SerializedName("enrollment_capacity")
    private int enrollmentCapacity;
    @SerializedName("enrollment_total")
    private int enrollmentTotal;
    @SerializedName("waiting_capacity")
    private int waitingCapacity;
    @SerializedName("waiting_total")
    private int waitingTotal;
    @SerializedName("last_updated")
    private String lastUpdated;

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

    public int getClassNumber() {
        return classNumber;
    }

    public void setClassNumber(int classNumber) {
        this.classNumber = classNumber;
    }

    public String getSection() {
        return section;
    }

    public void setSection(String section) {
        this.section = section;
    }

    public int getEnrollmentCapacity() {
        return enrollmentCapacity;
    }

    public void setEnrollmentCapacity(int enrollmentCapacity) {
        this.enrollmentCapacity = enrollmentCapacity;
    }

    public int getEnrollmentTotal() {
        return enrollmentTotal;
    }

    public void setEnrollmentTotal(int enrollmentTotal) {
        this.enrollmentTotal = enrollmentTotal;
    }

    public int getWaitingCapacity() {
        return waitingCapacity;
    }

    public void setWaitingCapacity(int waitingCapacity) {
        this.waitingCapacity = waitingCapacity;
    }

    public int getWaitingTotal() {
        return waitingTotal;
    }

    public void setWaitingTotal(int waitingTotal) {
        this.waitingTotal = waitingTotal;
    }

    public String getLastUpdated() {
        return lastUpdated;
    }

    public void setLastUpdated(String lastUpdated) {
        this.lastUpdated = lastUpdated;
    }
}
