package id.web.noxymon.ecommerceauth2;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootTest
class EcommerceAuth2ApplicationTests {

    @Test
    void contextLoads() {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String admin1234 = passwordEncoder.encode("admin1234");
        System.out.println(admin1234);
    }

}
