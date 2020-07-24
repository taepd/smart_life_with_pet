package bit.or.eesotto.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bit.or.eesotto.dao.ChatDao;
import bit.or.eesotto.dto.ChatMember;
import bit.or.eesotto.dto.ChatRoom;
import bit.or.eesotto.dao.UserDao;
import bit.or.eesotto.dto.User;


@Service
public class ChatService {
	
	private SqlSession sqlsession;
	
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	
	//채팅방 리스트
	public List<ChatRoom> getChatList() throws ClassNotFoundException, SQLException {
		ChatDao chatdao = sqlsession.getMapper(ChatDao.class);
		return chatdao.getChatList();
	}
	
	
	//채팅방 만들기
	public String createChatRoom(ChatRoom chatroom, HttpSession session, HttpServletRequest requset) throws ClassNotFoundException, SQLException {
		ChatDao chatdao = sqlsession.getMapper(ChatDao.class);
		User user = (User)session.getAttribute("user");
		String userid = user.getUserid();
		String nick = user.getNick();
		System.out.println("값을 보자"+userid);
		System.out.println("값을 보자"+nick);
		
		if(chatroom.getRoom_secret() == null){ 
			chatroom.setRoom_secret("N"); 
		}else { 
			chatroom.setRoom_secret("Y"); 
			}
				
		
		chatroom.setUser_email(userid);
		chatroom.setUser_nickname(nick);
		chatdao.createChatRoom(chatroom);
		return "redirect:selectChatRoomByRn?room_number="+chatroom.getRoom_number();
	}
	
	//채팅방 들어가기
	public String selectChatRoomByRn(int room_number, HttpServletRequest request, Model model) throws ClassNotFoundException, SQLException {
		ChatDao chatdao = sqlsession.getMapper(ChatDao.class);
		ChatRoom chatroom = chatdao.selectChatRoomByRn(room_number);
		int currentCount = chatdao.getMemberCount(room_number);
		int totalCount = chatroom.getRoom_count();

		if (currentCount < totalCount) {
			
			
			 HttpSession session = request.getSession(); 
			 User user = (User)session.getAttribute("user");
			 
				/*
				 * String chatRoomId = Integer.toString(chattingVO.getChId());
				 * session.setAttribute("chatRoomId", chatRoomId);
				 */
			 
			 String userid = user.getUserid();
			 int userCount = chatdao.countUserInRoom(room_number, userid);
			 
			 if(userCount > 0) {
				 chatdao.removeMember(userid, room_number);
			 }
			 
			 
			chatdao.addMember(room_number, userid);
			
			 model.addAttribute("user_email", userid);
			 model.addAttribute("chat", chatroom);
			
			
			/*
			 * model.addAttribute("user_id", chattingVO.getUser_id());
			 * model.addAttribute("chatRoomSelect",
			 * chattingService.chatRoomSelect(chattingVO.getChId()));
			 */
			return "chat/chatRoom";
		}
			return "redirect:chatList";
		}
	
		//채팅방 멤버리스트 닉네임 불러오기
		public List<ChatMember> getMemberList(int room_number) throws ClassNotFoundException, SQLException {
			ChatDao chatdao = sqlsession.getMapper(ChatDao.class);
			return chatdao.getMemberList(room_number);
		}
		
		//채팅방 비밀번호 불러오기
		public int getRoomPwd(int room_number) throws ClassNotFoundException, SQLException {
			ChatDao chatdao = sqlsession.getMapper(ChatDao.class);
			return chatdao.getRoomPwd(room_number);
		}
	
	
	
		//채팅방 나가기	
		public String exitChatRoom(String user_email, int room_number) throws ClassNotFoundException, SQLException {
			ChatDao chatdao = sqlsession.getMapper(ChatDao.class);
			chatdao.removeMember(user_email, room_number);
			return "redirect:/chatList.bit";
		}
		
		//채팅방 삭제하기
		public String deleteChatRoom(int room_number) throws ClassNotFoundException, SQLException {
			ChatDao chatdao = sqlsession.getMapper(ChatDao.class);
			//chatdao.removeMember(user_email, room_number);
			chatdao.deleteChatRoom(room_number);
			return "redirect:/chatList.bit";
		}
		
	

	}
	
	


