package cn.edu.glut.jiudian.dao;

import cn.edu.glut.jiudian.entity.Liuyan;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LiuyanMapper {
    boolean deleteByPrimaryKey(Long serNum);

    boolean insert(Liuyan record);

    Liuyan selectByPrimaryKey(Long serNum);

    List<Liuyan> selectAll();

    boolean updateByPrimaryKey(Liuyan record);
}