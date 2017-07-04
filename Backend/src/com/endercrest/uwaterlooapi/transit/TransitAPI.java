package com.endercrest.uwaterlooapi.transit;

import com.endercrest.uwaterlooapi.data.ApiRequest;
import com.endercrest.uwaterlooapi.transit.models.TransitAgency;
import com.endercrest.uwaterlooapi.transit.models.TransitStop;
import com.google.gson.reflect.TypeToken;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/6/2016.
 */
public class TransitAPI {

    private static final String GRT_ENDPOINT = "transit/grt";
    private static final String GRT_STOPS_ENDPOINT = "transit/grt/stops";

    private final String apiKey;

    public TransitAPI(String apiKey){
        this.apiKey = apiKey;
    }

    /**
     * Retrieve a list of transit agencies the GRT connect to.
     * @return {@link TransitAgency}
     */
    public ApiRequest<List<TransitAgency>> getGRTAgencies(){
        return ApiRequest.createApiRequest(GRT_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<TransitAgency>>>(){}.getType());
    }

    /**
     * Retrieve a list of all GRT stops.
     * @return {@link TransitStop}
     */
    public ApiRequest<List<TransitStop>> getGRTStops(){
        return ApiRequest.createApiRequest(GRT_STOPS_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<TransitStop>>>(){}.getType());
    }

}
