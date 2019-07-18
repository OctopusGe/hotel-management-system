package daotest;

import cn.edu.glut.jiudian.service.LoginService;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

/**
 * @author stone(huangshizhang) at 2019-06-04 10:38
 */

public class LoginTest extends BaseTest {

    @Autowired
    private LoginService loginService;

    @Before
    public void setUp(){
        System.out.println("LoginTest.setUp");
    }

    @After
    public void tearDown(){
        System.out.println("LoginTest.tearDown");
    }

    @Test
    public void testLoginCheck(){
//        User user = loginService.selectUser("admin", "123456");
//        System.out.println(user.getJob());
        System.out.println(java.sql.Date.valueOf("2019-05-10"));
        System.out.println(loginService.selectUserByName("zyg"));
    }
}
