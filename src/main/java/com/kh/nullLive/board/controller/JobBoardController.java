package com.kh.nullLive.board.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.nullLive.board.model.service.JobBoardService;

@SessionAttributes("loginUser")
@Controller
public class JobBoardController {
	/* 소통센터 : job / 고객센터 : service */
	
	
	@Autowired
	private JobBoardService jbs;
	

	/*
	 * @RequestMapping("/insertBoard.bo") public void submit(HttpServletRequest
	 * request){ System.out.println("에디터 컨텐츠값:"+request.getParameter("editor")); }
	 */
    /**
     * @author : uukk
     * @date : 2019. 6. 21.
     * @comment : 다중파일업로드
     */
    @RequestMapping(value = "/insertBoard.bo",
                  method = RequestMethod.POST)
    @ResponseBody
    public String multiplePhotoUpload(HttpServletRequest request) {
        // 파일정보
        StringBuffer sb = new StringBuffer();
        try {
            // 파일명을 받는다 - 일반 원본파일명
            String oldName = request.getHeader("file-name");
            //절대경로
            String root = request.getSession().getServletContext().getRealPath("resources");
            
            // 파일 기본경로 _ 상세경로
            String filePath = root + "\\uploadFiles\\board\\img\\";
            
            
            String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
                          .format(System.currentTimeMillis()))
                          .append(UUID.randomUUID().toString())
                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
            
            InputStream is = request.getInputStream();
            OutputStream os = new FileOutputStream(filePath + saveName);
            int numRead;
            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
            while ((numRead = is.read(b, 0, b.length)) != -1) {
                os.write(b, 0, numRead);
            }
            os.flush();
            os.close();
            // 정보 출력
            sb = new StringBuffer();
            sb.append("&bNewLine=true")
              .append("&sFileName=").append(oldName)
              .append("&sFileURL=").append("http://localhost:9001/nullLive/resources/uploadFiles/board/img/")
        .append(saveName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
	/**
	 * @author : uukk
	 * @date : 2019. 6. 18.
	 * @comment : 구인구직 공지사항 리스트 조회용 메소드
	 */
	public String selectListJobNotice() {
		
		jbs.selectListJobNotice();
		
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 공지사항 상세조회용 메소드
	 */
	@RequestMapping("selectOneJobNotice.bo")
	public String selectOneJobNotice() {
		
		//jbs.selectOneJobNotice();
		return "board/job/jobNoticeDetail";
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 공지사항 글쓰기용 메소드
	 */
	@RequestMapping("insertJobNotice.bo")
	public String insertJobNotice() {
		System.out.println("도착");
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 공지사항 업데이트용 메소드
	 */
	public String updateJobNotice() {
		jbs.updateJobNotice();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 공지사항 삭제용 메소드
	 */
	public String deleteJobNotice() {
		jbs.deleteJobNotice();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 리스트 조회용 메소드
	 */
	public String selectListJobBoard() {
		jbs.selectListJobBoard();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 내가쓴글 조회용 메소드
	 */
	public String selectListJobMyBoard() {
		jbs.selectListJobMyBoard();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 글쓰기
	 */
	public String insertJobBoard() {
		jbs.insertJobBoard();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 검색
	 */
	public String searchJobBoard() {
		jbs.searchJobBoard();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 상세조회용 
	 */
	public String selectOneJobBoard() {
		jbs.selectOneJobBoard();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 지원현황 조회용
	 */
	public String SelectListApply() {
		
		jbs.SelectListApply();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 수정용
	 */
	public String updateJobBoard() {
		jbs.updateJobBoard();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 지원하기 메소드
	 */
	public String insertApply() {
		jbs.insertApply();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 승낙하기(계약)
	 */
	public String insertContract() {
		jbs.insertContract();
		return null;
	}
	
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 신고하기
	 */
	public String insertJobBoardReport() {
		jbs.insertJobBoardReport();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 쪽지보내기
	 */
	public String insertJobBoardNote() {
		jbs.insertJobBoardNote();
		return null;
	}
	
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 20.
	 * @comment : 구인구직 메인으로 이동
	 */
	@RequestMapping("jobMain.bo")
	public String showJobBoardMain() {
		return "board/job/jobMain";
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 20.
	 * @comment : 구인구직 매니저 게시판 리스트
	 */
	@RequestMapping("jobMngList.bo")
	public String showJobBoardMngList() {
		return "board/job/jobMngList";
	}
	/**
	 * @author : uukk
	 * @date : 2019. 6. 20.
	 * @comment : 구인구직 공지사항 리스트
	 */
	@RequestMapping("jobNoticeList.bo")
	public String showJobNoticeList() {
		return "board/job/jobNoticeList";
	}
	/**
	 * @author : uukk
	 * @date : 2019. 6. 20.
	 * @comment : 구인구직 콘텐츠제작자 리스트
	 */
	@RequestMapping("jobContentList.bo")
	public String showJobBoardContentList() {
		return "board/job/jobContentList";
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 20.
	 * @comment : 구인구직 공지사항 입력폼 보이기
	 */
	@RequestMapping("jobNoticeInsertForm.bo")
	public String showJobNoitceInsertForm() {
		return "board/job/jobNoticeInsertForm";
	}
	/**
	 * @author : uukk
	 * @date : 2019. 6. 20.
	 * @comment : 구인구직 매니저 입력폼 보이기
	 */
	@RequestMapping("jobMngInsertForm.bo")
	public String showJobMngInsertForm() {
		return "board/job/jobMngInsertForm";
	}
	/**
	 * @author : uukk
	 * @date : 2019. 6. 20.
	 * @comment : 구인구직 콘텐츠제작자 입력폼 보이기
	 */
	@RequestMapping("jobContentInsertForm.bo")
	public String showJobContentInsertForm() {
		return "board/job/jobContentInsertForm";
	}
}
