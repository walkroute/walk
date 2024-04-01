package org.example.dubbuck.controller;

import org.example.dubbuck.dto.ProfileDto;
import org.example.dubbuck.service.ProfileService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@ResponseBody
public class ProfileController {

    private final ProfileService profileService;

    public ProfileController(ProfileService profileService) {
        this.profileService = profileService;
    }

    @PostMapping("/profile")
    public String profileProcess(ProfileDto profileDto) {

        profileService.profileProcess(profileDto);

        return "ok";
    }
}
