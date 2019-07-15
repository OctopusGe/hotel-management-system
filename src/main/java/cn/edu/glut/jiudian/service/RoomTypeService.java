package cn.edu.glut.jiudian.service;

import cn.edu.glut.jiudian.entity.RoomType;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author stone(huangshizhang) at 2019-06-07 20:03
 */
public interface RoomTypeService {

    List<RoomType> selectAll();

    boolean addRoomType(RoomType roomType);

    boolean deleteRoomType(Integer typeId);
}
