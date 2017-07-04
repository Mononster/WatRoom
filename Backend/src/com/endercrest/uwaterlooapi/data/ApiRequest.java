package com.endercrest.uwaterlooapi.data;

import com.google.gson.*;
import com.google.gson.annotations.Expose;
import com.google.gson.reflect.TypeToken;

import java.io.IOException;
import java.lang.reflect.Type;
import java.net.MalformedURLException;
import java.net.URL;

/**
 * Created by Thomas Cordua-von Specht on 11/23/2016.
 */
public class ApiRequest<T> {

    @Expose
    private Meta meta;
    @Expose
    private T data;

    /**
     * Get the meta data of the ApiRequest sent with every api call.
     * @return {@link Meta}
     */
    public Meta getMeta() {
        return meta;
    }

    /**
     * Get the data of the ApiRequest.
     * @return Returns the type of the original request.
     */
    public T getData() {
        return data;
    }

    /**
     * Creates a new API Request with the requested endpoint using the apiKey, which then uses
     * the apiRequestType to construct the object correctly.
     * <br>
     * Examples:<br>
     * createApiRequest(&quot;courses&quot;, &quot;123456&quot;, new TypeToken&lt;ApiRequest&lt;List&lt;CourseMinimal&gt;&gt;&gt;() {}.getType())
     *
     * @param endpoint The endpoint of the university v2 api.
     * @param apiKey Your apiKey given by the university of waterloo.
     * @param apiRequestType references the structure of the ApiRequest. IE {@link TypeToken}
     * @param <Z> The model of the data.
     * @return A Parsed ApiRequest with the type structure given above.
     */
    public static <Z> ApiRequest<Z> createApiRequest(String endpoint, String apiKey, Type apiRequestType) {
        return createApiRequest(endpoint, apiKey, "", apiRequestType);
    }

    /**
     * Creates a new API Request with the requested endpoint using the apiKey, which then uses
     * the apiRequestType to construct the object correctly with parameters.
     * <br>
     * Examples:<br>
     * createApiRequest(&quot;courses&quot;, &quot;123456&quot;, &quot;term=123&quot;, new TypeToken&lt;ApiRequest&lt;List&lt;CourseMinimal&gt;&gt;&gt;() {}.getType())
     *
     * @param endpoint The endpoint of the university v2 api.
     * @param apiKey Your apiKey given by the university of waterloo.
     * @param params Any extra parameters that the path might accept.
     * @param apiRequestType references the structure of the ApiRequest. IE {@link TypeToken}
     * @param <Z> The model of the data.
     * @return A Parsed ApiRequest with the type structure given above.
     */
    public static <Z> ApiRequest<Z> createApiRequest(String endpoint, String apiKey, String params, Type apiRequestType){
        Gson gson = new GsonBuilder().create();

        String json = "";
        try {
            URL url = new URL(String.format("https://api.uwaterloo.ca/v2/%s.json?key=%s%s", endpoint, apiKey, params.equals("") ? "": "&"+params));
            URLDownload download = new URLDownload(url);
            json = download.downloadContents();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return gson.fromJson(json, apiRequestType);
    }

}
