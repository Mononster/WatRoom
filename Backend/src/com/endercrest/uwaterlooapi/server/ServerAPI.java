package com.endercrest.uwaterlooapi.server;

import com.endercrest.uwaterlooapi.data.ApiRequest;
import com.endercrest.uwaterlooapi.server.models.ServerCode;
import com.endercrest.uwaterlooapi.server.models.ServerTime;
import com.google.gson.reflect.TypeToken;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/6/2016.
 */
public class ServerAPI {

    private static final String TIME_ENDPOINT = "server/time";
    private static final String CODES_ENDPOINT = "server/codes";

    private final String apiKey;

    public ServerAPI(String apiKey){
        this.apiKey = apiKey;
    }

    /**
     * Retrieve the server time.
     * @return {@link ServerTime}
     */
    public ApiRequest<ServerTime> getServerTime(){
        return ApiRequest.createApiRequest(TIME_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<ServerTime>>(){}.getType());
    }

    /**
     * Return list of all possible API error codes.
     * @return {@link ServerCode}
     */
    public ApiRequest<List<ServerCode>> getServerCodes(){
        return ApiRequest.createApiRequest(CODES_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<ServerCode>>>(){}.getType());
    }
}
