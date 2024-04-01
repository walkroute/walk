package org.example.dubbuck.config;

import lombok.RequiredArgsConstructor;
import org.example.dubbuck.jwt.CustomLogoutFilter;
import org.example.dubbuck.jwt.FilterJwt;
import org.example.dubbuck.jwt.LoginFilterJwt;
import org.example.dubbuck.jwt.UtilJwt;
import org.example.dubbuck.repository.RefreshRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.logout.LogoutFilter;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    //AuthenticationManger가 인자로 받을 AuthenticationConfiguration 객체 생성자 주입
    private final AuthenticationConfiguration authenticationConfiguration;

    //UtilJwt 객체 생성자 주입, 토큰 검증&생성
    private final UtilJwt utilJwt;

    private final RefreshRepository refreshRepository;

    public SecurityConfig(AuthenticationConfiguration authenticationConfiguration, UtilJwt utilJwt, RefreshRepository refreshRepository) {
        this.authenticationConfiguration = authenticationConfiguration;
        this.utilJwt = utilJwt;
        this.refreshRepository = refreshRepository;
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {

        return configuration.getAuthenticationManager();
    }

    //비밀번호 암호화
    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {

        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        //csrf disable <- 세션 보호인데 우린 토큰
        http
                .csrf((auth) -> auth.disable());

        //From 로그인 방식 disable
        http
                .httpBasic((auth) -> auth.disable());

        //http basic 인증 방식 disable
        http
                .httpBasic((auth) -> auth.disable());

        //경로별 인가 작업
        http
                .authorizeHttpRequests((auth) -> auth
                        .requestMatchers("/login", "/", "join").permitAll() // 사이트 접근 모두 허용
                        .requestMatchers("/admin").hasRole("ADMIN") // 관리자만
                        .requestMatchers("reissue").permitAll()
                        .anyRequest().authenticated()); // 로그인 사용자만 접근

        http
                .addFilterBefore(new FilterJwt(utilJwt), LoginFilterJwt.class);

        http
                .addFilterAt(new LoginFilterJwt(authenticationManager(authenticationConfiguration), utilJwt, refreshRepository), UsernamePasswordAuthenticationFilter.class);

        http
                .addFilterBefore(new CustomLogoutFilter(utilJwt, refreshRepository), LogoutFilter.class);

        //세션 설정, 가장 중요!!!!
        http
                .sessionManagement((session) -> session
                        .sessionCreationPolicy(SessionCreationPolicy.STATELESS));

        return http.build();
    }
}
