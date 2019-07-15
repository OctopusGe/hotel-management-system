package cn.edu.glut.jiudian.controller;

import cn.edu.glut.jiudian.entity.Comment;
import cn.edu.glut.jiudian.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

/**
 * @author stone(huangshizhang) at 2019-06-11 15:59
 */
@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    private  List<Comment> commentList = null;


    private  List<Comment> geRoomComment = null;

    @RequestMapping("roomCommentList")
    @ResponseBody
    public Object roomCommentList(@RequestParam("roomId") String roomId){
        commentList = commentService.getRoomComment(roomId);

        //HashMap<String, List<Comment>> res = new HashMap<>();
        //res.put("commentList", commentList);
        return "1";
    }

    @RequestMapping("geRoomComment")
    @ResponseBody
    public Object geRoomComment(@RequestParam("roomId") String roomId){
        geRoomComment = commentService.getRoomComment(roomId);

        //HashMap<String, List<Comment>> res = new HashMap<>();
        //res.put("commentList", commentList);
        return "1";
    }

    @RequestMapping("comment_management.html")
    public ModelAndView commentManagement(){
        ModelAndView mav = new ModelAndView("comment_management");
        mav.addObject("commentList", geRoomComment);
        return mav;
    }

    @RequestMapping("room_comment.html")
    public ModelAndView modalRoomComment(){
        ModelAndView mav = new ModelAndView("room_comment");
        mav.addObject("commentList", commentList);
        return mav;
    }

    @RequestMapping("addRoomComment")
    @ResponseBody
    public Object addRoomComment(Comment comment){

        comment.setReleaseTime(new java.sql.Date(new java.util.Date().getTime()));

        HashMap<String, String> res = new HashMap<>();
        if (commentService.addComment(comment)) {
            res.put("stateCode", "1");
        } else {
            res.put("stateCode", "0");
        }
        return res;
    }

    @RequestMapping("write_comment.html")
    public ModelAndView writeComment(){
        return new ModelAndView("write_comment");
    }

    @RequestMapping("deleteComment")
    @ResponseBody
    public Object deleteComment(@RequestParam("serNum") Integer serNum, @RequestParam("roomId") String roomId){

        Comment comment = new Comment();

        comment.setSerNum(serNum);
        comment.setContent("");

        HashMap<String, List<Comment>> res = new HashMap<>();
        if (commentService.updateByPrimaryKey(comment)) {
            List<Comment> commentList1 = commentService.getRoomComment(roomId);
            res.put("commentList", commentList1);
            return res;
        } else {
            return false;
        }
    }
}
