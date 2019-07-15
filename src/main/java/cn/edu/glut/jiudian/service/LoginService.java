package cn.edu.glut.jiudian.service;

import cn.edu.glut.jiudian.entity.Admin;
import cn.edu.glut.jiudian.entity.User;

/**
 * @author stone(huangshizhang) at 2019-05-31 21:25
 */

public interface LoginService {

    User selectUser(String userName, String userPwd);

    Admin selectAdmin(String adminName, String adminPwd);

    boolean addUser(User user);

    int selectUserByName(String userName);

}
