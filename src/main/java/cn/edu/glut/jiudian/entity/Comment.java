package cn.edu.glut.jiudian.entity;

import java.util.Date;

public class Comment {
    private Integer serNum;

    private String userName;

    private String roomId;

    private String content;

    private Date releaseTime;

    public Integer getSerNum() {
        return serNum;
    }

    public void setSerNum(Integer serNum) {
        this.serNum = serNum;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId == null ? null : roomId.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(Date releaseTime) {
        this.releaseTime = releaseTime;
    }
}