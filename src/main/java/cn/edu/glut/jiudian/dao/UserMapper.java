package cn.edu.glut.jiudian.dao;

import cn.edu.glut.jiudian.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    boolean deleteByPrimaryKey(Integer userId);

    boolean insert(User record);

    User selectByPrimaryKey(Integer userId);

    List<User> selectAll();

    boolean updateByPrimaryKey(User record);

    User selectUser(@Param("userName") String userName, @Param("userPwd") String userPwd);

    int selectUserByName(String userName);

    boolean deleteByName(String userName);
}