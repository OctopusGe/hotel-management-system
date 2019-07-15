package cn.edu.glut.jiudian.controller;

import cn.edu.glut.jiudian.entity.Order;
import cn.edu.glut.jiudian.entity.Room;
import cn.edu.glut.jiudian.service.OrderService;
import cn.edu.glut.jiudian.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

/**
 * @author stone(huangshizhang) at 2019-06-13 19:55
 */
@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private RoomService roomService;

    private Order checkout;

    @RequestMapping("ruzhu_management.html")
    public ModelAndView ruzhuManagement(){
        List<Order> orderList = orderService.selectAll();
        ModelAndView mav = new ModelAndView("ruzhu_management");
        mav.addObject("orderList", orderList);
        return mav;
    }

    @RequestMapping("addPayment")
    @ResponseBody
    public Object addPayment(Order order){
        order.setEndTime(new java.sql.Date(new java.util.Date().getTime()));
        HashMap<String, String> res = new HashMap<>();
        if (orderService.updateByRoomId(order)) {
            res.put("stateCode", "1");
        } else {
            res.put("stateCode", "0");
        }
        return res;
    }

    @RequestMapping("checkout")
    @ResponseBody
    public Object checkout(@RequestParam("roomId") String roomId){
        checkout = orderService.selectByRoomId(roomId);
        return true;
    }

    @RequestMapping("ruzhu_checkout.html")
    public ModelAndView ruzhuCheckout(){
        ModelAndView mav = new ModelAndView("ruzhu_checkout");
        mav.addObject("checkout", checkout);
        return mav;
    }

    @RequestMapping("ruzhu_add.html")
    public ModelAndView ruzhuAdd(){
        List<Room> roomList = roomService.selectNotInRuZhu();
        ModelAndView mav = new ModelAndView("ruzhu_add");
        mav.addObject("roomList", roomList);
        return mav;
    }

    @RequestMapping("addRuZhu")
    @ResponseBody
    public Object addRuZhu(Order order){
        order.setStartTime(new java.sql.Date(new java.util.Date().getTime()));

        HashMap<String, String> res = new HashMap<>();
        if (orderService.addOrder(order)) {
            res.put("stateCode", "1");
        } else {
            res.put("stateCode", "0");
        }
        return res;
    }

    @RequestMapping("deleteRuZhu")
    @ResponseBody
    public Object deleteRuZhu(@RequestParam("roomId") String roomId){

        HashMap<String, String> res = new HashMap<>();
        if (orderService.deleteByRoomId(roomId)) {
            res.put("stateCode", "1");
        } else {
            res.put("stateCode", "0");
        }
        return res;
    }
}
