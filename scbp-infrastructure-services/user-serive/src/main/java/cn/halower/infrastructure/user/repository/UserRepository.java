package cn.halower.infrastructure.user.repository;

import cn.halower.infrastructure.user.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long>{
    User findUserByUsername(String username);
}
