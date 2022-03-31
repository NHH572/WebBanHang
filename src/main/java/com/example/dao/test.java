package com.example.dao;

import com.example.models.UsersEntity;

public class test {
    public static void main(String[] args) {
        try {
            UserDAO udao = new UserDAO();
            String email ="haichanhkun57@gmail.com";
            String password = "haidz57";
            UsersEntity user =udao.Login(email,password);
            if(user != null){
                System.out.println("Tên: "+user.getFullname());
            }
            else {
                System.out.println("lỗi");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
