import java.util.ArrayList;

/**
 * Created by Aaron-Home on 2017/7/2.
 */
public class Building {

    static public ArrayList<Building> buildings = new ArrayList<>();

    static public Building hasBuilding(String name) {
        for(Building b : buildings) {
            if(b.name.equals(name)) {
                return b;
            }
        }
        return null;
    }

    Building(String name) {
        this.name = name;
        rooms = new ArrayList<>();
    }

    String name;
    ArrayList<String> rooms;
}
