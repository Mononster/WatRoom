package com.endercrest.uwaterlooapi.awards.models;

import com.google.gson.annotations.SerializedName;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/1/2016.
 */
public class AwardBase {

    private int id;
    private String title;
    private String status;
    private String value;
    private List<String> type;
    private String description;
    private List<String> citizenship;
    private List<String> programs;
    private AwardGraduate.AwardApplication application;
    private AwardGraduate.AwardDeadline deadlines;
    private List<String> links;
    private String contact;
    private int vid;
    private String link;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public List<String> getType() {
        return type;
    }

    public void setType(List<String> type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<String> getCitizenship() {
        return citizenship;
    }

    public void setCitizenship(List<String> citizenship) {
        this.citizenship = citizenship;
    }

    public List<String> getPrograms() {
        return programs;
    }

    public void setPrograms(List<String> programs) {
        this.programs = programs;
    }

    public AwardApplication getApplication() {
        return application;
    }

    public void setApplication(AwardApplication application) {
        this.application = application;
    }

    public AwardDeadline getDeadlines() {
        return deadlines;
    }

    public void setDeadlines(AwardDeadline deadlines) {
        this.deadlines = deadlines;
    }

    public List<String> getLinks() {
        return links;
    }

    public void setLinks(List<String> links) {
        this.links = links;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public int getVid() {
        return vid;
    }

    public void setVid(int vid) {
        this.vid = vid;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public class AwardDeadline{

        private List<String> term;
        private List<String> application;
        private String extended;

        public List<String> getTerm() {
            return term;
        }

        public void setTerm(List<String> term) {
            this.term = term;
        }

        public List<String> getApplication() {
            return application;
        }

        public void setApplication(List<String> application) {
            this.application = application;
        }

        public String getExtended() {
            return extended;
        }

        public void setExtended(String extended) {
            this.extended = extended;
        }
    }

    public class AwardApplication{

        private List<String> type;
        @SerializedName("enrollment_year")
        private List<String> enrollmentYear;
        private List<String> eligibility;
        private List<String> instructions;
        private List<String> additional;

        public List<String> getType() {
            return type;
        }

        public void setType(List<String> type) {
            this.type = type;
        }

        public List<String> getEnrollmentYear() {
            return enrollmentYear;
        }

        public void setEnrollmentYear(List<String> enrollmentYear) {
            this.enrollmentYear = enrollmentYear;
        }

        public List<String> getEligibility() {
            return eligibility;
        }

        public void setEligibility(List<String> eligibility) {
            this.eligibility = eligibility;
        }

        public List<String> getInstructions() {
            return instructions;
        }

        public void setInstructions(List<String> instructions) {
            this.instructions = instructions;
        }

        public List<String> getAdditional() {
            return additional;
        }

        public void setAdditional(List<String> additional) {
            this.additional = additional;
        }
    }
}
