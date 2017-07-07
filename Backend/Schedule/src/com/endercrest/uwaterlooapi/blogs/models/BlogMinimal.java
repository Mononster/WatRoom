package com.endercrest.uwaterlooapi.blogs.models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 12/1/2016.
 */
public class BlogMinimal {

    private int id;
    private String title;
    @SerializedName("teaser_raw")
    private String teaserRaw;
    private String teaser;
    private String publisher;
    @SerializedName("delegated_author")
    private String delegatedAuthor;
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

    public String getTeaserRaw() {
        return teaserRaw;
    }

    public void setTeaserRaw(String teaserRaw) {
        this.teaserRaw = teaserRaw;
    }

    public String getTeaser() {
        return teaser;
    }

    public void setTeaser(String teaser) {
        this.teaser = teaser;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getDelegatedAuthor() {
        return delegatedAuthor;
    }

    public void setDelegatedAuthor(String delegatedAuthor) {
        this.delegatedAuthor = delegatedAuthor;
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
