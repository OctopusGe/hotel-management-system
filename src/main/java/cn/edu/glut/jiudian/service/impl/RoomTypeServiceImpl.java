package cn.edu.glut.jiudian.service.impl;

import cn.edu.glut.jiudian.dao.RoomTypeMapper;
import cn.edu.glut.jiudian.entity.RoomType;
import cn.edu.glut.jiudian.service.RoomTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author stone(huangshizhang) at 2019-06-07 20:04
 */
@Service("roomTypeService")
public class RoomTypeServiceImpl implements RoomTypeService {

    @Autowired
    private RoomTypeMapper roomTypeMapper;

    @Override
    public List<RoomType> selectAll() {
        return roomTypeMapper.selectAll();
    }

    @Override
    public boolean addRoomType(RoomType roomType) {
        return roomTypeMapper.insert(roomType);
    }

    @Override
    public boolean deleteRoomType(Integer typeId) {
        return roomTypeMapper.deleteByPrimaryKey(typeId);
    }
}
