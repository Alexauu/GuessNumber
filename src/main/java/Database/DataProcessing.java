package Database;

import java.io.*;
import java.util.List;

public class DataProcessing {
    private static BufferedReader in;
    private static BufferedWriter out;
    private static final String FILE_PATH = "d:\\player_data.txt";
    private static File file;
    static{
        try {
            file = new File(FILE_PATH);
            if (!file.exists()){
                System.out.println(file.createNewFile());
            }
            in = new BufferedReader(new InputStreamReader(new FileInputStream(file),"GBK"));
            String player_data;
            String[] player;
            List<Player> players = Data.getPlayers();
            while((player_data = in.readLine()) != null){
                player = player_data.split(" ");
                players.add(new Player(player[0], Integer.valueOf(player[1]), Integer.valueOf(player[2])));
            }
            Data.sort();
            in.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void init(){}

    public static void update() throws Exception {
        out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "GBK"));
        List<Player> players = Data.getPlayers();
        for (Player player : players) {
            out.write(player.toString());
        }
        out.flush();
        out.close();
    }
}
