package id.web.noxymon.ecommerceauth2.repository;

import id.web.noxymon.ecommerceauth2.repository.entity.Account;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AccountRepository extends BaseRepository<Account, Integer> {
    Optional<Account> findFirstByUsernameEqualsIgnoreCase(String username);
}
