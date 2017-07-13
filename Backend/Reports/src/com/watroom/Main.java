import org.json.JSONArray;
import org.json.JSONObject;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Main {
    static String firebaseURL = "https://watroom-42e0a.firebaseio.com/";

    public static void main(String[] args) {
        String buildings = http.get(firebaseURL+"buildings.json");

        JSONObject reports = new JSONObject();

        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        reports.put("last update: ", dateFormat.format(date)); //2016/11/16 12:08:43

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
