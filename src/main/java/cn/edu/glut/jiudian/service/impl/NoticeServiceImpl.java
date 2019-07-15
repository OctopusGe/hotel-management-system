package cn.edu.glut.jiudian.service.impl;

import cn.edu.glut.jiudian.dao.NoticeMapper;
import cn.edu.glut.jiudian.entity.Notice;
import cn.edu.glut.jiudian.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author stone(huangshizhang) at 2019-06-09 23:00
 */

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public List<Notice> selectAll() {
        return noticeMapper.selectAll();
    }
}
