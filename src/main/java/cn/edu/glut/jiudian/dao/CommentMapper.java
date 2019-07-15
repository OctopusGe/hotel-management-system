package cn.edu.glut.jiudian.dao;

import cn.edu.glut.jiudian.entity.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentMapper {
    boolean deleteByPrimaryKey(Integer serNum);

    boolean insert(Comment record);

    Comment selectByPrimaryKey(Integer serNum);

    List<Comment> selectAll();

    boolean updateByPrimaryKey(Comment record);

    List<Comment> selectByRoomId(String roomId);
}