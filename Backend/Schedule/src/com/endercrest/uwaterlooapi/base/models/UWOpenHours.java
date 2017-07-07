package com.endercrest.uwaterlooapi.base.models;

/**
 * Created by Thomas Cordua-von Specht on 12/1/2016.
 */
public class UWOpenHours{

    private UWDay sunday;
    private UWDay monday;
    private UWDay tuesday;
    private UWDay wednesday;
    private UWDay thursday;
    private UWDay friday;
    private UWDay saturday;

    public UWDay getSunday() {
        return sunday;
    }

    public void setSunday(UWDay sunday) {
        this.sunday = sunday;
    }

    public UWDay getMonday() {
        return monday;
    }

    public void setMonday(UWDay monday) {
        this.monday = monday;
    }

    public UWDay getTuesday() {
        return tuesday;
    }

    public void setTuesday(UWDay tuesday) {
        this.tuesday = tuesday;
    }

    public UWDay getWednesday() {
        return wednesday;
    }

    public void setWednesday(UWDay wednesday) {
        this.wednesday = wednesday;
    }

    public UWDay getThursday() {
        return thursday;
    }

    public void setThursday(UWDay thursday) {
        this.thursday = thursday;
    }

    public UWDay getFriday() {
        return friday;
    }

    public void setFriday(UWDay friday) {
        this.friday = friday;
    }

    public UWDay getSaturday() {
        return saturday;
    }

    public void setSaturday(UWDay saturday) {
        this.saturday = saturday;
    }
}