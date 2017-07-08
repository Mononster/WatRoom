package com.endercrest.uwaterlooapi.events.models;

import com.endercrest.uwaterlooapi.base.models.UWAddress;
import com.endercrest.uwaterlooapi.base.models.UWImage;
import com.google.gson.annotations.SerializedName;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/1/2016.
 */
public class EventExtended {

    private int id;
    private String title;
    private String link;
    private String description;
    @SerializedName("description_raw")
    private String descriptionRaw;
    private List<EventExtendedTimes> times;
    private String cost;
    private List<String> audience;
    private List<String> tags;
    private List<String> type;
    private EventWebsite website;
    private EventHost host;
    private UWImage image;
    private UWAddress location;
    @SerializedName("site_name")
    private String siteName;
    @SerializedName("site_id")
    private String siteId;
    @SerializedName("revision_id")
    private int revisionId;
    @SerializedName("link_calendar")
    private String linkCalendar;
    private String updated;

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

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescriptionRaw() {
        return descriptionRaw;
    }

    public void setDescriptionRaw(String descriptionRaw) {
        this.descriptionRaw = descriptionRaw;
    }

    public List<EventExtendedTimes> getTimes() {
        return times;
    }

    public void setTimes(List<EventExtendedTimes> times) {
        this.times = times;
    }

    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    public List<String> getAudience() {
        return audience;
    }

    public void setAudience(List<String> audience) {
        this.audience = audience;
    }

    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }

    public List<String> getType() {
        return type;
    }

    public void setType(List<String> type) {
        this.type = type;
    }

    public EventWebsite getWebsite() {
        return website;
    }

    public void setWebsite(EventWebsite website) {
        this.website = website;
    }

    public EventHost getHost() {
        return host;
    }

    public void setHost(EventHost host) {
        this.host = host;
    }

    public UWImage getImage() {
        return image;
    }

    public void setImage(UWImage image) {
        this.image = image;
    }

    public UWAddress getLocation() {
        return location;
    }

    public void setLocation(UWAddress location) {
        this.location = location;
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

    public String getLinkCalendar() {
        return linkCalendar;
    }

    public void setLinkCalendar(String linkCalendar) {
        this.linkCalendar = linkCalendar;
    }

    public String getUpdated() {
        return updated;
    }

    public void setUpdated(String updated) {
        this.updated = updated;
    }

    public class EventHost{
        private String title;
        private String url;

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }

        public String getUrl() {
            return url;
        }

        public void setUrl(String url) {
            this.url = url;
        }
    }

    public class EventWebsite{

        private String title;
        private String url;

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }

        public String getUrl() {
            return url;
        }

        public void setUrl(String url) {
            this.url = url;
        }
    }

    public class EventExtendedTimes{

        private String start;
        private String end;
        @SerializedName("start_day")
        private String startDay;
        @SerializedName("start_date")
        private String startDate;
        @SerializedName("end_day")
        private String endDay;
        @SerializedName("end_date")
        private String endDate;
        @SerializedName("end_time")
        private String endTime;

        public String getStart() {
            return start;
        }

        public void setStart(String start) {
            this.start = start;
        }

        public String getEnd() {
            return end;
        }

        public void setEnd(String end) {
            this.end = end;
        }

        public String getStartDay() {
            return startDay;
        }

        public void setStartDay(String startDay) {
            this.startDay = startDay;
        }

        public String getStartDate() {
            return startDate;
        }

        public void setStartDate(String startDate) {
            this.startDate = startDate;
        }

        public String getEndDay() {
            return endDay;
        }

        public void setEndDay(String endDay) {
            this.endDay = endDay;
        }

        public String getEndDate() {
            return endDate;
        }

        public void setEndDate(String endDate) {
            this.endDate = endDate;
        }

        public String getEndTime() {
            return endTime;
        }

        public void setEndTime(String endTime) {
            this.endTime = endTime;
        }
    }
}
