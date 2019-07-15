package cn.edu.glut.jiudian.controller;

import cn.edu.glut.jiudian.entity.RoomType;
import cn.edu.glut.jiudian.service.RoomTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

/**
 * @author stone(huangshizhang) at 2019-06-12 22:18
 */
@Controller
public class roomTypeController {

    @Autowired
    private RoomTypeService roomTypeService;

    @RequestMapping("room_type_info.html")
    public ModelAndView roomTypeInfo(){
        List<RoomType> roomTypeList = roomTypeService.selectAll();
        ModelAndView mav = new ModelAndView("roomtype_info");
        mav.addObject("roomTypeList", roomTypeList);
        return mav;
    }

    @RequestMapping("addRoomType")
    @ResponseBody
    public Object addRoomType(RoomType roomType){
        HashMap<String, String> res = new HashMap<>();
        if (roomTypeService.addRoomType(roomType)) {
            res.put("stateCode", "1");
        } else {
            res.put("stateCode", "0");
        }
        return res;
    }

    @RequestMapping("deleteRoomType")
    @ResponseBody
    public Object deleteRoomType(@RequestParam("typeId") Integer typeId){
        HashMap<String, String> res = new HashMap<>();
        if (roomTypeService.deleteRoomType(typeId)) {
            res.put("stateCode", "1");
        } else {
            res.put("stateCode", "0");
        }
        return res;
    }
}
