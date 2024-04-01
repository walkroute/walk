package org.example.dubbuck;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@EnableJpaAuditing
@SpringBootApplication
public class DubbuckApplication {

    public static void main(String[] args) {
        SpringApplication.run(DubbuckApplication.class, args);
    }

}
