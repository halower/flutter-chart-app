package cn.halower.infrastructure.uaa.repositorys;

import cn.halower.infrastructure.uaa.domains.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findUserByUsername(String username);
}
