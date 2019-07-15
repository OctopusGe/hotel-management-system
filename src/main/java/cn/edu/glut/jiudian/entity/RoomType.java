package cn.edu.glut.jiudian.entity;

public class RoomType {
    private Integer typeId;

    private String type;

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    @Override
    public String toString() {
        return "RoomType{" +
                "typeId=" + typeId +
                ", type='" + type + '\'' +
                '}';
    }
}