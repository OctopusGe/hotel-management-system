package cn.edu.glut.jiudian.controller;

import cn.edu.glut.jiudian.entity.Notice;
import cn.edu.glut.jiudian.entity.Room;
import cn.edu.glut.jiudian.entity.RoomType;
import cn.edu.glut.jiudian.entity.User;
import cn.edu.glut.jiudian.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

/**
 * @author stone(huangshizhang) at 2019-06-07 20:02
 */
@Controller
public class UserController {

    @Autowired
    private RoomTypeService roomTypeService;

    @Autowired
    private ReserveService reserveService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private UserService userService;

    @RequestMapping("user_main.html")
    public ModelAndView userMain(){
        List<RoomType> roomTypeList = roomTypeService.selectAll();
        ModelAndView mav = new ModelAndView("user_main");
        mav.addObject("roomTypeList", roomTypeList);
        List<Room> roomList = roomService.selectAll();
        mav.addObject("roomList", roomList);
        List<Notice> noticeList = noticeService.selectAll();
        mav.addObject("noticeList", noticeList);
        return mav;
    }

    @RequestMapping(value = "room_type.html", method = RequestMethod.GET)
    public ModelAndView roomType(@RequestParam(value = "typeId") int typeId, @RequestParam(value = "type") String type){
        List<Room> roomList = reserveService.selectByRoomType(type);
        ModelAndView mav = new ModelAndView("user_main");
        mav.addObject("roomList", roomList);
        return mav;
    }

    @RequestMapping("deleteUser")
    @ResponseBody
    public Object deleteUser(@RequestParam("userName") String userName){
        HashMap<String, String> res = new HashMap<>();
        if (userService.deleteUser(userName)){
            res.put("stateCode", "1");
        } else {
            res.put("stateCode", "0");
        }
        return res;
    }

    @RequestMapping("user_management.html")
    public ModelAndView toUserInfoManagement(){
        List<User> userList = userService.selectAll();
        ModelAndView mav = new ModelAndView("user_management");
        mav.addObject("userList", userList);
        return mav;
    }
}
