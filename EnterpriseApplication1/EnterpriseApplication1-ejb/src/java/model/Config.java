/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.Date;

/**
 *
 * @author munky
 */
public class Config {
    //public static long startTimestamp = LocalDateTime.now().plusDays(1).toLocalDate().atStartOfDay().toEpochSecond(ZoneOffset.ofHours(8));
    public static long startTimestamp = LocalDateTime.now().toLocalDate().atStartOfDay().toEpochSecond(ZoneOffset.ofHours(8)); 

    public static long duration = 24 * 60 * 60; // in seconds

    public static long getStartTimestamp() {
        return startTimestamp;
    }

    public static void setStartTimestamp(long startTimestamp) {
        Config.startTimestamp = startTimestamp;
    }

    public static long getDuration() {
        return duration;
    }

    public static void setDuration(long duration) {
        Config.duration = duration;
    }
    
    public static boolean electionEnded(){
        long now = new Date().getTime() / 1000;
        long electionEnd = startTimestamp + (duration);
        
        return (now > electionEnd);
    }
    
    public static boolean electionStarted(){
        long now = new Date().getTime() / 1000;
        
        return (now > startTimestamp);
    }
    
    public static int electionHoursLeft(){
        long now = new Date().getTime() / 1000;
        long diff = startTimestamp + (duration) - now;
        return (int)(diff/(60*60));
    }
    
}
