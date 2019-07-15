package cn.edu.glut.jiudian.service.impl;

import cn.edu.glut.jiudian.dao.OrderMapper;
import cn.edu.glut.jiudian.entity.Order;
import cn.edu.glut.jiudian.entity.Room;
import cn.edu.glut.jiudian.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author stone(huangshizhang) at 2019-06-13 19:53
 */
@Service("orderService")
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<Order> selectAll() {
        return orderMapper.selectAll();
    }

    @Override
    public boolean updateByRoomId(Order order) {
        return orderMapper.updateByPrimaryKey(order);
    }

    @Override
    public boolean deleteByRoomId(String roomId) {
        return orderMapper.deleteByPrimaryKey(roomId);
    }

    @Override
    public boolean addOrder(Order order) {
        return orderMapper.insert(order);
    }

    @Override
    public Order selectByRoomId(String roomId) {
        return orderMapper.selectByPrimaryKey(roomId);
    }

}
