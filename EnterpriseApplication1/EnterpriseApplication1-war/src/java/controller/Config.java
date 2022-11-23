package controller;

import java.time.LocalDateTime;
import java.time.ZoneOffset;

/**
 *
 * @author munky
 */
public class Config {
    private static long startTimestamp = LocalDateTime.now().plusDays(1).toLocalDate().atStartOfDay().toEpochSecond(ZoneOffset.UTC); 
    private static int duration = 24; // in hours 

    public static long getStartTimestamp() {
        return startTimestamp;
    }

    public static void setStartTimestamp(long startTimestamp) {
        Config.startTimestamp = startTimestamp;
    }

    public static int getDuration() {
        return duration;
    }

    public static void setDuration(int duration) {
        Config.duration = duration;
    }
    
    
}
