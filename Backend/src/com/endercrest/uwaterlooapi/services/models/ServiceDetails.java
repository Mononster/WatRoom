package com.endercrest.uwaterlooapi.services.models;

import com.endercrest.uwaterlooapi.base.models.UWAddress;
import com.endercrest.uwaterlooapi.base.models.UWOpenHours;
import com.endercrest.uwaterlooapi.base.models.UWSpecialDay;
import com.google.gson.annotations.SerializedName;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/1/2016.
 */
public class ServiceDetails {

    private int id;
    private String name;
    private String description;
    private String cost;
    @SerializedName("is_open_now")
    private boolean isOpenNow;
    @SerializedName("contact_information")
    private String contactInformation;
    private String notice;
    @SerializedName("services_available")
    private List<String> servicesAvailable;
    @SerializedName("request_info")
    private ServiceRequestInfo requestInfo;
    @SerializedName("opening_hours")
    private UWOpenHours openingHours;
    @SerializedName("special_hours")
    private UWSpecialDay specialHours;
    @SerializedName("dates_closed")
    private List<String> datesClosed;
    private UWAddress location;
    private String category;
    private List<String> audience;
    @SerializedName("site_name")
    private String siteName;
    @SerializedName("site_id")
    private String siteId;
    @SerializedName("revision_id")
    private int revisionId;
    private String additional;
    private String link;
    private String updated;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    public boolean isOpenNow() {
        return isOpenNow;
    }

    public void setOpenNow(boolean openNow) {
        isOpenNow = openNow;
    }

    public String getContactInformation() {
        return contactInformation;
    }

    public void setContactInformation(String contactInformation) {
        this.contactInformation = contactInformation;
    }

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice;
    }

    public List<String> getServicesAvailable() {
        return servicesAvailable;
    }

    public void setServicesAvailable(List<String> servicesAvailable) {
        this.servicesAvailable = servicesAvailable;
    }

    public ServiceRequestInfo getRequestInfo() {
        return requestInfo;
    }

    public void setRequestInfo(ServiceRequestInfo requestInfo) {
        this.requestInfo = requestInfo;
    }

    public UWOpenHours getOpeningHours() {
        return openingHours;
    }

    public void setOpeningHours(UWOpenHours openingHours) {
        this.openingHours = openingHours;
    }

    public UWSpecialDay getSpecialHours() {
        return specialHours;
    }

    public void setSpecialHours(UWSpecialDay specialHours) {
        this.specialHours = specialHours;
    }

    public List<String> getDatesClosed() {
        return datesClosed;
    }

    public void setDatesClosed(List<String> datesClosed) {
        this.datesClosed = datesClosed;
    }

    public UWAddress getLocation() {
        return location;
    }

    public void setLocation(UWAddress location) {
        this.location = location;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public List<String> getAudience() {
        return audience;
    }

    public void setAudience(List<String> audience) {
        this.audience = audience;
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    public String getSiteId() {
        return siteId;
    }

    public void setSiteId(String siteId) {
        this.siteId = siteId;
    }

    public int getRevisionId() {
        return revisionId;
    }

    public void setRevisionId(int revisionId) {
        this.revisionId = revisionId;
    }

    public String getAdditional() {
        return additional;
    }

    public void setAdditional(String additional) {
        this.additional = additional;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getUpdated() {
        return updated;
    }

    public void setUpdated(String updated) {
        this.updated = updated;
    }

    public class ServiceRequestInfo{
        private String procedure;
        @SerializedName("completion_time")
        private String completionTime;
        @SerializedName("minimum_notice")
        private String minimumNotice;

        public String getProcedure() {
            return procedure;
        }

        public void setProcedure(String procedure) {
            this.procedure = procedure;
        }

        public String getCompletionTime() {
            return completionTime;
        }

        public void setCompletionTime(String completionTime) {
            this.completionTime = completionTime;
        }

        public String getMinimumNotice() {
            return minimumNotice;
        }

        public void setMinimumNotice(String minimumNotice) {
            this.minimumNotice = minimumNotice;
        }
    }
}
