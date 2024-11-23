package uz.pdp.uzummarketgit.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private Integer id=idGen++;
    private String phone;
    private String password;
    private Role role;
    private static  Integer idGen=1;

    public User(String phone, String password,Role role) {
        this.phone = phone;
        this.password = password;
        this.role = role;
    }
}
