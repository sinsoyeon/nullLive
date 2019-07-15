package com.kh.nullLive.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.kh.nullLive.board.model.vo.PageInfo;
import com.kh.nullLive.common.CommonUtils;
import com.kh.nullLive.common.Pagination;
import com.kh.nullLive.common.RandomConstructor;
import com.kh.nullLive.common.attachment.model.vo.Attachment;
import com.kh.nullLive.member.model.exception.CheckException;
import com.kh.nullLive.member.model.exception.InsertMemberException;
import com.kh.nullLive.member.model.exception.LoginException;
import com.kh.nullLive.member.model.exception.ProfileException;
import com.kh.nullLive.member.model.exception.UpdateMemberException;
import com.kh.nullLive.member.model.service.MemberService;
import com.kh.nullLive.member.model.vo.BankAccount;
import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.member.model.vo.Subscription;
import com.kh.nullLive.streamer.model.exception.SelectStreamerException;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@SessionAttributes("loginUser")
@Controller
public class MemberController {

	@Autowired
	private MemberService ms;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	/**
	 * Author : ryan Date : 2019. 7. 7. Comment : 에러 상황 발생 시
	 */
	@RequestMapping("errorMeet.me")
	public String errorMeet() {
		return "redirect:index.jsp";
	}

	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 19.
	 * @Comment : 로그인 화면 호출
	 */
	@RequestMapping("loginPage.me")
	public String loginPage(HttpSession session, HttpServletRequest request) {
		String referer = "";
		if (request.getParameter("referer") != null) {
			referer = request.getParameter("referer");
		} else {
			referer = request.getHeader("referer");
			referer = referer.substring(referer.lastIndexOf('/') + 1);
		}
		if (referer.equals("") || referer.equals("join.me") || referer.equals("insert.me")) {
			referer = "index.jsp";
		} else if (referer.equals("login.me")) {
			referer = "loginPage.me";
		}
		session.setAttribute("redirectUrl", referer);
		return "member/memberLoginForm";
	}

	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 18. + 7.2
	 * @Comment : 로그인 + 리다이렉트 처리
	 */
	@RequestMapping("login.me")
	public String loginCheck(Member m, Model model, HttpServletRequest request, HttpSession session) {
		Member loginUser;
		try {
			loginUser = ms.loginMember(m);
			loginUser.setMpwd(null);
			model.addAttribute("loginUser", loginUser);

			return "redirect:" + session.getAttribute("redirectUrl");
		} catch (LoginException e) {
			model.addAttribute("msg", e.getMessage());
			model.addAttribute("referer", session.getAttribute("redirectUrl"));
			return "main/mainError";
		}
	}

	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 18.
	 * @Comment : 로그아웃
	 */
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:index.jsp";
	}

	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 18.
	 * @Comment : 회원가입 이동
	 */
	@RequestMapping("join.me")
	public String joinMember() {
		return "member/memberJoinForm";
	}

	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 18.
	 * @Comment : 회원가입
	 */
	@RequestMapping("insert.me")
	public String insertMember(Model model, Member m, @RequestParam("phone1") String p1,
			@RequestParam("phone2") String p2, @RequestParam("phone3") String p3, HttpServletResponse response) {
		m.setPhone(p1 + p2 + p3);
		m.setMpwd(passwordEncoder.encode(m.getMpwd()));
		try {
			ms.insertMember(m);
			m.setMno(ms.getMno());
			ms.insertProImage(m);
			ms.createBroadCenter(m);
			model.addAttribute("joinMember", m);
			return "member/insertEndEmailConfirm";
		} catch (InsertMemberException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 19.
	 * @Comment : 마이페이지 이동
	 */
	@RequestMapping("myPage.me")
	public String myPage(Model model, HttpServletRequest request) {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		try {
			if (loginUser != null) {
				Attachment att = ms.getProfile(loginUser.getMno());
				model.addAttribute("imgSource", att.getChangeName());

				ArrayList<Subscription> list = ms.getSubList(loginUser);
				ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();
				String pattern = "yy/MM/dd";
				DateFormat df = new SimpleDateFormat(pattern);
				for (Subscription sub : list) {
					HashMap<String, Object> hmap = new HashMap<String, Object>();
					hmap.put("mid", sub.getMid());
					hmap.put("sid", sub.getSid());
					hmap.put("nickName", sub.getNickName());
					hmap.put("startDate", df.format(new java.util.Date(sub.getSu_start_date().getTime())));
					hmap.put("periodDate", df.format(new java.util.Date(sub.getSu_period_date().getTime())));
					hmap.put("broadAddress",sub.getBroadAddress());
					hmap.put("byn", sub.getByn());
					resultList.add(hmap);
				}
				model.addAttribute("subList", resultList);

				return "member/myPage/myPageMain";
			} else {
				return "member/needLogin";
			}
		} catch (ProfileException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	/**
	 * @Author : ryan
	 * @Date : 2019. 6. 19.
	 * @Comment : 잘못된 접근시 로그인으로 이동
	 */
	@RequestMapping("needLogin.me")
	public String needLogin(Model model, HttpServletRequest request) {
		String referer = request.getHeader("referer");
		referer = referer.substring(referer.lastIndexOf('/') + 1);
		model.addAttribute("referer", referer);
		return "member/needLogin";
	}

	/**
	 * @Author : ryan 
	 * @Date : 2019. 6. 21. / 7. 2. 
	 * @Comment : 개인정보수정 페이지 이동 / 계좌 정보 있는 경우 추가
	 */
	@RequestMapping("updatePage.me")
	public String updatePage(HttpSession session, Model model) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		int result = ms.existBankAccount(loginUser.getMno());
		if (result > 0) {
			try {
				BankAccount bankAccount = ms.getBankAccount(loginUser.getMno());
				model.addAttribute("existBankAccount", "Y");
				model.addAttribute("bankAccount", bankAccount);
				return "member/myPage/myPageModify";
			} catch (SelectStreamerException e) {
				model.addAttribute("msg", e.getMessage());
				return "common/errorPage";
			}
		}
		return "member/myPage/myPageModify";
	}

	/**
	 * Author : ryan Date : 2019. 6. 21. / 7. 2. Comment : 개인정보수정 / 계좌 있는 경우 추가
	 */
	@RequestMapping("update.me")
	public String updateMember(Model model, SessionStatus status, Member m, BankAccount bankAccount) {
		try {
			Member loginUser = ms.updateMember(m, bankAccount);
			model.addAttribute("loginUser", loginUser);
			return "member/myPage/myPageModifySuccess";
		} catch (UpdateMemberException e) {
			model.addAttribute("msg", e.getMessage());
			return "member/myPage/myPageError";
		}
	}

	/**
	 * Author : ryan Date : 2019. 6. 21. Comment : 비밀번호 변경 입력창 이동
	 */
	@RequestMapping("pwdInput.me")
	public String pwdInput() {
		return "member/myPage/pwdInput";
	}
	
	/**
	 * Author : ryan
	 * Date : 2019. 7. 13.
	 * Comment : 휴대폰 변경 창 이동
	 */
	@RequestMapping("phoneInput.me")
	public String phoneInput() {
		return "member/myPage/phoneInput";
	}

	/**
	 * Author : ryan Date : 2019. 6. 21. Comment : 비밀번호 확인
	 */
	@RequestMapping("pwdCheck.me")
	public String pwdCheck(Member m, Model model) {
		try {
			ms.checkPwd(m);
			return "member/myPage/pwdChange";
		} catch (CheckException e) {
			model.addAttribute("msg", e.getMessage());
			return "member/myPage/pwdError";
		}
	}

	/**
	 * Author : ryan Date : 2019. 6. 21. Comment : 비밀번호 변경
	 */
	@RequestMapping("pwdChange.me")
	public String pwdChange(Member m, Model model) {
		m.setMpwd(passwordEncoder.encode(m.getMpwd()));
		try {
			Member loginUser = ms.changePwd(m);
			model.addAttribute("loginUser", loginUser);
			return "member/myPage/pwdChEnd";
		} catch (UpdateMemberException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	/**
	 * Author : ryan Date : 2019. 6. 21. Comment : 프로필이미지 수정 창
	 */
	@RequestMapping("modifyProImagePage.me")
	public String modifyProImagePage() {
		return "member/myPage/profileImageUpdate";
	}

	/**
	 * Author : ryan Date : 2019. 6. 21. Comment : 프로필이미지 변경
	 */
	@RequestMapping("modifyProImage.me")
	public String modifyProImage(Model model, Member m, HttpServletRequest request,
			@RequestParam(name = "proImgFile", required = false) MultipartFile file) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		System.out.println("root : " + root);
		String filePath = root + "\\uploadFiles\\profile_image";
		System.out.println("filePath : " + filePath);

		String originName = file.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = CommonUtils.getRandomString();
		Attachment att = new Attachment();
		att.setOriginName(originName);
		att.setChangeName(changeName + ext);
		att.setFilePath(filePath);
		try {
			file.transferTo(new File(root + "\\uploadFiles\\profile_image\\" + changeName + ext));
			ms.updateProImage(m, att);
		} catch (IllegalStateException | IOException | UpdateMemberException e) {
			new File(filePath + "\\" + changeName + ext).delete();
			model.addAttribute("msg", e.getMessage());
		}

		return "member/myPage/modifyProImageEnd";
	}

	/**
	 * Author : ryan Date : 2019. 6. 24. Comment : 아이디 중복체크 ajax
	 */
	@RequestMapping(value = "duplicateTest.me")
	@ResponseBody
	public String duplicateTest(@RequestParam(name = "currentVal") String currentVal) {
		String mid = currentVal;
		if (mid.length() > 5) {
			int result = ms.duplicateTest(mid);
			if (result > 0) {
				return "duplicate";
			}
			return "success";
		}
		return "lengthError";
	}

	/**
	 * Author : INHYO Date : 2019. 7. 8 Comment : 방송파트너 페이지
	 */
	@RequestMapping("partner.me")
	public String partner(Model model, HttpServletRequest request) {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		ArrayList<HashMap<String, Object>> partner = ms.partner(loginUser);
		
		System.out.println(partner);
		
		model.addAttribute("partner",partner);
		
		return "member/myPage/myPagePartner";
	}

	/**
	 * Author : ryan Date : 2019. 7. 11. Comment : 이메일 인증 완료
	 */
	@RequestMapping("joinConfirm.me")
	public String joinConfirm(Model model, HttpServletRequest request) {
		String mid = request.getParameter("mid");
		try {
			ms.joinConfirm(mid);
			return "member/joinConfirm";
		} catch (InsertMemberException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	/**
	 * Author : ryan Date : 2019. 7. 11. Comment : 회원 탈퇴
	 */
	@RequestMapping("secession.me")
	public String secession(Model model, Member m) {
		try {
			ms.secession(m);
			return "redirect:logout.me";
		} catch (UpdateMemberException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	/**
	 * Author : ryan Date : 2019. 7. 11. Comment : 이메일 발송
	 */
	@RequestMapping("emailConfirm.me")
	public String emailConfirm(Model model, @RequestParam("mid") String mid, @RequestParam("email") String email) {
		Member m = new Member();
		m.setMid(mid);
		m.setEmail(email);
		try {
			ms.emailConfirm(m);
		} catch (UnsupportedEncodingException | MessagingException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		return "success";
	}

	/**
	 * @Author : ryan
	 * @Date : 2019. 7. 11.
	 * @Comment : 아이디 비밀번호 찾기 페이지 이동
	 */
	@RequestMapping("checkIdPwd.me")
	public String checkIdPwd() {
		return "member/checkIdPwd";
	}

	/**
	 * @Author : ryan
	 * @Date : 2019. 7. 11.
	 * @Comment : 아이디 찾기 part1(sms 보내기)
	 */
	@RequestMapping("searchId.me")
	public ModelAndView searchId(HttpServletRequest request, @RequestParam(name = "smsCode") String smsCode,
			@RequestParam(name = "phone") String phone) throws Exception {
		String api_key = "NCSSRYW4RE9CHRST";
		String api_secret = "AN9CEBFOMESJNPQQYRO14IZTDMV8PXCE";
		Message coolsms = new Message(api_key, api_secret);

		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("to", phone); // 수신 번호
		hmap.put("from", "01072446532"); // 발신번호
		hmap.put("text", "[NullLive] 서비스 발송입니다. 인증번호 [" + smsCode + "]를 입력해주세요"); // 문자내용
		hmap.put("type", "sms"); // 문자 타입
		hmap.put("app_version", "test app 1.2");
		System.out.println("hmap : " + hmap);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("jsonView");
		mv.addObject("result", true);

		// 메세지 전송 부분(유료)
		/*
		 * try { JSONObject obj = (JSONObject) coolsms.send(hmap); //보내기 & 전송 결과
		 * System.out.println("obj : "+obj.toString()); } catch (CoolsmsException e) {
		 * System.out.println(e.getMessage()); System.out.println(e.getCode()); }
		 */

		return mv;
	}

	/**
	 * Author : ryan
	 * Date : 2019. 7. 12.
	 * Comment : 휴대폰 인증 ajax
	 */
	@ResponseBody
	@RequestMapping(value="conPhone.me")
	public String confirmPhone(@RequestParam(name = "smsCode") String smsCode,
			@RequestParam(name = "phone") String phone) throws Exception {
		String api_key = "NCSSRYW4RE9CHRST";
		String api_secret = "AN9CEBFOMESJNPQQYRO14IZTDMV8PXCE";
		Message coolsms = new Message(api_key, api_secret);

		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("to", phone); // 수신 번호
		hmap.put("from", "01072446532"); // 발신번호
		hmap.put("text", "[NullLive] 서비스 발송입니다. 인증번호 [" + smsCode + "]를 입력해주세요"); // 문자내용
		hmap.put("type", "sms"); // 문자 타입
		hmap.put("app_version", "test app 1.2");
		System.out.println("hmap : " + hmap);

		// 메세지 전송 부분(유료)
		/*
		 * try { JSONObject obj = (JSONObject) coolsms.send(hmap); //보내기 & 전송 결과
		 * System.out.println("obj : "+obj.toString()); } catch (CoolsmsException e) {
		 * System.out.println(e.getMessage()); System.out.println(e.getCode()); }
		 */

		return "success";
	}
	
	/**
	 * Author : ryan
	 * Date : 2019. 7. 12.
	 * Comment : 아이디 찾기 part2 (찾은 아이디 가져오기)
	 */
	@RequestMapping("getSearchId.me")
	public ModelAndView getSearchId(@RequestParam(name = "name") String name,
			@RequestParam(name = "phone") String phone) {
		String id = "";

		ModelAndView mv = new ModelAndView();
		Member m = new Member();
		m.setName(name);
		m.setPhone(phone);
		try {
			id = ms.getSearchId(m);
			mv.setViewName("jsonView");
			mv.addObject("getId", id);
			return mv;
		} catch (CheckException e) {
			mv.addObject("error", e.getMessage());
			mv.setViewName("jsonView");
			return mv;
		}
	}

	/**
	 * Author : ryan
	 * Date : 2019. 7. 13.
	 * Comment : 패스워드 재발급 (랜덤)
	 */
	@RequestMapping("pwdReload.me")
	public ModelAndView pwdReload(@RequestParam(name = "mid") String mid, @RequestParam(name = "email") String email) {
		ModelAndView mv = new ModelAndView();
		Member m = new Member();
		m.setMid(mid);
		m.setEmail(email);
		RandomConstructor rc = new RandomConstructor();
		String newPwd = rc.getRandomPassword(10);
		System.out.println("newPwd : " + newPwd);
		m.setMpwd(passwordEncoder.encode(newPwd));

		try {
			ms.pwdReload(m, newPwd);

			mv.setViewName("jsonView");
			mv.addObject("result", "successs");
			return mv;
		} catch (UpdateMemberException | UnsupportedEncodingException | MessagingException e) {
			mv.setViewName("jsonView");
			mv.addObject("error", e.getMessage());
			return mv;
		}
	}

	/**
	 * Author : ryan
	 * Date : 2019. 7. 13.
	 * Comment : 휴대폰 변경
	 */
	@RequestMapping("phoneChange.me")
	public String phoneChange(Member m,@RequestParam("phone1") String p1,
			@RequestParam("phone2") String p2, @RequestParam("phone3") String p3,Model model) {
		m.setPhone(p1 + p2 + p3);

		try {
			Member loginUser = ms.phoneChange(m);
			model.addAttribute("loginUser", loginUser);
			return "member/myPage/phoneChangeEnd";
		} catch (UpdateMemberException e) {
			model.addAttribute("msg",e.getMessage());
			return "member/myPage/phoneChangeError";
		}
	}
	
	/**
	 * Author : ryan
	 * Date : 2019. 7. 13.
	 * Comment : 성인인증 창 이동
	 */
	@RequestMapping("conAdult.me")
	public String conAdult() {
		return "member/myPage/conAdult";
	}
	
	/**
	 * Author : ryan
	 * Date : 2019. 7. 13.
	 * Comment : 성인인증
	 */
	@ResponseBody
	@RequestMapping("confrimAdult.me")
	public String confirmAdult(Model model, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		try {
			Member loginUser = ms.confirmAdult(m);
			model.addAttribute("loginUser", loginUser);
			return "success";
		} catch (UpdateMemberException e) {
			return e.getMessage();
		}
	}
}
