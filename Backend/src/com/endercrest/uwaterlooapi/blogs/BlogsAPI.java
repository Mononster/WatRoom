package com.endercrest.uwaterlooapi.blogs;

import com.endercrest.uwaterlooapi.data.ApiRequest;
import com.endercrest.uwaterlooapi.blogs.models.BlogExtended;
import com.endercrest.uwaterlooapi.blogs.models.BlogMinimal;
import com.google.gson.reflect.TypeToken;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/1/2016.
 */
public class BlogsAPI {

    private static final String SITE_ENDPOINT = "blogs/%s";
    private static final String SITE_ID_ENDPOINT = "blogs/%s/%s";

    private final String apiKey;

    public BlogsAPI(String apiKey){
        this.apiKey = apiKey;
    }

    /**
     * Retrieves a list of all blogs posts for a given site.
     * @param site Specific Site - ex. "student-success"
     * @return {@link BlogMinimal}
     */
    public ApiRequest<List<BlogMinimal>> getBlogPosts(String site){
        return ApiRequest.createApiRequest(String.format(SITE_ENDPOINT, site), apiKey,
                new TypeToken<ApiRequest<List<BlogMinimal>>>(){}.getType());
    }

    /**
     * Retrieve the details for a specific blog post.
     * @param site Specific Site - ex. "student-success"
     * @param id Specific Post - ex. "7721"
     * @return {@link BlogExtended}
     */
    public ApiRequest<List<BlogExtended>> getBlogPost(String site, String id){
        return ApiRequest.createApiRequest(String.format(SITE_ID_ENDPOINT, site, id), apiKey,
                new TypeToken<ApiRequest<List<BlogExtended>>>(){}.getType());
    }
}
