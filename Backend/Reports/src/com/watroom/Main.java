package com.watroom;

import org.json.JSONArray;
import org.json.JSONObject;
import com.watroom.http;

public class Main {
    static String firebaseURL = "https://watroom-42e0a.firebaseio.com/";

    public static void main(String[] args) {
        String buildings = http.get(firebaseURL+"buildings.json");

        JSONObject reports = new JSONObject();
        JSONObject buildingsJSON = new JSONObject(buildings);
        for(String buildingCode : buildingsJSON.keySet()) {
            JSONObject buildingJSON = buildingsJSON.getJSONObject(buildingCode);
            for(Object roomCode : (JSONArray)buildingJSON.get("classrooms")) {
                reports.put(buildingCode+roomCode, 0);
            }
        }
        http.put(firebaseURL+"reports.json", reports.toString());
    }
}
