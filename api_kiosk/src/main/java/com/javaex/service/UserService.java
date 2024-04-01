package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.UserDao;
import com.javaex.vo.UserVo;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	public int exeSave(UserVo userVo) {
		System.out.println("UserService.exeSave()");
		UserVo uVo = userDao.userSelect(userVo);
		int count;
		//유저정보가 있음
		if(uVo != null) {
			userVo.setNo(uVo.getNo());
			System.out.println(userVo);
			//포인트 추가
			userVo.setPoint(uVo.getPoint()+userVo.getPoint());
			count = userDao.userUpdate(userVo);
		} else { //유저정보 없음
			//유저 추가
			userDao.userInsert(userVo);
			count = userDao.userUpdate(userVo);
		}
		return count;
	}
}
