package com.endercrest.uwaterlooapi.api;

import com.endercrest.uwaterlooapi.api.models.*;
import com.endercrest.uwaterlooapi.data.ApiRequest;
import com.google.gson.reflect.TypeToken;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/6/2016.
 */
public class ApiAPI {

    private static final String USAGE_ENDPOINT = "api/usage";
    private static final String SERVICES_ENDPOINT = "api/services";
    private static final String METHODS_ENDPOINT = "api/methods";
    private static final String VERSIONS_ENDPOINT = "api/versions";
    private static final String CHANGELOG_ENDPOINT = "api/changelog";

    private final String apiKey;

    public ApiAPI(String apiKey){
        this.apiKey = apiKey;
    }

    /**
     * Returns the users API usage.
     * @return {@link ApiUsage}
     */
    public ApiRequest<ApiUsage> getUsage(){
        return ApiRequest.createApiRequest(USAGE_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<ApiUsage>>(){}.getType());
    }

    /**
     * Retrieve a list of all API services available.
     * @return {@link ApiService}
     */
    public ApiRequest<List<ApiService>> getServices(){
        return ApiRequest.createApiRequest(SERVICES_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<ApiService>>>(){}.getType());
    }

    /**
     * Retrieve all api endpoint methods available for use.
     * @return {@link ApiMethod}
     */
    public ApiRequest<List<ApiMethod>> getMethods(){
        return ApiRequest.createApiRequest(METHODS_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<ApiMethod>>>(){}.getType());
    }

    /**
     * Retrieve api versions.
     * @return {@link ApiVersion}
     */
    public ApiRequest<List<ApiVersion>> getVersions(){
        return ApiRequest.createApiRequest(VERSIONS_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<ApiVersion>>>(){}.getType());
    }

    /**
     * Retrieve api changelogs
     * @return {@link ApiChangelog}
     */
    public ApiRequest<List<ApiChangelog>> getChangelogs(){
        return ApiRequest.createApiRequest(CHANGELOG_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<ApiChangelog>>>(){}.getType());
    }
}
