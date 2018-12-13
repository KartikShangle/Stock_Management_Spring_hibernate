package com.example.stockManagement3.dao;

import com.example.stockManagement3.entity.User;

public interface UserDetailsDao {
	User findUserByUsername(String username);
}
