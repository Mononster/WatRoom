package com.endercrest.uwaterlooapi.blogs.models;

import com.google.gson.annotations.SerializedName;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/1/2016.
 */
public class BlogExtended {

    private int id;
    private String title;
    @SerializedName("description_raw")
    private String descriptionRaw;
    private String description;
    private List<String> audience;
    @SerializedName("delegated_author")
    private String delegatedAuthor;
    @SerializedName("podcast_url")
    private String podcastUrl;
    @SerializedName("transcript_url")
    private String transcriptUrl;
    private String publisher;
    @SerializedName("site_id")
    private String siteId;
    @SerializedName("site_name")
    private String siteName;
    @SerializedName("revision_id")
    private int revisionId;
    private String link;
    private String published;
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

    public String getDescriptionRaw() {
        return descriptionRaw;
    }

    public void setDescriptionRaw(String descriptionRaw) {
        this.descriptionRaw = descriptionRaw;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<String> getAudience() {
        return audience;
    }

    public void setAudience(List<String> audience) {
        this.audience = audience;
    }

    public String getDelegatedAuthor() {
        return delegatedAuthor;
    }

    public void setDelegatedAuthor(String delegatedAuthor) {
        this.delegatedAuthor = delegatedAuthor;
    }

    public String getPodcastUrl() {
        return podcastUrl;
    }

    public void setPodcastUrl(String podcastUrl) {
        this.podcastUrl = podcastUrl;
    }

    public String getTranscriptUrl() {
        return transcriptUrl;
    }

    public void setTranscriptUrl(String transcriptUrl) {
        this.transcriptUrl = transcriptUrl;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
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

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
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
}
