package com.websiteshop.dao;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.websiteshop.entity.Account;

public interface AccountDAO extends JpaRepository<Account, String> {

    @Query("SELECT DISTINCT ar.account FROM Authority ar WHERE ar.role.roleId IN ('DIRE', 'STAF')")
    List<Account> getAdministratiors();

    @Query(value = "select * from Accounts where Email like ?1", nativeQuery = true)
    Account findByEmail(String email);

    @Query(value = "select * from Accounts where Reset_password like ?1", nativeQuery = true)
    Account findByResetPasswordToken(String resetPasswordToken);

    Page<Account> findByFullnameContaining(String fullname, Pageable pageable);

    Account findByUsername(String username);

    long countByFullnameContaining(String fullname);

}
