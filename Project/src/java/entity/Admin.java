/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ADMIN
 */
public class Admin {
//    [Username] [varchar](20) NOT NULL,
//	[Password] [varchar](20) NULL,
//	[role] [int] NULL,
    private String Username,Password;
    private int role;

    public Admin() {
    }

    public Admin(String Username, String Password, int role) {
        this.Username = Username;
        this.Password = Password;
        this.role = role;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
    
}
