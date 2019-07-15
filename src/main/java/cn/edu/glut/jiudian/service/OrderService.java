package cn.edu.glut.jiudian.service;

import cn.edu.glut.jiudian.entity.Order;

import java.util.List;

/**
 * @author stone(huangshizhang) at 2019-06-13 19:52
 */
public interface OrderService {

    List<Order> selectAll();

    boolean updateByRoomId(Order order);

    boolean deleteByRoomId(String roomId);

    boolean addOrder(Order order);

    Order selectByRoomId(String roomId);

}
