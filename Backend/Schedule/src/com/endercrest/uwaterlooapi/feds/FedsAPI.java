package com.endercrest.uwaterlooapi.feds;

import com.endercrest.uwaterlooapi.data.ApiRequest;
import com.endercrest.uwaterlooapi.feds.models.FedEvent;
import com.endercrest.uwaterlooapi.feds.models.FedEventExtended;
import com.endercrest.uwaterlooapi.feds.models.FedLocation;
import com.google.gson.reflect.TypeToken;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 11/25/2016.
 */
public class FedsAPI {

    private final String apiKey;

    private static final String FEDS_EVENTS_ENDPOINT = "feds/events";
    private static final String FEDS_EVENT_ENDPOINT= "feds/events/%s";
    private static final String FEDS_LOCATIONS_ENDPOINT = "feds/locations";

    public FedsAPI(String apiKey){
        this.apiKey = apiKey;
    }

    /**
     * Retrieve all upcoming events for the federation of students.
     * @return A list of all FedEvents.
     */
    public ApiRequest<List<FedEvent>> getAllUpcomingEvents(){
        return ApiRequest.createApiRequest(FEDS_EVENTS_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<FedEvent>>>(){}.getType());
    }

    /**
     * Retrieve an extend amount of details for a specific federation of students event.
     * @param id The specific id for an event.
     * @return Returns extended information containing both raw description (HTML) and normal
     *         description.
     */
    public ApiRequest<FedEventExtended> getUpcomingEvent(String id){
        return ApiRequest.createApiRequest(String.format(FEDS_EVENT_ENDPOINT, id), apiKey,
                new TypeToken<ApiRequest<FedEventExtended>>(){}.getType());
    }

    /**
     * Retrieve a list of all Federation of Students operated locations.
     * @return List of FedLocations
     */
    public ApiRequest<List<FedLocation>> getAllLocations(){
        return ApiRequest.createApiRequest(FEDS_LOCATIONS_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<FedLocation>>>(){}.getType());
    }
}
