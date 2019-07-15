package cn.edu.glut.jiudian.entity;

import java.util.Date;

public class Notice {
    private Integer serNum;

    private Integer adminId;

    private String notice;

    private Date releaseTime;

    public Integer getSerNum() {
        return serNum;
    }

    public void setSerNum(Integer serNum) {
        this.serNum = serNum;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice == null ? null : notice.trim();
    }

    public Date getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(Date releaseTime) {
        this.releaseTime = releaseTime;
    }
}