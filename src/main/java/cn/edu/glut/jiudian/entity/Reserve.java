package cn.edu.glut.jiudian.entity;


import java.util.Date;

public class Reserve {
    private String roomId;

    private Integer countDate;

    private String userName;

    private String phone;

    private Date presetTime;

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId == null ? null : roomId.trim();
    }

    public Integer getCountDate() {
        return countDate;
    }

    public void setCountDate(Integer countDate) {
        this.countDate = countDate;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Date getPresetTime() {
        return presetTime;
    }

    public void setPresetTime(Date presetTime) {
        this.presetTime = presetTime;
    }
}