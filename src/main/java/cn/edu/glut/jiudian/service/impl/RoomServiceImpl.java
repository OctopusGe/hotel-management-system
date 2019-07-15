package cn.edu.glut.jiudian.service.impl;

import cn.edu.glut.jiudian.dao.RoomMapper;
import cn.edu.glut.jiudian.entity.Room;
import cn.edu.glut.jiudian.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author stone(huangshizhang) at 2019-06-08 10:45
 */
@Service("roomService")
public class RoomServiceImpl implements RoomService {

    @Autowired
    private RoomMapper roomMapper;


    @Override
    public List<Room> selectAll() {
        return roomMapper.selectAll();
    }

    @Override
    public List<Room> selectByRoomType(String roomType) {
        return roomMapper.selectByRoomType(roomType);
    }

    @Override
    public List<Room> selectByPrice(BigDecimal startPrice, BigDecimal endPrice) {
        return roomMapper.selectByPrice(startPrice, endPrice);
    }

    @Override
    public Room selectByRoomId(String roomId) {
        return roomMapper.selectByPrimaryKey(roomId);
    }

    @Override
    public boolean exists(String roomId) {
        return roomMapper.exists(roomId) > 0;
    }

    @Override
    public boolean addRoom(Room room) {
        return roomMapper.insert(room);
    }

    @Override
    public boolean updateRoom(Room room) {
        return roomMapper.updateByPrimaryKey(room);
    }

    @Override
    public boolean deleteRoom(String roomId) {
        return roomMapper.deleteByPrimaryKey(roomId);
    }

    @Override
    public List<Room> selectNotInRuZhu() {
        return roomMapper.selectNotInRuZhu();
    }
}
