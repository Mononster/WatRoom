package com.endercrest.uwaterlooapi.services;

import com.endercrest.uwaterlooapi.data.ApiRequest;
import com.endercrest.uwaterlooapi.services.models.ServiceDetails;
import com.google.gson.reflect.TypeToken;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/1/2016.
 */
public class ServicesAPI {

    private static final String SERVICES_ENDPOINT = "services/%s";

    private final String apiKey;

    public ServicesAPI(String apiKey){
        this.apiKey = apiKey;
    }

    /**
     * Retrieve services associated with a specific site.
     * @param site The site, ie "arts-computing"
     * @return {@link ServiceDetails}
     */
    public ApiRequest<List<ServiceDetails>> getServices(String site){
        return ApiRequest.createApiRequest(String.format(SERVICES_ENDPOINT, site), apiKey,
                new TypeToken<ApiRequest<List<ServiceDetails>>>(){}.getType());
    }
}
