package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public UserVo userSelect(UserVo userVo) {
		System.out.println("UserDao.PointUpdate()");
		UserVo uVo = sqlSession.selectOne("user.selectUser", userVo);
		//System.out.println(uVo);
		return uVo;
	}
	
	public int userUpdate(UserVo userVo) {
		System.out.println("UserDao.userUpdate()");
		sqlSession.update("user.savePoint", userVo);
		return 0;
	}
	
	public int userInsert(UserVo userVo) {
		System.out.println("UserDao.userInsert()");
		sqlSession.insert("user.userInsert", userVo);
		return 0;
	}

}
