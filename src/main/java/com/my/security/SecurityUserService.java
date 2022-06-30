package com.my.security;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.my.main.dao.MainDao;
import com.my.security.SecurityUserDetail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class SecurityUserService implements UserDetailsService {
	
	@Resource
	private MainDao mainDao;

    @Override
    public SecurityUserDetail loadUserByUsername(String username) throws UsernameNotFoundException {
        
    	Map<String, Object> newmap = new HashMap<String, Object>();
    	
    	newmap.put("loginId",username);
    	
    	Map<String, Object> newuser = mainDao.selectUser(newmap);
    	if(newuser == null ) throw new UsernameNotFoundException(username);

    	
    	
    	List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        authorities.add(new SimpleGrantedAuthority(newuser.get("authority").toString()));
//        SecurityUserDetail user = new SecurityUserDetail(username, "1", authorities, "nickname");
        System.out.println("zzzzzz");
        return new SecurityUserDetail(newuser.get("username").toString(), newuser.get("password").toString(), authorities, newuser.get("nickname").toString(), newuser.get("userid").toString(), newuser.get("imgurl").toString());
    }

 

}
