package inventory;

import com.intuit.karate.junit5.Karate;

public class RunnerTest {

    @Karate.Test
    Karate testRunner() {

        return Karate.run("classpath:inventory/Flows");
    }

}
