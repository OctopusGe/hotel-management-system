package cn.edu.glut.jiudian.service.impl;

import cn.edu.glut.jiudian.dao.ReserveMapper;
import cn.edu.glut.jiudian.dao.RoomMapper;
import cn.edu.glut.jiudian.entity.Reserve;
import cn.edu.glut.jiudian.entity.Room;
import cn.edu.glut.jiudian.service.ReserveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author stone(huangshizhang) at 2019-06-07 19:30
 */

@Service("reserveService")
public class ReserveServiceImpl implements ReserveService {

    @Autowired
    private RoomMapper roomMapper;

    @Autowired
    private ReserveMapper reserveMapper;

    @Override
    public List<Room> selectByRoomType(String roomType) {
        return roomMapper.selectByRoomType(roomType);
    }

    @Override
    public boolean addReserve(Reserve reserve) {
        return reserveMapper.insert(reserve);
    }

    @Override
    public List<Reserve> selectAll() {
        return reserveMapper.selectAll();
    }

    @Override
    public boolean deleteReserve(String roomId) {
        return reserveMapper.deleteByPrimaryKey(roomId);
    }

    @Override
    public boolean isReservation(String roomId) {
        System.out.println("是否被预定：" + reserveMapper.isReservation(roomId));
        return reserveMapper.isReservation(roomId) > 0;
    }


}
