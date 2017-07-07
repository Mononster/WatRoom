package com.endercrest.uwaterlooapi.directory;

import com.endercrest.uwaterlooapi.data.ApiRequest;
import com.endercrest.uwaterlooapi.directory.models.DirectoryUser;
import com.google.gson.reflect.TypeToken;

/**
 * Created by Thomas Cordua-von Specht on 12/6/2016.
 */
public class DirectoryAPI {

    private static final String DIRECTORY_ENDPOINT = "directory/%s";

    private final String apiKey;

    public DirectoryAPI(String apiKey){
        this.apiKey = apiKey;
    }

    /**
     * Returns a user information for the given userId.
     * @param userId WatIAM Id, ie "ktalwar"
     * @return {@link DirectoryUser}
     */
    public ApiRequest<DirectoryUser> getUserDetails(String userId){
        return ApiRequest.createApiRequest(String.format(DIRECTORY_ENDPOINT, userId), apiKey,
                new TypeToken<ApiRequest<DirectoryUser>>(){}.getType());
    }
}
