package com.endercrest.uwaterlooapi.resources.models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 12/5/2016.
 */
public class ResourceSalary {

    private String employer;
    private String surname;
    @SerializedName("given_name")
    private String givenName;
    private String position;
    @SerializedName("salary_paid")
    private float salaryPaid;
    @SerializedName("taxable_benefits")
    private float taxableBenefits;

    public String getEmployer() {
        return employer;
    }

    public void setEmployer(String employer) {
        this.employer = employer;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getGivenName() {
        return givenName;
    }

    public void setGivenName(String givenName) {
        this.givenName = givenName;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public float getSalaryPaid() {
        return salaryPaid;
    }

    public void setSalaryPaid(float salaryPaid) {
        this.salaryPaid = salaryPaid;
    }

    public float getTaxableBenefits() {
        return taxableBenefits;
    }

    public void setTaxableBenefits(float taxableBenefits) {
        this.taxableBenefits = taxableBenefits;
    }
}
