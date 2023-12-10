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
	
	// 유저 가져오기
	@Override
	public User select(String userId) throws Exception {
		return userDao.select(userId);
	}
	
	// 아이디 중복 확인
    @Override
    public int idCheck(String userId) throws Exception {
    	return userDao.idCheck(userId);
    }
    
    // 닉네임 중복 확인
    @Override
    public int nickCheck(String nick) throws Exception {
    	return userDao.nickCheck(nick);
    }
    
    // 이메일 중복 확인
    @Override
    public int emailCheck(String email) throws Exception {
    	return userDao.emailCheck(email);
    }
    
}
