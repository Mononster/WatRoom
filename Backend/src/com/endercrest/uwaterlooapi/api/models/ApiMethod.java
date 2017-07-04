package com.endercrest.uwaterlooapi.api.models;

import com.google.gson.annotations.SerializedName;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/6/2016.
 */
public class ApiMethod {

    @SerializedName("method_id")
    private int methodId;
    @SerializedName("method_url")
    private String methodUrl;
    @SerializedName("service_id")
    private int serviceId;
    @SerializedName("service_name")
    private String serviceName;
    private List<String> parameters;

    public int getMethodId() {
        return methodId;
    }

    public void setMethodId(int methodId) {
        this.methodId = methodId;
    }

    public String getMethodUrl() {
        return methodUrl;
    }

    public void setMethodUrl(String methodUrl) {
        this.methodUrl = methodUrl;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public List<String> getParameters() {
        return parameters;
    }

    public void setParameters(List<String> parameters) {
        this.parameters = parameters;
    }
}
