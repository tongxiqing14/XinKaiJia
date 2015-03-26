package beans;

/**
 * Created by tongxiqing on 2015/3/26.
 */
public class HpDownStepValue {

    private int fighterId;
    private double hpDownStepValue;

    public HpDownStepValue() {
    }

    public HpDownStepValue(int fighterId, double hpDownStepValue) {
        this.fighterId = fighterId;
        this.hpDownStepValue = hpDownStepValue;
    }

    public int getFighterId() {
        return fighterId;
    }

    public void setFighterId(int fighterId) {
        this.fighterId = fighterId;
    }

    public double getHpDownStepValue() {
        return hpDownStepValue;
    }

    public void setHpDownStepValue(double hpDownStepValue) {
        this.hpDownStepValue = hpDownStepValue;
    }

    @Override
    public String toString() {
        return "HpDownStepValue{" +
                "fighterId=" + fighterId +
                ", hpDownStepValue=" + hpDownStepValue +
                '}';
    }
}
