package cn.edu.glut.jiudian.service.impl;

import cn.edu.glut.jiudian.dao.CommentMapper;
import cn.edu.glut.jiudian.entity.Comment;
import cn.edu.glut.jiudian.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author stone(huangshizhang) at 2019-06-11 15:57
 */
@Service("commentService")
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public List<Comment> getRoomComment(String roomId) {
        return commentMapper.selectByRoomId(roomId);
    }

    @Override
    public boolean addComment(Comment comment) {
        return commentMapper.insert(comment);
    }

    @Override
    public boolean updateByPrimaryKey(Comment comment) {
        return commentMapper.updateByPrimaryKey(comment);
    }
}
