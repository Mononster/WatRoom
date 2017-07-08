package com.endercrest.uwaterlooapi.parking;

import com.endercrest.uwaterlooapi.data.ApiRequest;
import com.endercrest.uwaterlooapi.parking.models.ParkingCapacity;
import com.endercrest.uwaterlooapi.parking.models.ParkingLot;
import com.google.gson.reflect.TypeToken;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/6/2016.
 */
public class ParkingAPI {

    private static final String WATPARK_ENDPOINT = "parking/watpark";
    private static final String LOTS_METER_ENDPOINT = "parking/lots/meter";
    private static final String LOTS_PERMIT_ENDPOINT = "parking/lots/permit";
    private static final String LOTS_VISITOR_ENDPOINT = "parking/lots/visitor";
    private static final String LOTS_SHORTTERM_ENDPOINT = "parking/lots/shortterm";
    private static final String LOTS_ACCESSIBLE_ENDPOINT = "parking/lots/accessible";
    private static final String LOTS_MOTORCYCLE_ENDPOINT = "parking/lots/motercycle";

    private final String apiKey;

    public ParkingAPI(String apiKey) {
        this.apiKey = apiKey;
    }

    /**
     * Retrieve real-time parking counts in select parking lots across campus.
     * @return {@link ParkingCapacity}
     */
    public ApiRequest<List<ParkingCapacity>> getParkingCount() {
        return ApiRequest.createApiRequest(WATPARK_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<ParkingCapacity>>>() {}.getType());
    }

    /**
     * Retrieve a list of metered lots across campus.
     * @return {@link ParkingLot}
     */
    public ApiRequest<List<ParkingLot>> getMeteredLots(){
        return ApiRequest.createApiRequest(LOTS_METER_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<ParkingLot>>>(){}.getType());
    }

    /**
     * Retrieve a list of lots requiring permits across campus.
     * @return {@link ParkingLot}
     */
    public ApiRequest<List<ParkingLot>> getPermitedLots(){
        return ApiRequest.createApiRequest(LOTS_PERMIT_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<ParkingLot>>>(){}.getType());
    }

    /**
     * Retrieve a list of lots for visitors across campus.
     * @return {@link ParkingLot}
     */
    public ApiRequest<List<ParkingLot>> getVisitorLots(){
        return ApiRequest.createApiRequest(LOTS_VISITOR_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<ParkingLot>>>(){}.getType());
    }

    /**
     * Retrieve a list of lots for short term parking across campus.
     * @return {@link ParkingLot}
     */
    public ApiRequest<List<ParkingLot>> getShortTermLots(){
        return ApiRequest.createApiRequest(LOTS_SHORTTERM_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<ParkingLot>>>(){}.getType());
    }

    /**
     * Retrieve a list of accessible parking lots across campus.
     * @return {@link ParkingLot}
     */
    public ApiRequest<List<ParkingLot>> getAccessibleLots(){
        return ApiRequest.createApiRequest(LOTS_ACCESSIBLE_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<ParkingLot>>>(){}.getType());
    }

    /**
     * Retrieve a list of motorcycle allowed lots across campus.
     * @return {@link ParkingLot}
     */
    public ApiRequest<List<ParkingLot>> getMotorcycleLots(){
        return ApiRequest.createApiRequest(LOTS_MOTORCYCLE_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<ParkingLot>>>(){}.getType());
    }
}
