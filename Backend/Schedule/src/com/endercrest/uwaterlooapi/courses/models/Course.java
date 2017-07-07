package com.endercrest.uwaterlooapi.courses.models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 11/24/2016.
 *
 * Class containing a little more information than {@link CourseBase}
 */
public class Course extends CourseBase{

    private Double units;
    private String description;
    @SerializedName("academic_level")
    private String academicLevel;

    public Double getUnits() {
        return units;
    }

    public void setUnits(Double units) {
        this.units = units;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAcademicLevel() {
        return academicLevel;
    }

    public void setAcademicLevel(String academicLevel) {
        this.academicLevel = academicLevel;
    }
}
