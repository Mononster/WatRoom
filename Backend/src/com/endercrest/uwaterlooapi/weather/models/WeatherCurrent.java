package com.endercrest.uwaterlooapi.weather.models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Thomas Cordua-von Specht on 12/2/2016.
 */
public class WeatherCurrent {

    private float latitude;
    private float longitude;
    @SerializedName("elevation_m")
    private float elevationM;
    @SerializedName("observation_time")
    private String observationTime;
    @SerializedName("temperature_current_c")
    private float TemperaturCurrentC;
    @SerializedName("humidex_c")
    private float humidexC;
    @SerializedName("windchill_c")
    private float windchillC;
    @SerializedName("temperature_24hr_max_c")
    private float temperature24hrMaxC;
    @SerializedName("temperature_24hr_min_c")
    private float temperature24hrminC;
    @SerializedName("percipitation_15min_mm")
    private float percipitation15minMm;
    @SerializedName("percipitation_1hr_mm")
    private float percipitation1hrMm;
    @SerializedName("percipitation_24hr_mm")
    private float percipitation24hrMm;
    @SerializedName("relative_humidity_percent")
    private float relativeHumidityPercent;
    @SerializedName("dew_point_c")
    private float dewPointC;
    @SerializedName("wind_speed_kph")
    private float windSpeedKph;
    @SerializedName("wind_direction_degrees")
    private float windDirectionDegrees;
    @SerializedName("pressure_kpa")
    private float pressureKpa;
    @SerializedName("pressure_trend")
    private String pressureTrend;
    @SerializedName("incoming_shortwave_radiation_wm2")
    private float incomingShortwaveRadiationWm2;

    public float getLatitude() {
        return latitude;
    }

    public void setLatitude(float latitude) {
        this.latitude = latitude;
    }

    public float getLongitude() {
        return longitude;
    }

    public void setLongitude(float longitude) {
        this.longitude = longitude;
    }

    public float getElevationM() {
        return elevationM;
    }

    public void setElevationM(float elevationM) {
        this.elevationM = elevationM;
    }

    public String getObservationTime() {
        return observationTime;
    }

    public void setObservationTime(String observationTime) {
        this.observationTime = observationTime;
    }

    public float getTemperaturCurrentC() {
        return TemperaturCurrentC;
    }

    public void setTemperaturCurrentC(float temperaturCurrentC) {
        TemperaturCurrentC = temperaturCurrentC;
    }

    public float getHumidexC() {
        return humidexC;
    }

    public void setHumidexC(float humidexC) {
        this.humidexC = humidexC;
    }

    public float getWindchillC() {
        return windchillC;
    }

    public void setWindchillC(float windchillC) {
        this.windchillC = windchillC;
    }

    public float getTemperature24hrMaxC() {
        return temperature24hrMaxC;
    }

    public void setTemperature24hrMaxC(float temperature24hrMaxC) {
        this.temperature24hrMaxC = temperature24hrMaxC;
    }

    public float getTemperature24hrminC() {
        return temperature24hrminC;
    }

    public void setTemperature24hrminC(float temperature24hrminC) {
        this.temperature24hrminC = temperature24hrminC;
    }

    public float getPercipitation15minMm() {
        return percipitation15minMm;
    }

    public void setPercipitation15minMm(float percipitation15minMm) {
        this.percipitation15minMm = percipitation15minMm;
    }

    public float getPercipitation1hrMm() {
        return percipitation1hrMm;
    }

    public void setPercipitation1hrMm(float percipitation1hrMm) {
        this.percipitation1hrMm = percipitation1hrMm;
    }

    public float getPercipitation24hrMm() {
        return percipitation24hrMm;
    }

    public void setPercipitation24hrMm(float percipitation24hrMm) {
        this.percipitation24hrMm = percipitation24hrMm;
    }

    public float getRelativeHumidityPercent() {
        return relativeHumidityPercent;
    }

    public void setRelativeHumidityPercent(float relativeHumidityPercent) {
        this.relativeHumidityPercent = relativeHumidityPercent;
    }

    public float getDewPointC() {
        return dewPointC;
    }

    public void setDewPointC(float dewPointC) {
        this.dewPointC = dewPointC;
    }

    public float getWindSpeedKph() {
        return windSpeedKph;
    }

    public void setWindSpeedKph(float windSpeedKph) {
        this.windSpeedKph = windSpeedKph;
    }

    public float getWindDirectionDegrees() {
        return windDirectionDegrees;
    }

    public void setWindDirectionDegrees(float windDirectionDegrees) {
        this.windDirectionDegrees = windDirectionDegrees;
    }

    public float getPressureKpa() {
        return pressureKpa;
    }

    public void setPressureKpa(float pressureKpa) {
        this.pressureKpa = pressureKpa;
    }

    public String getPressureTrend() {
        return pressureTrend;
    }

    public void setPressureTrend(String pressureTrend) {
        this.pressureTrend = pressureTrend;
    }

    public float getIncomingShortwaveRadiationWm2() {
        return incomingShortwaveRadiationWm2;
    }

    public void setIncomingShortwaveRadiationWm2(float incomingShortwaveRadiationWm2) {
        this.incomingShortwaveRadiationWm2 = incomingShortwaveRadiationWm2;
    }
}
