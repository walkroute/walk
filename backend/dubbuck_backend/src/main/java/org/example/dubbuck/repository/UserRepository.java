package org.example.dubbuck.repository;

import org.example.dubbuck.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserEntity, Long> {

    Boolean existsByUsername(String username);

    //username을 받아 db 테이블에서 회원을 조회하는 메소드
    UserEntity findByUsername(String username);
}
