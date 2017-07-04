package com.endercrest.uwaterlooapi.weather;

import com.endercrest.uwaterlooapi.data.ApiRequest;
import com.endercrest.uwaterlooapi.weather.models.WeatherCurrent;
import com.google.gson.reflect.TypeToken;

/**
 * Created by Thomas Cordua-von Specht on 12/2/2016.
 */
public class WeatherAPI {

    private static final String WEATHER_ENDPOINT = "weather/current";

    private final String apiKey;

    public WeatherAPI(String apiKey){
        this.apiKey = apiKey;
    }

    /**
     * Returns the current weather details for the University of Waterloo.
     * @see <a href="http://weather.uwaterloo.ca">http://weather.uwaterloo.ca</a>
     * @return {@link WeatherCurrent}
     */
    public ApiRequest<WeatherCurrent> getCurrentWeather(){
        return ApiRequest.createApiRequest(WEATHER_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<WeatherCurrent>>(){}.getType());
    }
}
