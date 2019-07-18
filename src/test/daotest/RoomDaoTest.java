package daotest;

import cn.edu.glut.jiudian.dao.RoomMapper;
import cn.edu.glut.jiudian.entity.Room;
import cn.edu.glut.jiudian.service.ReserveService;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author stone(huangshizhang) at 2019-05-29 14:39
 */
public class RoomDaoTest extends BaseTest {

    @Autowired
    private ReserveService reserveService;

    @Autowired
    private RoomMapper roomMapper;

    @Before
    public void setUp(){
        System.out.println("RoomDaoTest.setUp");
    }

    @After
    public void tearDown(){
        System.out.println("RoomDaoTest.tearDown");
    }

    @Test
    public void testSelectByRoomType(){
        List<Room> roomList = reserveService.selectByRoomType("大床房");
        for (Room room : roomList) {
            System.out.println(room);
        }
    }

    @Test
    public void testUpdate(){
        Room room = new Room();
        room.setRoomId("1301");
        //room.setRoomType("豪华房");
        room.setArea(62);
        if (roomMapper.updateByPrimaryKey(room)) {
            System.out.println("更让你高兴");
        }
    }
}
