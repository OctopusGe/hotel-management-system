package cn.edu.glut.jiudian.service;

import cn.edu.glut.jiudian.entity.Room;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author stone(huangshizhang) at 2019-06-08 10:42
 */
public interface RoomService {

    List<Room> selectAll();

    List<Room> selectByRoomType(String roomType);

    List<Room> selectByPrice(BigDecimal startPrice, BigDecimal endPrice);

    Room selectByRoomId(String roomId);

    boolean exists(String roomId);

    boolean addRoom(Room room);

    boolean updateRoom(Room room);

    boolean deleteRoom(String roomId);

    List<Room> selectNotInRuZhu();
}
