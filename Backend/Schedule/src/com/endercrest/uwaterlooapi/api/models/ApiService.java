package com.endercrest.uwaterlooapi.api.models;

import com.google.gson.annotations.SerializedName;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/6/2016.
 */
public class ApiService {

    @SerializedName("service_id")
    private int serviceId;
    @SerializedName("service_name")
    private String serviceName;
    @SerializedName("service_url")
    private String serviceUrl;
    private List<ApiServicesMethod> methods;

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

    public String getServiceUrl() {
        return serviceUrl;
    }

    public void setServiceUrl(String serviceUrl) {
        this.serviceUrl = serviceUrl;
    }

    public List<ApiServicesMethod> getMethods() {
        return methods;
    }

    public void setMethods(List<ApiServicesMethod> methods) {
        this.methods = methods;
    }

    public class ApiServicesMethod{
        @SerializedName("method_id")
        private String methodId;
        @SerializedName("method_url")
        private String methodUrl;

        public String getMethodId() {
            return methodId;
        }

        public void setMethodId(String methodId) {
            this.methodId = methodId;
        }

        public String getMethodUrl() {
            return methodUrl;
        }

        public void setMethodUrl(String methodUrl) {
            this.methodUrl = methodUrl;
        }
    }
}
