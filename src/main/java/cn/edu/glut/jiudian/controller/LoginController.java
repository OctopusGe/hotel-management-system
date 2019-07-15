package cn.edu.glut.jiudian.controller;

import cn.edu.glut.jiudian.entity.Admin;
import cn.edu.glut.jiudian.entity.User;
import cn.edu.glut.jiudian.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

/**
 * @author stone(huangshizhang) at 2019-06-04 09:37
 */

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    @RequestMapping(value = {"/","adminLogin.html"})
    public ModelAndView toAdminLogin(HttpServletRequest request) {
        request.getSession().invalidate();
        return new ModelAndView("index");
    }

    @RequestMapping("adminLogout.html")
    public String adminLogout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:adminLogin.html";
    }

    @RequestMapping(value = {"userLogin.html"})
    public ModelAndView toUserLogin(HttpServletRequest request) {
        request.getSession().invalidate();
        return new ModelAndView("user_main");
    }


    @RequestMapping("userLogout.html")
    public String userLogout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:userLogin.html";
    }

    @RequestMapping(value = "/adminLoginCheck", method = RequestMethod.POST)
    @ResponseBody
    public Object adminLoginCheck(HttpServletRequest request, Admin admin){
        Admin admin1 = loginService.selectAdmin(admin.getAdminName(), admin.getAdminPwd());
        HashMap<String, String> res = new HashMap<>();
        if (admin1 != null){
            request.getSession().setAttribute("admin", admin1);
            res.put("stateCode", "1");
            return res;
        }else {
            res.put("stateCode", "0");
        }
        return res;
    }


    @RequestMapping(value = "/userLoginCheck", method = RequestMethod.POST)
    @ResponseBody
    public Object userLoginCheck(HttpServletRequest request, User user){

        User user1 = loginService.selectUser(user.getUserName(), user.getUserPwd());

        HashMap<String, String> res = new HashMap<>();

        if (user1 != null){

            request.getSession().setAttribute("user", user1);

            res.put("stateCode", "1");
            return res;

        }else {
            res.put("stateCode", "0");
        }

        return res;
    }


    @RequestMapping("admin_main.html")
    public ModelAndView adminMain(){
        return new ModelAndView("admin_main");
    }

    @RequestMapping("userRegister")
    @ResponseBody
    public Object userRegister(User user){
        HashMap<String, String> res = new HashMap<>();
        if (loginService.selectUserByName(user.getUserName()) > 0){
            res.put("registerState", "2");
        } else {
            if (loginService.addUser(user)) {
                res.put("registerState", "1");
            } else {
                res.put("registerState", "0");
            }
        }
        return res;
    }

}
