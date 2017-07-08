package com.endercrest.uwaterlooapi.codes;

import com.endercrest.uwaterlooapi.data.ApiRequest;
import com.endercrest.uwaterlooapi.codes.models.*;
import com.google.gson.reflect.TypeToken;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/5/2016.
 */
public class CodesAPI {

    private static final String UNITS_ENDPOINT = "codes/units";
    private static final String TERMS_ENDPOINT = "codes/terms";
    private static final String GROUPS_ENDPOINT = "codes/groups";
    private static final String SUBJECTS_ENDPOINT = "codes/subjects";
    private static final String INSTRUCTIONS_ENDPOINT = "codes/instructions";

    private final String apiKey;

    public CodesAPI(String apiKey){
        this.apiKey = apiKey;
    }

    /**
     * Retrieve all the units information.
     * @return {@link CodesUnit}
     */
    public ApiRequest<List<CodesUnit>> getUnits(){
        return ApiRequest.createApiRequest(UNITS_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<CodesUnit>>>(){}.getType());
    }

    /**
     * Retrieve all code lookups for terms.
     * @return {@link CodesTerm}
     */
    public ApiRequest<List<CodesTerm>> getTerms(){
        return ApiRequest.createApiRequest(TERMS_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<CodesTerm>>>(){}.getType());
    }

    /**
     * Retrieve all code lookups for groups
     * @return {@link CodesGroup}
     */
    public ApiRequest<List<CodesGroup>> getGroups(){
        return ApiRequest.createApiRequest(GROUPS_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<CodesGroup>>>(){}.getType());
    }

    /**
     * Retrieve a list of all code lookups for subjects
     * @return {@link CodesSubject}
     */
    public ApiRequest<List<CodesSubject>> getSubjects(){
        return ApiRequest.createApiRequest(SUBJECTS_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<CodesSubject>>>(){}.getType());
    }

    /**
     * Retrieve a list of all instructions.
     * @return {@link CodesInstruction}
     */
    public ApiRequest<List<CodesInstruction>> getInstructions(){
        return ApiRequest.createApiRequest(INSTRUCTIONS_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<CodesInstruction>>>(){}.getType());
    }
}
