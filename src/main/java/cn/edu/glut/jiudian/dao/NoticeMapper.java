package cn.edu.glut.jiudian.dao;

import cn.edu.glut.jiudian.entity.Notice;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NoticeMapper {
    boolean deleteByPrimaryKey(Integer serNum);

    boolean insert(Notice record);

    Notice selectByPrimaryKey(Integer serNum);

    List<Notice> selectAll();

    boolean updateByPrimaryKey(Notice record);
}