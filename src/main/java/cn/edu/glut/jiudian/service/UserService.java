package cn.edu.glut.jiudian.service;

import cn.edu.glut.jiudian.entity.User;

import java.util.List;

/**
 * @author stone(huangshizhang) at 2019-06-11 10:24
 */
public interface UserService {

    boolean deleteUser(String userName);

    List<User> selectAll();
}
