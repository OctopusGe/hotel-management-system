package cn.edu.glut.jiudian.dao;

import cn.edu.glut.jiudian.entity.Order;
import java.util.List;

public interface OrderMapper {
    boolean deleteByPrimaryKey(String roomId);

    boolean insert(Order record);

    Order selectByPrimaryKey(String roomId);

    List<Order> selectAll();

    boolean updateByPrimaryKey(Order record);
}