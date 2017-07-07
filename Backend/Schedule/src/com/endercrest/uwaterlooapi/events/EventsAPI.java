package com.endercrest.uwaterlooapi.events;

import com.endercrest.uwaterlooapi.data.ApiRequest;
import com.endercrest.uwaterlooapi.events.models.Event;
import com.endercrest.uwaterlooapi.events.models.EventExtended;
import com.endercrest.uwaterlooapi.events.models.EventHoliday;
import com.endercrest.uwaterlooapi.events.models.EventSite;
import com.google.gson.reflect.TypeToken;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/1/2016.
 */
public class EventsAPI {

    private static final String EVENTS_ENDPOINT = "events";
    private static final String EVENTS_SITE_ENDPOINT = "events/%s";
    private static final String EVENTS_SITE_ID_ENDPOINT = "events/%s/%s";
    private static final String EVENTS_HOLIDAYS_ENDPOINT = "events/holidays";

    private final String apiKey;

    public EventsAPI(String apiKey){
        this.apiKey = apiKey;
    }

    /**
     * Gets the upcoming 21 waterloo events.
     * @return {@link Event}
     */
    public ApiRequest<List<Event>> getEvents(){
        return ApiRequest.createApiRequest(EVENTS_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<Event>>>(){}.getType());
    }

    /**
     * Gets all events for a specific site.
     * @param site The site of desired events.
     * @return {@link EventSite}
     */
    public ApiRequest<List<EventSite>> getEvents(String site){
        return ApiRequest.createApiRequest(String.format(EVENTS_SITE_ENDPOINT, site), apiKey,
                new TypeToken<ApiRequest<List<EventSite>>>(){}.getType());
    }

    /**
     * Gets all information for a specific event at an site.
     * @param site A string, for example "engineering"
     * @param id A interger id, for example "1701"
     * @return {@link EventExtended}
     */
    public ApiRequest<EventExtended> getEvent(String site, String id){
        return ApiRequest.createApiRequest(String.format(EVENTS_SITE_ID_ENDPOINT, site, id), apiKey,
                new TypeToken<ApiRequest<EventExtended>>(){}.getType());
    }

    /**
     * Get all holidays from University of Waterloo starting from 2012.
     * @return {@link EventHoliday}
     */
    public ApiRequest<List<EventHoliday>> getHolidays(){
        return ApiRequest.createApiRequest(EVENTS_HOLIDAYS_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<EventHoliday>>>(){}.getType());
    }

}
