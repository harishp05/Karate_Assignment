package Kar_Problem1;

import org.junit.jupiter.api.Test;

public class Experment {
    @Test

    public void read_data()
    {

        Reusable obj=new Reusable();
        obj.read_Excel("TC001","petid");
        obj.read_Excel("TC001","petname");
    }
}
