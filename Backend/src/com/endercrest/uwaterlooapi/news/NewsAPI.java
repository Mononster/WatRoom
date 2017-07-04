package com.endercrest.uwaterlooapi.news;

import com.endercrest.uwaterlooapi.data.ApiRequest;
import com.endercrest.uwaterlooapi.news.models.NewsBase;
import com.endercrest.uwaterlooapi.news.models.NewsDetails;
import com.endercrest.uwaterlooapi.news.models.NewsSite;
import com.google.gson.reflect.TypeToken;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/1/2016.
 */
public class NewsAPI {

    private static final String NEWS_ENDPOINT = "news";
    private static final String NEWS_SITE_ENDPOINT = "news/%s";
    private static final String NEWS_SITE_ID_ENDPOINT = "news/%s/%s";

    private final String apiKey;

    public NewsAPI(String apiKey){
        this.apiKey = apiKey;
    }

    /**
     * Retrieves a list of 100 newest news articles.
     * @return {@link NewsSite}
     */
    public ApiRequest<List<NewsSite>> getNews(){
        return ApiRequest.createApiRequest(NEWS_ENDPOINT, apiKey,
                new TypeToken<List<NewsSite>>(){}.getType());
    }

    /**
     * Returns a sites upcoming news given the site.
     * @param site The specific site. ie "engineering"
     * @return {@link NewsBase}
     */
    public ApiRequest<List<NewsBase>> getNews(String site){
        return ApiRequest.createApiRequest(String.format(NEWS_SITE_ENDPOINT, site), apiKey,
                new TypeToken<ApiRequest<List<NewsBase>>>(){}.getType());
    }

    /**
     * Retrieves a specific news item by given site and id.
     * @param site The specific site. ie "engineering"
     * @param id The specific id. ie "123"
     * @return {@link NewsDetails}
     */
    public ApiRequest<NewsDetails> getNews(String site, String id){
        return ApiRequest.createApiRequest(String.format(NEWS_SITE_ID_ENDPOINT, site, id), apiKey,
                new TypeToken<ApiRequest<NewsDetails>>(){}.getType());
    }

}
