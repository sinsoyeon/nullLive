package com.kh.nullLive.board.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.nullLive.board.model.exception.BoardSelectListException;
import com.kh.nullLive.board.model.exception.JobBoardInsertException;
import com.kh.nullLive.board.model.exception.SelectOneBoardException;
import com.kh.nullLive.board.model.service.JobBoardService;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.JobBoard;
import com.kh.nullLive.common.paging.model.vo.PagingVo;
import com.kh.nullLive.member.model.service.MemberService;
import com.kh.nullLive.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class JobBoardController {
	/* 소통센터 : job / 고객센터 : service */
	
	private Logger logger = LoggerFactory.getLogger(JobBoardController.class);
	@Autowired
	private JobBoardService jbs;
	@Autowired
	private MemberService ms;

    /**
     * @author : uukk
     * @date : 2019. 6. 21.
     * @comment : 다중파일업로드
     */
    @RequestMapping(value = "/uploadImg.jbo",
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
        System.out.println(sb.toString());
        return sb.toString();
    }
	

	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 공지사항 상세조회용 메소드
	 */
	@RequestMapping("selectOneJobNotice.jbo")
	public String selectOneJobNotice(HttpServletRequest request, Model model) {
		System.out.println(request.getParameter("bno"));
		int bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println(bno);
		try {
			Board board = jbs.selectOneJobNotice(bno);
			model.addAttribute("board",board);
			return "board/job/jobNoticeDetail";
		} catch (SelectOneBoardException e) {
			model.addAttribute("msg",e.getMessage());
			return "common/error";
		}
		
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 공지사항 글쓰기용 메소드
	 */
	@RequestMapping("insertBoard.jbo")
	public String insertJobNotice(Board board, Model model) {
		
		
		int result = jbs.insertJobNotice(board);
		
		if(result> 0 ) {
			return "redirect:jobMain.jbo";
		}else {
			model.addAttribute("msg","공지사항 작성 실패");
			return "common/board/jobNoticeList";
		}
		
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 공지사항 업데이트용 메소드
	 */
	public String updateJobNotice(Board board,Model model) {
		jbs.updateJobNotice();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 공지사항 삭제용 메소드
	 */
	public String deleteJobNotice(Board board,Model model) {
		jbs.deleteJobNotice();
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 매니저 리스트 조회용 메소드
	 */
	@RequestMapping("jobBoardList.jbo")
	public String selectListJobBoard(Board board,PagingVo paging,Model model,HttpServletRequest request) {
		HashMap<String,Object> hmap = new HashMap<>();
		hmap.put("board", board);
		hmap.put("paging", paging);
		ArrayList<HashMap<String,Object>> list = jbs.selectJobListJobPaging(hmap);
		paging.setTotal(jbs.getJobBoardListCount(board.getBType()));
		model.addAttribute("list", list);
        model.addAttribute("pi", paging);
		return request.getParameter("url");
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 내가쓴글 조회용 메소드
	 */
	@RequestMapping("jobMyboard.jbo")
	public String selectListJobMyBoard(Board board,PagingVo paging,Model model,HttpServletRequest request) {
		HashMap<String,Object> hmap = new HashMap<>();
		
		//요청 session에 loginUser정보를 넣어서 받음
		Member member = (Member)request.getSession().getAttribute("loginUser");
		request.getSession().getAttribute("loginUser");
		
		hmap.put("member", member);
		hmap.put("board", board);
		hmap.put("paging", paging);
		
		ArrayList<HashMap<String,Object>> list = jbs.selectListJobMyBoardPaging(hmap);
		paging.setTotal(jbs.getJobMyJobBoardCount(hmap));
		model.addAttribute("list", list);
        model.addAttribute("pi", paging);
        model.addAttribute("isMyBoardList",true);
		return request.getParameter("url");
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 게시판 글쓰기
	 */
	@RequestMapping("insertJobBoard.jbo")
	public String insertJobBoard(Board board,JobBoard jBoard,Model model) {
		
		try {
			int result = jbs.insertJobBoard(board,jBoard);
			return "redirect:jobMain.jbo";
		} catch (JobBoardInsertException e) {
			model.addAttribute("msg",e.getMessage());
			return "common/errorPage";
		}
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
	@RequestMapping("selectOneJobBoard.jbo")
	public String selectOneJobBoard(HttpServletRequest request,Model model) {
		int bno = Integer.parseInt(request.getParameter("bno"));
			
		HashMap<String, Object> boardMap;
		try {
			boardMap = jbs.selectOneJobBoard(bno);
			model.addAttribute("boardMap",boardMap);
			System.out.println(boardMap.get("jBoard"));
			Board board = (Board)boardMap.get("board");
			//bType에 따른 리턴 view 설정
			if(board.getBType().equals("JOBCON")) {
				return "board/job/jobContentDetail";
			}else {
				return "board/job/jobMngDetail";
			}
				
		} catch (BoardSelectListException e) {
			// TODO Auto-generated catch block
			model.addAttribute("msg",e.getMessage());
			return "common/errorPage";
		}
		/*
		 * String str = hmap.get("mno")+""; int mno = Integer.parseInt(str); Attachment
		 * att = null; try { att = ms.getProfile(mno); System.out.println(att);
		 * hmap.put("imgSource", att.getChangeName()); }catch (ProfileException e) {
		 * //프로필 사진이 없는 경우 }
		 */
		
		
			
			
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
	@RequestMapping("jobMain.jbo")
	public String showJobBoardMain() {
		return "board/job/jobMain";
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 20.
	 * @comment : 구인구직 콘텐츠제작자 리스트
	 */
	@RequestMapping("jobContentList.jbo")
	public String showJobBoardContentList() {
		return "board/job/jobContentList";
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 20.
	 * @comment : 구인구직 공지사항 입력폼 보이기
	 */
	@RequestMapping("jobNoticeInsertForm.jbo")
	public String showJobNoitceInsertForm() {
		return "board/job/jobNoticeInsertForm";
	}
	/**
	 * @author : uukk
	 * @date : 2019. 6. 20.
	 * @comment : 구인구직 매니저 입력폼 보이기
	 */
	@RequestMapping("jobMngInsertForm.jbo")
	public String showJobMngInsertForm() {
		return "board/job/jobMngInsertForm";
	}
	/**
	 * @author : uukk
	 * @date : 2019. 6. 20.
	 * @comment : 구인구직 콘텐츠제작자 입력폼 보이기
	 */
	@RequestMapping("jobContentInsertForm.jbo")
	public String showJobContentInsertForm() {
		return "board/job/jobContentInsertForm";
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 25.
	 * @comment : 구인구직 공지사항 리스트 페이징 조회
	 */
	@RequestMapping("jobNoticeList.jbo")
	public String selectListJobNotice(Model model, PagingVo paging) {
		ArrayList<HashMap<String,Object>> lists = jbs.selectJobNoticePaging(paging);
		paging.setTotal(jbs.getJobNoticeListCount());
		model.addAttribute("list", lists);
        model.addAttribute("pi", paging);
		return "board/job/jobNoticeList";
	}
	
}
