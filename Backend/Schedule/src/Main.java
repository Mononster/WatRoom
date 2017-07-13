/**
 * Created by Aaron-Home on 2017/7/2.
 */

import com.endercrest.uwaterlooapi.UWaterlooAPI;
import com.endercrest.uwaterlooapi.buildings.models.BuildingsDetail;
import com.endercrest.uwaterlooapi.courses.models.CourseBase;
import com.endercrest.uwaterlooapi.courses.models.CourseSchedule;
import com.endercrest.uwaterlooapi.data.ApiRequest;
import org.json.JSONObject;

import java.util.*;

public class Main {
    private static int timeToInt(String time) {
        time = time.replace(":", "");
        return Integer.parseInt(time);
    }

    private static String convertDay(int day) {
        switch (day) {
            case 0:
                return "Mon";
            case 1:
                return "Tue";
            case 2:
                return "Wed";
            case 3:
                return "Thu";
            default:
                return "Fri";
        }
    }

    static String firebaseURL = "https://watroom-42e0a.firebaseio.com/";

    public static void main(String[] args){
    	final String initialSchedule = "111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111";

        HashMap<String, HashMap<String, ArrayList<String>>> week = new HashMap<String, HashMap<String, ArrayList<String>>>();

        // for(int i = 0; i < 5; i++) {
            // week.add(new HashMap<>());
        // }

        System.out.print("Pulling course data...\n");
        UWaterlooAPI uWaterlooAPI = new UWaterlooAPI("9df5b8e01a6f19d11a1d7ddd00562da7");

        List<CourseBase> courses = uWaterlooAPI.getCoursesAPI().getAllCourses().getData();
        System.out.print("Building dictionary...\n");
        for(CourseBase course : courses) {
            String subject = course.getSubject();
            String catalog = course.getCatalogNumber();
            ApiRequest<List<CourseSchedule>> schedulesRequest = uWaterlooAPI.getCoursesAPI().getCourseScheduleBySubjectCatalog(subject, catalog);
            if(schedulesRequest == null) {
                continue;
            }
            List<CourseSchedule> schedules = schedulesRequest.getData();
            for(CourseSchedule schedule : schedules) {
                if(schedule != null) {
                    System.out.print(subject+catalog+"\n");
                    List<CourseSchedule.CourseScheduleData> css = schedule.getSchedules();
                    for (CourseSchedule.CourseScheduleData cs : css) {
                        CourseSchedule.CourseScheduleData.CourseLocation location = cs.getLocation();
                        CourseSchedule.CourseScheduleData.CourseDates dates = cs.getDates();
                        if(dates != null && location != null && location.getBuilding() != null) {
                            boolean[] weekdays = {false, false, false, false, false};
                            String w = dates.getWeekdays();
                            if(w == null) {
                                continue;
                            }
                            if (w.contains("M")) {
                                weekdays[0] = true;
                                w = w.replace("M", "");
                            }
                            if (w.contains("Th")) {
                                weekdays[3] = true;
                                w = w.replace("Th", " ");
                            }
                            if (w.contains("T")) {
                                weekdays[1] = true;
                                w = w.replace("T", "");
                            }
                            if (w.contains("W")) {
                                weekdays[2] = true;
                                w = w.replace("W", "");
                            }
                            if (w.contains("F")) {
                                weekdays[4] = true;
                                w = w.replace("F", "");
                            }

                            int day = 0;
                            for(boolean d : weekdays) {
                                if(d) {
                                    Building b = Building.hasBuilding(location.getBuilding());
                                    if(b == null) {
                                        Building building = new Building(location.getBuilding());
                                        Building.buildings.add(building);
                                        week.put(building.name, new HashMap<String, ArrayList<String>>());
                                        // for(HashMap<String, HashMap<String, String>> dayMap: week) {
                                            // dayMap.put(building.name, new HashMap<>());
                                        // }
                                        b = building;
                                    }
                                    if(!b.rooms.contains(location.getRoom())) {
                                        b.rooms.add(location.getRoom());
                                    }

                                    HashMap<String, ArrayList<String>> buildingMap = week.get(b.name);

                                    if(!buildingMap.containsKey(location.getRoom())) {
                                        buildingMap.put(location.getRoom(), new ArrayList<String>());
                                        for (int i = 0; i < 5; ++i) {
                                        	buildingMap.get(location.getRoom()).add(initialSchedule);
                                        }
                                    }
                                    String daySchedule = buildingMap.get(location.getRoom()).get(day);
                                    char[] newSchedule = daySchedule.toCharArray();
                                    int start = timeToInt(dates.getStartTime());
                                    int end = timeToInt(dates.getEndTime());
                                    start = ((start - 700) / 100) * 6 + (start % 100) / 10;
                                    end = ((end - 700) / 100) * 6 + (end % 100) / 10;
                                    while(start <= end) {
                                        newSchedule[start] = '0';
                                        start++;
                                    }
                                    buildingMap.get(location.getRoom()).set(day, String.valueOf(newSchedule));
                                }
                                day++;
                            }
                        }
                    }
                }
            }
        }

        System.out.print("Updating building information...\n");
        JSONObject buildings = new JSONObject();
        for(Building b : Building.buildings) {
            JSONObject buildingJson = new JSONObject();
            buildingJson.put("classrooms", b.rooms);
            ApiRequest<BuildingsDetail> request = uWaterlooAPI.getBuildingsAPI().getBuilding(b.name);
            if(request == null) {
                continue;
            }
            BuildingsDetail buildingsDetail = request.getData();
            buildingJson.put("name", buildingsDetail.getBuildingName());
            buildingJson.put("longitude", buildingsDetail.getLongitude());
            buildingJson.put("latitude", buildingsDetail.getLatitude());
            buildings.put(b.name, buildingJson);
        }
        try {
            http.put(firebaseURL + "buildings.json", buildings.toString());
        }catch (Exception e) {
            System.out.print(e.getMessage()+"\n");
        }

        System.out.print("Updating schedule...\n");
        //for (int i = 0; i < 5; i++) {
            //HashMap<String, HashMap<String, HashMap<Integer, String>>> day = week.get(i);


        JSONObject builds = new JSONObject();
        for(HashMap.Entry<String, HashMap<String, ArrayList<String>>> building: week.entrySet()) {
            HashMap<String, ArrayList<String>> b = building.getValue();
            JSONObject build = new JSONObject();
            for(HashMap.Entry<String, ArrayList<String>> room: b.entrySet()){
                ArrayList<String> r = room.getValue();
                JSONObject classroom = new JSONObject();
                for (int i = 0; i < 5; i++) {
                	String data = r.get(i);
                	String weekday = convertDay(i);
                    classroom.put(weekday, data);
                	//http.put(firebaseURL+"schedule/"+building.getKey()+"/"+room.getKey()+"/"+weekday+".json", data);
                }
                build.put(room.getKey(), classroom);
            }
            builds.put(building.getKey(), build);
        }
        http.put(firebaseURL + "schedule.json", builds.toString());
        //}
    }
}
