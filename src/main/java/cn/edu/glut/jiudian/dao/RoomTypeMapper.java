package cn.edu.glut.jiudian.dao;

import cn.edu.glut.jiudian.entity.RoomType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoomTypeMapper {
    boolean deleteByPrimaryKey(Integer typeId);

    boolean insert(RoomType record);

    RoomType selectByPrimaryKey(Integer typeId);

    List<RoomType> selectAll();

    boolean updateByPrimaryKey(RoomType record);
}