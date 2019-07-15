package cn.edu.glut.jiudian.dao;

import cn.edu.glut.jiudian.entity.Reserve;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReserveMapper {
    boolean deleteByPrimaryKey(String roomId);

    boolean insert(Reserve record);

    Reserve selectByPrimaryKey(String roomId);

    List<Reserve> selectAll();

    boolean updateByPrimaryKey(Reserve record);

    int isReservation(String roomId);
}