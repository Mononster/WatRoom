package com.endercrest.uwaterlooapi.buildings.models;

import com.google.gson.annotations.SerializedName;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/6/2016.
 */
public class BuildingsVending {

    @SerializedName("building_name")
    private String buildingName;
    @SerializedName("building_acronym")
    private String buildingAcronym;
    @SerializedName("vending_machines")
    private List<BuildingsMachines> vendingMachines;

    public String getBuildingName() {
        return buildingName;
    }

    public void setBuildingName(String buildingName) {
        this.buildingName = buildingName;
    }

    public String getBuildingAcronym() {
        return buildingAcronym;
    }

    public void setBuildingAcronym(String buildingAcronym) {
        this.buildingAcronym = buildingAcronym;
    }

    public List<BuildingsMachines> getVendingMachines() {
        return vendingMachines;
    }

    public void setVendingMachines(List<BuildingsMachines> vendingMachines) {
        this.vendingMachines = vendingMachines;
    }

    public class BuildingsMachines{
        private String location;
        private int machines;
        private List<String> products;

        public String getLocation() {
            return location;
        }

        public void setLocation(String location) {
            this.location = location;
        }

        public int getMachines() {
            return machines;
        }

        public void setMachines(int machines) {
            this.machines = machines;
        }

        public List<String> getProducts() {
            return products;
        }

        public void setProducts(List<String> products) {
            this.products = products;
        }
    }
}
