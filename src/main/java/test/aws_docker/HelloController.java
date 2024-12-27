package test.aws_docker;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String home() {
        return "Welcome to Spring Boot Docker!";
    }

    @GetMapping("/hello")
    public String hello() {
        return "Hello, world!";
    }
}
