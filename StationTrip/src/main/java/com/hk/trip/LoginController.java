package com.hk.trip;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Locale;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.trip.dto.AdminDto;
import com.hk.trip.dto.LoginDto;
import com.hk.trip.model.ILoginService;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private ILoginService loginService;

	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public void login(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		logger.info("login {}.", locale);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String demail = request.getParameter("email");
		String password = request.getParameter("password");
		String email = URLDecoder.decode(demail, "UTF_8");
		
		System.out.println(demail);

		HttpSession session = request.getSession();
		LoginDto dto = new LoginDto(email, password);
		System.out.println(loginService.login(dto));
		if (loginService.login(dto) != null) {
			session.setAttribute("login_user", loginService.login(dto));
			session.setAttribute("login_userId", loginService.login(dto).getUser_nickname());
			//System.out.println("session = " + session.getAttribute("login_user"));
			out.print(session.getAttribute("login_userId"));
		} else {
			out.print("fail");
		}
	}
	
	@RequestMapping(value = "googlelogin.do", method = RequestMethod.GET)
	public void googlelogin(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		logger.info("googlelogin {}.", locale);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String gname = request.getParameter("google_name");
		HttpSession session = request.getSession();
		if(session.getAttribute("login_userId") == null) {
			session.setAttribute("login_userId", gname);
			System.out.println("session  ="+session.getAttribute("login_userId"));
			if(session.getAttribute("login_userId")!=null) {
				out.print(gname + "님 환영합니다");
			} else {
				out.print("로그인에 실패하였습니다");
			}
		} else {
			out.print("");
		}
	}
	
	@RequestMapping(value = "fblogin.do", method = RequestMethod.GET)
	public void fblogin(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		logger.info("googlelogin {}.", locale);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String fbname = request.getParameter("fb_name");
		HttpSession session = request.getSession();
		if(session.getAttribute("login_userId") == null) {
			session.setAttribute("login_userId", fbname);
			System.out.println("session  ="+session.getAttribute("login_userId"));
			if(session.getAttribute("login_userId")!=null) {
				out.print(fbname + "님 환영합니다");
			} else {
				out.print("로그인에 실패하였습니다");
			}
		} else {
			out.print("");
		}
	}

	@RequestMapping(value = "signout.do", method = RequestMethod.GET)
	public void signout(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		logger.info("googlelogin {}.", locale);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		session.invalidate();
	}

	@RequestMapping(value = "signup.do", method = RequestMethod.GET)
	public void signup(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		logger.info("회원가입 {}.", locale);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");

		LoginDto dto = new LoginDto(nickname, null, email, name, password, phone, 0, 0);
		System.out.println(dto);

		boolean isS = loginService.signup(dto);
		if (isS) {
			out.print("회원가입 성공");
		} else {
			out.print("");
		}

	}

	@RequestMapping(value = "createCookie.do", method = RequestMethod.GET)
	public void createCookie(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		logger.info("creadeCookie {}.", locale);
		String email = request.getParameter("email");
		String decodeResult = URLDecoder.decode(email, "UTF-8");
		System.out.println(email);
		Cookie setCookie = new Cookie("saveId", decodeResult); // 쿠키 이름을 name으로 생성
		setCookie.setMaxAge(365 * 24 * 60 * 60);
		response.addCookie(setCookie);
	}

	@RequestMapping(value = "/mailSender.do")
	public void mailSender(HttpServletRequest request, HttpServletResponse response, ModelMap mo)
			throws AddressException, MessagingException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		// -- 랜덤 인증번호 생성 -- //
		Random rnd = new Random();
		StringBuffer buf = new StringBuffer();
		for (int i = 0; i < 20; i++) {
			if (rnd.nextBoolean()) {
				buf.append((char) ((int) (rnd.nextInt(26)) + 97));
			} else {
				buf.append((rnd.nextInt(10)));
			}
		}
		
		String host = "smtp.gmail.com";
		final String username = "hankyung777"; // 발송할 이메일
		final String password = "gksrud777!"; // 발송할 이메일 비밀번호
		int port = 465; // 포트번호

		// 메일 내용
		String recipient = request.getParameter("email"); // 받는 사람의 메일주소
		String subject = "역장수 인증번호 입니다"; // 메일 제목
		String body = "역장수 인증번호는 " + buf + "입니다"; // 메일 내용
		Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성

		// DB에 해당 Email이 있는지 확인
		LoginDto dto = new LoginDto(recipient, null);
		if (loginService.searchemail(dto) == null) {
			out.print("");
		} else {

			// SMTP 서버 정보 설정
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", port);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.ssl.trust", host);

			// Session 생성
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				String un = username;
				String pw = password;

				protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					return new javax.mail.PasswordAuthentication(un, pw);
				}
			});
			session.setDebug(true); // for debug
			Message mimeMessage = new MimeMessage(session); // MimeMessage 생성
			mimeMessage.setFrom(new InternetAddress("hankyung682@gmail.com")); // 발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다.
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); // 수신자셋팅 .TO 외에 .CC(참조) .BCC(숨은참조) 도 있음
			mimeMessage.setSubject(subject); // 제목셋팅
			mimeMessage.setText(body); // 내용셋팅
			Transport.send(mimeMessage); // javax.mail.Transport.send() 이용 }
			out.print(buf);
		}
	}
	
	@RequestMapping(value = "resetPw.do", method = RequestMethod.GET)
	public void resetPw(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		logger.info("login {}.", locale);
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		LoginDto dto = new LoginDto(email, password);
		if (loginService.login(dto) != null) {
			session.setAttribute("login_user", loginService.login(dto));
			System.out.println("session = " + session.getAttribute("login_user"));
			out.print(session.getAttribute("login_user"));
		}
	}
	
	@RequestMapping(value = "resetpw.do", method = RequestMethod.GET)
	public void resetpw(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		logger.info("비밀번호 재설정 {}.", locale);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		System.out.println("email = " + email);
		String password = request.getParameter("password");
		
		LoginDto dto = new LoginDto(email, password);
		System.out.println("dtoemail = "+dto.getUser_email());
		System.out.println("dtopw = "+dto.getUser_password());
		boolean isS = loginService.resetpw(dto);
		
		if(isS) {
			out.print("변경 성공");
		} else {
			out.print("");
		}
	}
	
	@RequestMapping(value = "admin_loginForm.do", method = RequestMethod.GET)
	public String admin_loginForm(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		logger.info("admin_loginForm {}.", locale);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		return "admin_login";
	}
	
	@RequestMapping(value = "admin_login.do", method = RequestMethod.GET)
	public void admin_login(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		logger.info("admin_login {}.", locale);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String admin_id = request.getParameter("admin_id");
		String admin_password = request.getParameter("admin_password");
		HttpSession session = request.getSession();
		AdminDto dto = new AdminDto(admin_id, admin_password);
		System.out.println(loginService.admin_login(dto));
		if (loginService.admin_login(dto) != null) {
			session.setAttribute("login_admin", loginService.admin_login(dto));
			session.setAttribute("login_adminId", loginService.admin_login(dto).getAdmin_id());
			session.setAttribute("login_userId", "관리자");
			out.print(session.getAttribute("login_admin"));
		} else {
			out.print("fail");
		}
	}
}