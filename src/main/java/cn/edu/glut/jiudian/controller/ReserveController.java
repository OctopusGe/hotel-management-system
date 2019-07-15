package cn.edu.glut.jiudian.controller;

import cn.edu.glut.jiudian.entity.Reserve;
import cn.edu.glut.jiudian.service.ReserveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

/**
 * @author stone(huangshizhang) at 2019-06-07 19:39
 */
@Controller
public class ReserveController {

    @Autowired
    private ReserveService reserveService;



    @RequestMapping("reservation")
    @ResponseBody
    public Object reservation(Reserve reserve){

        reserve.setPresetTime(new java.sql.Date(new java.util.Date().getTime()));

        HashMap<String, String> res = new HashMap<>();

        if (reserveService.isReservation(reserve.getRoomId())){
            res.put("reservationState","2");
            res.put("msg", "该房间已经被预定或入住！");
        } else {
            if (reserveService.addReserve(reserve)) {
                res.put("reservationState", "1");
                res.put("msg", "预定成功！");
            } else {
                res.put("reservationState", "0");
                res.put("msg", "系统错误，预定失败");
            }
        }
        return res;
    }

    @RequestMapping("reserve_management.html")
    public ModelAndView reserveManagement(){
        List<Reserve> reserveList = reserveService.selectAll();
        ModelAndView mav = new ModelAndView("reserve_management");
        mav.addObject("reserveList", reserveList);
        return mav;
    }

    @RequestMapping("deleteReserve")
    @ResponseBody
    public Object deleteReserve(@RequestParam("roomId") String roomId){
        HashMap<String, String> res = new HashMap<>();
        if (reserveService.deleteReserve(roomId)) {
            res.put("stateCode", "1");
        } else {
            res.put("stateCode", "0");
        }
        return res;
    }
}
