package cn.edu.glut.jiudian.service;

import cn.edu.glut.jiudian.entity.Reserve;
import cn.edu.glut.jiudian.entity.Room;

import java.util.List;

/**
 * @author stone(huangshizhang) at 2019-06-07 19:28
 */
public interface ReserveService {

    List<Room> selectByRoomType(String roomType);

    boolean addReserve(Reserve reserve);

    List<Reserve> selectAll();

    boolean deleteReserve(String roomId);

    boolean isReservation(String roomId);
}
