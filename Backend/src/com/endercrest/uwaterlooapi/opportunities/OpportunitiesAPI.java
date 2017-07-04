package com.endercrest.uwaterlooapi.opportunities;

import com.endercrest.uwaterlooapi.data.ApiRequest;
import com.endercrest.uwaterlooapi.opportunities.models.OpportunityBase;
import com.endercrest.uwaterlooapi.opportunities.models.OpportunityDetails;
import com.endercrest.uwaterlooapi.opportunities.models.OpportunitySite;
import com.google.gson.reflect.TypeToken;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/1/2016.
 */
public class OpportunitiesAPI {

    private static final String OPPORTUNITIES_ENDPOINT = "opportunities";
    private static final String OPPORTUNITIES_SITE_ENDPOINT = "opportunities/%s";
    private static final String OPPORTUNITIES_SITE_ID_ENDPOINT = "opportunities/%s/%s";

    private final String apiKey;

    public OpportunitiesAPI(String apiKey){
        this.apiKey = apiKey;
    }

    /**
     * Retrieves all opportunities available on campus.
     * @return {@link OpportunitySite}
     */
    public ApiRequest<List<OpportunitySite>> getOpportunities(){
        return ApiRequest.createApiRequest(OPPORTUNITIES_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<OpportunitySite>>>(){}.getType());
    }

    /**
     * Retrieves all opportunities based on the site.
     * @param site The site, ie "planning"
     * @return {@link OpportunityBase}
     */
    public ApiRequest<List<OpportunityBase>> getOpportunities(String site){
        return ApiRequest.createApiRequest(String.format(OPPORTUNITIES_SITE_ENDPOINT, site), apiKey,
                new TypeToken<ApiRequest<List<OpportunityBase>>>(){}.getType());
    }

    /**
     * Retrieve the details for a specific opportunity
     * @param site The site, ie "planning"
     * @param id The opportunity id, ie "455"
     * @return {@link OpportunityDetails}
     */
    public ApiRequest<OpportunityDetails> getOpportunity(String site, String id){
        return ApiRequest.createApiRequest(String.format(OPPORTUNITIES_SITE_ID_ENDPOINT, site, id), apiKey,
                new TypeToken<OpportunityDetails>(){}.getType());
    }
}
