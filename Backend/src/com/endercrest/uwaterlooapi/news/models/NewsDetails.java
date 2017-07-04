package com.endercrest.uwaterlooapi.news.models;

import com.endercrest.uwaterlooapi.base.models.UWImage;
import com.google.gson.annotations.SerializedName;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/1/2016.
 */
public class NewsDetails {

    private int id;
    private String title;
    private String description;
    @SerializedName("description_raw")
    private String descriptionRaw;
    private List<String> audience;
    private UWImage image;
    @SerializedName("site_id")
    private String siteId;
    @SerializedName("site_name")
    private String siteName;
    @SerializedName("revision_id")
    private int revisionId;
    private String published;
    private String updated;
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

    public List<String> getAudience() {
        return audience;
    }

    public void setAudience(List<String> audience) {
        this.audience = audience;
    }

    public UWImage getImage() {
        return image;
    }

    public void setImage(UWImage image) {
        this.image = image;
    }

    public String getSiteId() {
        return siteId;
    }

    public void setSiteId(String siteId) {
        this.siteId = siteId;
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    public int getRevisionId() {
        return revisionId;
    }

    public void setRevisionId(int revisionId) {
        this.revisionId = revisionId;
    }

    public String getPublished() {
        return published;
    }

    public void setPublished(String published) {
        this.published = published;
    }

    public String getUpdated() {
        return updated;
    }

    public void setUpdated(String updated) {
        this.updated = updated;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
}
