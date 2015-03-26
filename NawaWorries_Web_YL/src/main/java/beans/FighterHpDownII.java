package beans;

/**
 * Created by tongxiqing on 2015/3/25.
 */
public class FighterHpDownII {

    private int fighterId;
    private int hpImgWidth;

    public FighterHpDownII() {
    }

    public FighterHpDownII(int fighterId, int hpImgWidth) {
        this.fighterId = fighterId;
        this.hpImgWidth = hpImgWidth;
    }

    public int getFighterId() {
        return fighterId;
    }

    public void setFighterId(int fighterId) {
        this.fighterId = fighterId;
    }

    public int getHpImgWidth() {
        return hpImgWidth;
    }

    public void setHpImgWidth(int hpImgWidth) {
        this.hpImgWidth = hpImgWidth;
    }

    @Override
    public String toString() {
        return "FighterHpDownII{" +
                "fighterId=" + fighterId +
                ", hpImgWidth=" + hpImgWidth +
                '}';
    }
}
