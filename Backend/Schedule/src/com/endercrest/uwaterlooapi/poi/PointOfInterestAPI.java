package com.endercrest.uwaterlooapi.poi;

import com.endercrest.uwaterlooapi.data.ApiRequest;
import com.endercrest.uwaterlooapi.poi.models.POIInformation;
import com.google.gson.reflect.TypeToken;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/6/2016.
 */
public class PointOfInterestAPI {

    private static final String POI_ATMS_ENDPOINT = "poi/atms";
    private static final String POI_GREYHOUND_ENDPOINT = "poi/greyhound";
    private static final String POI_HELPLINES_ENDPOINT = "poi/helplines";
    private static final String POI_LIBRARIES_ENDPOINT = "poi/libraries";
    private static final String POI_PHOTOSPHERES_ENDPOINT = "poi/photospheres";
    private static final String POI_DEFIBRILLATORS_ENDPOINT = "poi/defibrillators";
    private static final String POI_CONSTRUCTIONSITES_ENDPOINT = "poi/constructionsites";
    private static final String POI_ACCESSIBLEENTRANCES_ENDPOINT = "poi/accessibleentrances";
    private static final String POI_VISITORINFORMATION_ENDPOINT = "poi/visitorinformation";

    private final String apiKey;

    public PointOfInterestAPI(String apiKey){
        this.apiKey = apiKey;
    }

    /**
     * Retrieve a list of all ATMs accross campus.
     * @return {@link POIInformation}
     */
    public ApiRequest<List<POIInformation>> getATMs(){
        return ApiRequest.createApiRequest(POI_ATMS_ENDPOINT, apiKey,
                new TypeToken<List<POIInformation>>(){}.getType());
    }

    /**
     * Retrieve a list of all Greyhound stops across city
     * @return {@link POIInformation}
     */
    public ApiRequest<List<POIInformation>> getGreyhoundStops(){
        return ApiRequest.createApiRequest(POI_GREYHOUND_ENDPOINT, apiKey,
                new TypeToken<List<POIInformation>>(){}.getType());
    }

    /**
     * Retrieve a list of emergency helplines around campus
     * @return {@link POIInformation}
     */
    public ApiRequest<List<POIInformation>> getHelplines(){
        return ApiRequest.createApiRequest(POI_HELPLINES_ENDPOINT, apiKey,
                new TypeToken<List<POIInformation>>(){}.getType());
    }

    /**
     * Retrieve a list of photosphere around campus
     * @return {@link POIInformation}
     */
    public ApiRequest<List<POIInformation>> getPhotospheres(){
        return ApiRequest.createApiRequest(POI_PHOTOSPHERES_ENDPOINT, apiKey,
                new TypeToken<List<POIInformation>>(){}.getType());
    }

    /**
     * Retrieve a list of libraries around campus
     * @return {@link POIInformation}
     */
    public ApiRequest<List<POIInformation>> getLibraries(){
        return ApiRequest.createApiRequest(POI_LIBRARIES_ENDPOINT, apiKey,
                new TypeToken<List<POIInformation>>(){}.getType());
    }

    /**
     * Retrieve a list of AEDs (Defibrillators) around campus
     * @return {@link POIInformation}
     */
    public ApiRequest<List<POIInformation>> getAEDs(){
        return ApiRequest.createApiRequest(POI_DEFIBRILLATORS_ENDPOINT, apiKey,
                new TypeToken<List<POIInformation>>(){}.getType());
    }

    /**
     * Retrieve a list of construction sites around campus
     * @return {@link POIInformation}
     */
    public ApiRequest<List<POIInformation>> getConstructionSites(){
        return ApiRequest.createApiRequest(POI_CONSTRUCTIONSITES_ENDPOINT, apiKey,
                new TypeToken<List<POIInformation>>(){}.getType());
    }

    /**
     * Retrieve a list of accessible entrances around campus
     * @return {@link POIInformation}
     */
    public ApiRequest<List<POIInformation>> getAccessibleEntrances(){
        return ApiRequest.createApiRequest(POI_ACCESSIBLEENTRANCES_ENDPOINT, apiKey,
                new TypeToken<List<POIInformation>>(){}.getType());
    }

    /**
     * Retrieve a list of vistor centres around campus
     * @return {@link POIInformation}
     */
    public ApiRequest<List<POIInformation>> getVisitorCentres(){
        return ApiRequest.createApiRequest(POI_VISITORINFORMATION_ENDPOINT, apiKey,
                new TypeToken<List<POIInformation>>(){}.getType());
    }

}
