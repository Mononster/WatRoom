package com.endercrest.uwaterlooapi.resources;

import com.endercrest.uwaterlooapi.data.ApiRequest;
import com.endercrest.uwaterlooapi.resources.models.ResourceGooseNest;
import com.endercrest.uwaterlooapi.resources.models.ResourceInfoSession;
import com.endercrest.uwaterlooapi.resources.models.ResourceSalary;
import com.endercrest.uwaterlooapi.resources.models.ResourceTutor;
import com.google.gson.reflect.TypeToken;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/4/2016.
 */
public class ResourcesAPI {

    private static final String TUTORS_ENDPOINT = "resources/tutors";
    private static final String INFOSESSIONS_ENDPOINT = "resources/infosessions";
    private static final String GOOSEWATCH_ENDPOINT = "resources/goosewatch";
    private static final String SUNSHINE_ENDPOINT = "resources/sunshinelist";

    private final String apiKey;

    public ResourcesAPI(String apiKey){
        this.apiKey = apiKey;
    }

    /**
     * Retrieve a list of courses with tutors availability.
     * @return {@link ResourceTutor}
     */
    public ApiRequest<List<ResourceTutor>> getTutors(){
        return ApiRequest.createApiRequest(TUTORS_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<ResourceTutor>>>(){}.getType());
    }

    /**
     * Retrieve a list of information sessions.
     * @return {@link ResourceInfoSession}
     */
    public ApiRequest<List<ResourceInfoSession>> getInfoSessions(){
        return ApiRequest.createApiRequest(INFOSESSIONS_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<ResourceInfoSession>>>(){}.getType());
    }

    /**
     * Retrieve a list of all goose nests on campus.
     * @return {@link ResourceGooseNest}
     */
    public ApiRequest<List<ResourceGooseNest>> getGeeseNests(){
        return ApiRequest.createApiRequest(GOOSEWATCH_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<ResourceGooseNest>>>(){}.getType());
    }

    /**
     * Retrieve a list of all staff at Waterloo who make an income of over $100k
     * @return {@link ResourceSalary}
     */
    public ApiRequest<List<ResourceSalary>> getSalaries(){
        return ApiRequest.createApiRequest(SUNSHINE_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<ResourceSalary>>>(){}.getType());
    }
}