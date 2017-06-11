package com.uw_room_finder.timers;

import java.util.List;

import com.backendless.Backendless;
import com.backendless.logging.Logger;
import com.backendless.servercode.annotation.BackendlessTimer;
import com.endercrest.uwaterlooapi.*;
import com.endercrest.uwaterlooapi.buildings.models.BuildingsDetail;
    
/**
* UwTimer is a timer.
* It is executed according to the schedule defined in Backendless Console. The
* class becomes a timer by extending the TimerExtender class. The information
* about the timer, its name, schedule, expiration date/time is configured in
* the special annotation - BackendlessTimer. The annotation contains a JSON
* object which describes all properties of the timer.
*/
@BackendlessTimer("{'startDate':1496698281000,'language':'JAVA','mode':'DRAFT','category':'TIMER','frequency':{'schedule':'monthly','repeat':{'every':[4,8,12],'on':{'days':null,'weekdays':{'on':['last'],'weekdays':[2]}}}},'timername':'uw'}")
public class UwTimer extends com.backendless.servercode.extension.TimerExtender
{
    
  @Override
  public void execute( String appVersionId ) throws Exception
  {
	  Logger logger = Backendless.Logging.getLogger("com.UWRoomFinder.UwTimer");
	  try{
		  UWaterlooAPI api = new UWaterlooAPI("9df5b8e01a6f19d11a1d7ddd00562da7");
		  List<BuildingsDetail> buildings = api.getBuildingsAPI().getBuildings().getData();
		  for(BuildingsDetail b : buildings) {
			  logger.debug(b.getBuildingName());
		  }
	  }catch (Exception e) {
		  logger.error("exception", e);
	  }
  }
    
}
        