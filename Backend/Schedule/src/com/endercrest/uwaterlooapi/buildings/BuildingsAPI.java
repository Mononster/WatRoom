package com.endercrest.uwaterlooapi.buildings;

import com.endercrest.uwaterlooapi.data.ApiRequest;
import com.endercrest.uwaterlooapi.buildings.models.BuildingAccessPoint;
import com.endercrest.uwaterlooapi.buildings.models.BuildingsDetail;
import com.endercrest.uwaterlooapi.buildings.models.BuildingsRoomCourse;
import com.endercrest.uwaterlooapi.buildings.models.BuildingsVending;
import com.google.gson.reflect.TypeToken;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/6/2016.
 */
public class BuildingsAPI {

    private static final String BUILDINGS_LIST_ENDPOINT = "buildings/list";
    private static final String BUILDING_ENDPOINT = "buildings/%s";
    private static final String BUILDING_ROOM_COURSES_ENDPOINT = "buildings/%s/%s/courses";
    private static final String BUILDING_ACCESS_ENDPOINT = "buildings/%s/accesspoints";
    private static final String BUILDING_VENDING_ENDPOINT = "buildings/%s/vendingmachines";

    private final String apiKey;

    public BuildingsAPI(String apiKey){
        this.apiKey = apiKey;
    }

    /**
     * Retrieve a list of official buildings.
     * @return {@link BuildingsDetail}
     */
    public ApiRequest<List<BuildingsDetail>> getBuildings(){
        return ApiRequest.createApiRequest(BUILDINGS_LIST_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<BuildingsDetail>>>(){}.getType());
    }

    /**
     * Retrieve details on a specific building.
     * @param buildingCode The building code, ie "MHR"
     * @return {@link BuildingsDetail}
     */
    public ApiRequest<BuildingsDetail> getBuilding(String buildingCode){
        return ApiRequest.createApiRequest(String.format(BUILDING_ENDPOINT, buildingCode), apiKey,
                new TypeToken<ApiRequest<BuildingsDetail>>(){}.getType());
    }

    /**
     * Retrieve a list of all courses for a given room and building
     * @param building The building code, ie "MC"
     * @param room The room number, ie "2038"
     * @return {@link BuildingsRoomCourse}
     */
    public ApiRequest<List<BuildingsRoomCourse>> getCourses(String building, String room){
        return ApiRequest.createApiRequest(String.format(BUILDING_ROOM_COURSES_ENDPOINT, building, room), apiKey,
                new TypeToken<ApiRequest<List<BuildingsRoomCourse>>>(){}.getType());
    }

    /**
     * Retrieve a list of all access points in the given building.
     * @param buildingCode The building code, ie "MC"
     * @return {@link BuildingAccessPoint}
     */
    public ApiRequest<List<BuildingAccessPoint>> getAccessPoints(String buildingCode){
        return ApiRequest.createApiRequest(String.format(BUILDING_ACCESS_ENDPOINT, buildingCode), apiKey,
                new TypeToken<ApiRequest<List<BuildingAccessPoint>>>(){}.getType());
    }

    /**
     * Retrieve a list of vending machines in the given building
     * @param buildingCode The building code, ie "MC"
     * @return {@link BuildingsVending}
     */
    public ApiRequest<BuildingsVending> getVendingMachines(String buildingCode){
        return ApiRequest.createApiRequest(String.format(BUILDING_VENDING_ENDPOINT, buildingCode), apiKey,
                new TypeToken<ApiRequest<BuildingsVending>>(){}.getType());
    }
}
