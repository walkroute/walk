package org.example.dubbuck.controller;

import org.example.dubbuck.dto.JoinDto;
import org.example.dubbuck.service.JoinService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@ResponseBody
public class JoinController {

    private final JoinService joinService;

    public JoinController(JoinService joinService) {
        this.joinService = joinService;
    }

    @PostMapping("/join")
    public String joinProcess(JoinDto joinDto) {

        joinService.joinProcess(joinDto);

        return "ok";
    }
}
