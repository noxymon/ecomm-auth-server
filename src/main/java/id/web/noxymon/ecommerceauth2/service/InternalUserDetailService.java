package id.web.noxymon.ecommerceauth2.service;

import id.web.noxymon.ecommerceauth2.repository.AccountRepository;
import id.web.noxymon.ecommerceauth2.repository.entity.Account;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class InternalUserDetailService implements UserDetailsService {
    private final AccountRepository accountRepository;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<Account> accountFound = accountRepository.findFirstByUsernameEqualsIgnoreCase(username);
        if (accountFound.isPresent()) {
            Account account = accountFound.get();
            return new User(
                    account.getUsername(),
                    account.getPassword(),
                    true,
                    true,
                    true,
                    true,
                    Collections.emptySet()
            );
        }
        throw new UsernameNotFoundException("Username cannot be found !");
    }
}
