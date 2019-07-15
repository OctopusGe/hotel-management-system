package cn.edu.glut.jiudian.service;

import cn.edu.glut.jiudian.entity.Comment;

import java.util.List;

/**
 * @author stone(huangshizhang) at 2019-06-11 15:56
 */
public interface CommentService {

    List<Comment> getRoomComment(String roomId);

    boolean addComment(Comment comment);

    boolean updateByPrimaryKey(Comment comment);
}
