/**
 * 
 */
/**
 * @author Heomh
 *
 */
package com.my.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;

import com.my.security.SecurityUserDetail;

@Controller
public class ChatMessageController {

 

    private final SimpMessagingTemplate template;

 

    @Autowired
    public ChatMessageController(SimpMessagingTemplate template) {
        this.template = template;
    }

 

    @MessageMapping("/chat/join")
    public void join(ChatMessage message, Authentication authentication) {
    	SecurityUserDetail user = (SecurityUserDetail) authentication.getPrincipal();

    	message.setMessage(user.getNickname() + "님이 입장하셨습니다.");
    	
        template.convertAndSend("/subscribe/chat/room/" + message.getChatRoomId(), message);
    }

 

    @MessageMapping("/chat/message")
    public void message(ChatMessage message, Authentication authentication) {
    	SecurityUserDetail user = (SecurityUserDetail) authentication.getPrincipal();
    	
    	
    	
    	message.setWriter(user.getNickname());
    	System.out.println(message);
        template.convertAndSend("/subscribe/chat/room/" + message.getChatRoomId(), message);
    }
}