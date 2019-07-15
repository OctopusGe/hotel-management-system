package cn.edu.glut.jiudian.service.impl;

import cn.edu.glut.jiudian.dao.AdminMapper;
import cn.edu.glut.jiudian.dao.UserMapper;
import cn.edu.glut.jiudian.entity.Admin;
import cn.edu.glut.jiudian.entity.User;
import cn.edu.glut.jiudian.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author stone(huangshizhang) at 2019-06-04 10:03
 */

@Service("loginService")
public class LoginServiceImpl implements LoginService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public User selectUser(String userName, String userPwd) {
        return userMapper.selectUser(userName,userPwd);
    }

    @Override
    public Admin selectAdmin(String adminName, String adminPwd) {
        return adminMapper.selectAdmin(adminName, adminPwd);
    }

    @Override
    public boolean addUser(User user) {
        return userMapper.insert(user);
    }

    @Override
    public int selectUserByName(String userName) {
        return userMapper.selectUserByName(userName);
    }

}
