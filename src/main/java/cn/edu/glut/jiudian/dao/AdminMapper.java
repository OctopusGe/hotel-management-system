package cn.edu.glut.jiudian.dao;

import cn.edu.glut.jiudian.entity.Admin;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminMapper {
    boolean deleteByPrimaryKey(Integer adminId);

    boolean insert(Admin record);

    Admin selectByPrimaryKey(Integer adminId);

    //List<Admin> selectAll();

    boolean updateByPrimaryKey(Admin record);


    Admin selectAdmin(@Param("adminName") String adminName, @Param("adminPwd") String adminPwd);
}