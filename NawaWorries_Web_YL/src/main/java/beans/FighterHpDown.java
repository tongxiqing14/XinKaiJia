package beans;

/**
 * Created by tongxiqing on 2015/3/25.
 */
public class FighterHpDown {

    private int fighterId;
    private int fighterHp;

    public FighterHpDown() {
    }

    public FighterHpDown(int fighterId, int fighterHp) {
        this.fighterId = fighterId;
        this.fighterHp = fighterHp;
    }

    public int getFighterId() {
        return fighterId;
    }

    public void setFighterId(int fighterId) {
        this.fighterId = fighterId;
    }

    public int getFighterHp() {
        return fighterHp;
    }

    public void setFighterHp(int fighterHp) {
        this.fighterHp = fighterHp;
    }

    @Override
    public String toString() {
        return "FighterHpDown{" +
                "fighterId=" + fighterId +
                ", fighterHp=" + fighterHp +
                '}';
    }
}
