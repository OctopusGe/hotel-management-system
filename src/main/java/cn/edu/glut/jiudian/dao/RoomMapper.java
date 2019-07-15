package cn.edu.glut.jiudian.dao;

import cn.edu.glut.jiudian.entity.Room;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface RoomMapper {
    boolean deleteByPrimaryKey(String roomId);

    boolean insert(Room record);

    Room selectByPrimaryKey(String roomId);

    List<Room> selectAll();

    boolean updateByPrimaryKey(Room record);

    List<Room> selectByRoomType(String roomType);

    List<Room> selectByPrice(@Param("startPrice") BigDecimal startPrice, @Param("endPrice") BigDecimal endPrice);

    int exists(String roomId);

    List<Room> selectNotInRuZhu();
}