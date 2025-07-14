package com.example.blogging_platform.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.blogging_platform.Model.User;

public interface UserRepository extends JpaRepository<User, Integer> {
    
    // ✅ For login validation
    User findByUsernameAndPassword(String username, String password);
    
    // ✅ For fetching user by username
    User findByUsername(String username);
}
