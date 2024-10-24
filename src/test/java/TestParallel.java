import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class TestParallel {
    @Test
    void testParallel() {
        Results results = Runner.path("classpath:cop").tags("~@skip").parallel(3);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}