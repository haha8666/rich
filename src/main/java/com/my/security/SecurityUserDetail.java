package com.my.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class SecurityUserDetail implements UserDetails {

 

    private static final long serialVersionUID = 1L;
    private String username;
    private String password;
    private String nickname;
    private Collection<? extends GrantedAuthority> authority;
    private String userId;
    private String imgUrl;
    

 

    public Collection<? extends GrantedAuthority> getAuthority() {
        return authority;
    }

 

    public SecurityUserDetail(String username, String password, Collection<? extends GrantedAuthority> authority,
            String nickname, String userId, String imgUrl) {
        super();
        this.username = username;
        this.password = password;
        this.authority = authority;
        this.nickname = nickname;
        this.userId = userId;
        this.imgUrl = imgUrl;
        
    }

 

    public void setAuthority(Collection<? extends GrantedAuthority> authority) {
        this.authority = authority;
    }


    public void setUsername(String username) {
        this.username = username;
    }
 
    public void setPassword(String password) {
        this.password = password;
    }

   
 

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        // TODO Auto-generated method stub 계정이 갖고 있는 권한 목록을 리턴한다
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
        return authorities;

 

    }

 

    @Override
    public String getPassword() {
        // TODO Auto-generated method stub
        return password;
    }

 

    @Override
    public String getUsername() {
        // TODO Auto-generated method stub
        return username;
    }
    

    @Override
    public boolean isAccountNonExpired() {
        // TODO Auto-generated method stub 계정이 만료되지 않았는지를 리턴한다(true를 리턴하면 만료되지 않음을 의미)
        return true;
    }

 

    @Override
    public boolean isAccountNonLocked() {
        // TODO Auto-generated method stub 계정이 잠겨있지 않은지를 리턴한다(true를 리턴하면 계정이 잠겨있지 않음을
        // 의미)
        return true;
    }

 

    @Override
    public boolean isCredentialsNonExpired() {
        // TODO Auto-generated method stub 계정의 패스워드가 만료되지 않았는지를 리턴한다(true를 리턴하면 패스워드가
        // 만료되지 않음을 의미)
        return true;
    }

 

    @Override
    public boolean isEnabled() {
        // TODO Auto-generated method stub 계정이 사용가능한 계정인지를 리턴한다(true를 리턴하면 사용가능한 계정인지를
        // 의미)
        return true;
    }

 

    public String getNickname() {
        return nickname;
    }

 

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
    
    
    public String getUserId() {
    	return userId;
    }
    
    public void setuUserId(String userId) {
    	this.userId = userId;
    }
    
    public String getimgUrl() {
    	return imgUrl;
    }
    
    public void setuimgUrl(String imgUrl) {
    	this.imgUrl = imgUrl;
    }
    
    


    @Override
    public String toString() {
        return "SecurityUserDetail [username=" + username + ", password=" + password + ", nickname=" + nickname
                + ", authority=" + authority + ", userId=" + userId + ", imgUrl=" + imgUrl +"]";
    }

 

}