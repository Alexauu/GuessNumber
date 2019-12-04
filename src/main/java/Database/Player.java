package Database;

public class Player {

    private String name;
    private int count_game;
    private int count_win;
    private double rate_win;

    public Player(String name, int count_game, int count_win) {
        this.name = name;
        this.count_game = count_game;
        this.count_win = count_win;
        this.rate_win = this.count_win * 1.0/ count_game;
        try {
            DataProcessing.update();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getName() {
        return name;
    }

    public int getCount_game() {
        return count_game;
    }

    public int getCount_win() {
        return count_win;
    }

    public void increaseTotal() {
        this.count_game++;
        this.rate_win = this.count_win * 1.0 / count_game;
        try {
            DataProcessing.update();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void increaseWin() {
        this.count_win++;
        this.rate_win = this.count_win * 1.0 / count_game;

        try {
            DataProcessing.update();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public double getRate_win() {
        return ((int)(rate_win * 100 + 0.5))/100.0;
    }

    @Override
    public String toString() {
        return name + " " + count_game + " " + count_win + "\n";
    }
}