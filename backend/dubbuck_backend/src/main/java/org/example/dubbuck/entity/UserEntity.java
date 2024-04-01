package org.example.dubbuck.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class UserEntity extends BaseTimeEntity{

    @Id
    @GeneratedValue
    private Long id;

    private String username;
    private String password;

    private String nickname;
    private String introduction;
    private String profileImageUrl;

    private String role;


}
