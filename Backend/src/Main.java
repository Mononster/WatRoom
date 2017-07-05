/**
 * Created by Aaron-Home on 2017/7/2.
 */

import com.endercrest.uwaterlooapi.UWaterlooAPI;
import com.endercrest.uwaterlooapi.buildings.models.BuildingsDetail;
import com.endercrest.uwaterlooapi.courses.models.CourseBase;
import com.endercrest.uwaterlooapi.courses.models.CourseSchedule;
import javafx.util.Pair;
import org.json.JSONObject;

import javax.swing.plaf.ButtonUI;
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

        ArrayList<HashMap<String, HashMap<String, HashMap<Integer, String>>>> week = new ArrayList<>();

        for(int i = 0; i < 5; i++) {
            week.add(new HashMap<>());
        }

        UWaterlooAPI uWaterlooAPI = new UWaterlooAPI("9df5b8e01a6f19d11a1d7ddd00562da7");
        List<CourseBase> courses = uWaterlooAPI.getCoursesAPI().getAllCourses().getData();
        for(CourseBase course : courses) {
            String subject = course.getSubject();
            String catalog = course.getCatalogNumber();
            List<CourseSchedule> schedules = uWaterlooAPI.getCoursesAPI().getCourseScheduleBySubjectCatalog(subject, catalog).getData();
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
                                        for(HashMap<String, HashMap<String, HashMap<Integer, String>>> dayMap: week) {
                                            dayMap.put(building.name, new HashMap<>());
                                        }
                                        b = building;
                                    }
                                    if(!b.rooms.contains(location.getRoom())) {
                                        b.rooms.add(location.getRoom());
                                    }
                                    HashMap<String, HashMap<Integer, String>> buildingMap = week.get(day).get(b.name);
                                    if(!buildingMap.containsKey(location.getRoom())) {
                                        HashMap dayMap = new HashMap<Integer, String>();
                                        for(int time = 700; time < 2260; time += 10) {
                                            if(time % 100 == 60) {
                                                time += 40;
                                            }
                                            dayMap.put(time, "free");
                                        }
                                        buildingMap.put(location.getRoom(), dayMap);
                                    }
                                    HashMap<Integer, String> dayMap = buildingMap.get(location.getRoom());
                                    int start = timeToInt(dates.getStartTime());
                                    int end = timeToInt(dates.getEndTime());
                                    while(start <= end) {
                                        dayMap.replace(start, subject+catalog);
                                        start += 10;
                                        if(start % 100 == 60) {
                                            start += 40;
                                        }
                                    }
                                }
                                day++;
                            }
                        }
                    }
                }
            }
        }

        for(Building b : Building.buildings) {
            JSONObject buildingJson = new JSONObject();
            buildingJson.put("classrooms", b.rooms);
            BuildingsDetail buildingsDetail = uWaterlooAPI.getBuildingsAPI().getBuilding(b.name).getData();
            buildingJson.put("name", buildingsDetail.getBuildingName());
            buildingJson.put("longitude", buildingsDetail.getLongitude());
            buildingJson.put("latitude", buildingsDetail.getLatitude());
            http.put(firebaseURL+b.name+".json", buildingJson.toString());
        }

        for (int i = 0; i < 5; i++) {
            HashMap<String, HashMap<String, HashMap<Integer, String>>> day = week.get(i);
            String weekday = convertDay(i);
            for(HashMap.Entry<String, HashMap<String, HashMap<Integer, String>>> building: day.entrySet()) {
                HashMap<String, HashMap<Integer, String>> b = building.getValue();
                for(HashMap.Entry<String, HashMap<Integer, String>> room: b.entrySet()){
                    HashMap<Integer, String> r = room.getValue();
                    JSONObject jsonObject = new JSONObject();
                    for(HashMap.Entry<Integer, String> entry : r.entrySet()) {
                        jsonObject.put(String.valueOf(entry.getKey()), entry.getValue());
                    }
                    String data = jsonObject.toString();
                    http.put(firebaseURL+"schedule/"+weekday+"/"+building.getKey()+"/"+room.getKey()+".json", data);
                }
            }
        }
    }
}
