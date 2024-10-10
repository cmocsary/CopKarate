package cop.ui;

import com.intuit.karate.junit5.Karate;

public class CopKarateUiRunner {
    @Karate.Test
    Karate copKarateUi(){
        return Karate.run("cop-karate-ui").relativeTo(getClass());
    }
}