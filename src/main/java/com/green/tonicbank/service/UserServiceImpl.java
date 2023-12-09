package com.green.tonicbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.tonicbank.dao.UserDao;
import com.green.tonicbank.model.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
    UserDao userDao; // UserDao 주입 
    
	// 회원가입
	@Override
	public int join(User user) throws Exception {
		return userDao.join(user);
	}
	
	// 아이디 중복 확인
    @Override
    public int idCheck(String userId) throws Exception {
    	return userDao.idCheck(userId);
    }
    
}
