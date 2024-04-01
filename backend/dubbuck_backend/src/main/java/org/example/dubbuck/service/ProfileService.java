package org.example.dubbuck.service;


import lombok.RequiredArgsConstructor;
import org.example.dubbuck.dto.JoinDto;
import org.example.dubbuck.dto.ProfileDto;
import org.example.dubbuck.entity.UserEntity;
import org.example.dubbuck.repository.UserRepository;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class ProfileService {

    private final UserRepository userRepository;

    public ProfileService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void profileProcess(ProfileDto profileDto) {

        String username = profileDto.getUsername();
        String introduction = profileDto.getIntroduction();
        String profileImageUrl = profileDto.getProfileImageUrl();

        Boolean isExist = userRepository.existsByUsername(username);

        if (isExist) {

            return;
        }

        UserEntity data = UserEntity.builder()
                .introduction(introduction)
                .profileImageUrl(profileImageUrl)
                .build();

        userRepository.save(data);
    }
}
