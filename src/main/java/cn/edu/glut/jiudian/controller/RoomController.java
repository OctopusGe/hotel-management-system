package cn.edu.glut.jiudian.controller;

import cn.edu.glut.jiudian.entity.Room;
import cn.edu.glut.jiudian.entity.RoomType;
import cn.edu.glut.jiudian.service.RoomService;
import cn.edu.glut.jiudian.service.RoomTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.swing.text.AbstractDocument;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

/**
 * @author stone(huangshizhang) at 2019-06-08 10:49
 */
@Controller
public class RoomController {

    @Autowired
    private RoomService roomService;

    @Autowired
    private RoomTypeService roomTypeService;

    private Room room;

    @RequestMapping("roomsByType")
    @ResponseBody
    public Object rooms(@RequestParam("roomType") String roomType) {
        HashMap<String, List<Room>> res = new HashMap();
        List<Room> roomList = roomService.selectByRoomType(roomType);
        res.put("roomList", roomList);
        return res;
    }

    @RequestMapping("roomsByPrice")
    @ResponseBody
    public Object rooms(@RequestParam("startPrice") String startPrice,
                        @RequestParam("endPrice") String endPrice) {
        BigDecimal startPrice1 = BigDecimal.valueOf(Double.parseDouble(startPrice));
        BigDecimal endPrice1 = BigDecimal.valueOf(Double.parseDouble(endPrice));

        HashMap<String, List<Room>> res = new HashMap();
        List<Room> roomList = roomService.selectByPrice(startPrice1, endPrice1);
        res.put("roomList", roomList);
        return res;
    }

    @RequestMapping("roomDetail")
    @ResponseBody
    public Object roomDetail(@RequestParam("roomId") String roomId) {
        Room room = roomService.selectByRoomId(roomId);
        HashMap<String, Room> res = new HashMap();
        res.put("room", room);
        return res;
    }

    @RequestMapping("room_add.html")
    public ModelAndView addRoom(){
        List<RoomType> roomTypeList = roomTypeService.selectAll();
        ModelAndView mav = new ModelAndView("admin_room_add");
        mav.addObject("roomTypeList", roomTypeList);
        return mav;
    }

    @RequestMapping("doRoomAdd")
    @ResponseBody
    public Object doRoomAdd(Room room){
        HashMap<String, String> res = new HashMap<>();
        if (roomService.exists(room.getRoomId())) {
            res.put("stateCode", "2");
        } else {
            if (roomService.addRoom(room)){
                res.put("stateCode", "1");
            } else {
                res.put("stateCode", "0");
            }
        }
        return res;
    }

    @RequestMapping("room_management.html")
    public ModelAndView roomManagement(){
        List<Room> roomList = roomService.selectAll();
        ModelAndView mav = new ModelAndView("room_management");
        mav.addObject("roomList", roomList);
        return mav;
    }

    @RequestMapping("deleteRoom")
    @ResponseBody
    public Object deleteRoom(@RequestParam("roomId") String roomId){
        HashMap<String, String> res = new HashMap<>();
        if (roomService.deleteRoom(roomId)) {
            res.put("stateCode", "1");
        } else {
            res.put("stateCode", "0");
        }
        return res;
    }


    @RequestMapping("doRoomEdit")
    @ResponseBody
    public Object doRoomEdit(Room room){
        HashMap<String, String> res = new HashMap<>();
        if (roomService.updateRoom(room)) {
            res.put("stateCode", "1");
        } else {
            res.put("stateCode", "0");
        }
        return res;
    }

    @RequestMapping("getEditRoom")
    @ResponseBody
    public Object getEditRoom(@RequestParam("roomId") String roomId){
        room = roomService.selectByRoomId(roomId);
        return true;
    }

    @RequestMapping("room_edit.html")
    public ModelAndView editRoom(){
        List<RoomType> roomTypeList = roomTypeService.selectAll();
        ModelAndView mav = new ModelAndView("room_edit");
        mav.addObject("edit", room);
        mav.addObject("roomTypeList", roomTypeList);
        return mav;
    }
}
