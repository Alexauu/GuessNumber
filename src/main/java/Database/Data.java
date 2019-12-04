package Database;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class Data {
    private static List<Player> players = new ArrayList<>();


    public static boolean isExitPlayer(String name){
        DataProcessing.init();
        for (Player player : players) {
            if (name.equals(player.getName()))
                return true;
        }
        return false;
    }

    public static void sort(){
        players.sort((o1, o2) -> {
            if (o1.getRate_win()>o2.getRate_win())
                return -1;
            return 0;
        });
    }

    public static void addPlayer(String name) {
        players.add(new Player(name, 1, 0));
    }

    public static List<Player> getPlayers() {
        return players;
    }

    private static Player getPlayer(String name) {
        for (Player player : players) {
            if (name.equals(player.getName()))
                return player;
        }
        return null;
    }

    public static void increaseTotal(String name){
        Player player = getPlayer(name);
        if (player != null) {
            player.increaseTotal();
        }
    }

    public static void increaseSuccess(String name){
        Player player = getPlayer(name);
        if (player != null) {
            player.increaseWin();
        }
        Data.sort();
    }
}
