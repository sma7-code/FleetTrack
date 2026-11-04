package com.fleettrack;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

@SpringBootTest
@ActiveProfiles({"local", "test"})
class FleettrackApplicationTests {
    @Test
    void contextLoads() {
    }
}
