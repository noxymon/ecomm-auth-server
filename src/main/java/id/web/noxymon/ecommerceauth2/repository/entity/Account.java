package id.web.noxymon.ecommerceauth2.repository.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity(name = "id.web.noxymon.ecommerceauth2.entity.Account")
@Table(name = "ACCOUNT")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String fullname;
    private String username;
    private String password;
}
