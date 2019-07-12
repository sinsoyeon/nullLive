package com.kh.nullLive.board.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.lang.ProcessBuilder.Redirect;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.tribes.group.Response;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.nullLive.board.model.exception.BoardSelectListException;
import com.kh.nullLive.board.model.exception.ContConsentExcption;
import com.kh.nullLive.board.model.exception.JobBoardInsertException;
import com.kh.nullLive.board.model.exception.SelectOneBoardException;
import com.kh.nullLive.board.model.service.JobBoardService;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.JobBoard;
import com.kh.nullLive.common.AttchmentUtil;
import com.kh.nullLive.common.attachment.model.vo.Attachment;
import com.kh.nullLive.common.paging.model.vo.PagingVo;
import com.kh.nullLive.member.model.service.MemberService;
import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streamer.model.vo.Streamer;

import io.grpc.netty.shaded.io.netty.handler.codec.http.HttpRequest;

@SessionAttributes("loginUser")
@Controller
public class JobBoardController {
	/* 소통센터 : job / 고객센터 : service */
	
	private Logger logger = LoggerFactory.getLogger(JobBoardController.class);
	@Autowired
	private JobBoardService jbs;
	@Autowired
	private MemberService ms;
	@Autowired

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
		int bno = Integer.parseInt(request.getParameter("bno"));
		try {
			Board board = jbs.selectOneJobNotice(bno);
			ArrayList<Attachment> attList = jbs.selectListBoardAtt(bno);
			model.addAttribute("board",board);
			model.addAttribute("attList",attList);
			return "board/job/jobNoticeDetail";
		} catch (SelectOneBoardException e) {
			model.addAttribute("msg",e.getMessage());
			return "common/error";
		}
		
	}
	
	/**
	 * @author : uukk
	 * @throws Exception 
	 * @date : 2019. 6. 19.
	 * @comment : 구인구직 공지사항 글쓰기용 메소드
	 */
	@RequestMapping("insertBoard.jbo")
	public String insertJobNotice(Board board,HttpServletRequest request,Model model) {
		ArrayList<Attachment> attList = null;
		
		try {
			attList = (ArrayList)AttchmentUtil.getAttList(request);
			System.out.println("갯수 : "+attList);
			jbs.insertJobNotice(board, attList);
			return "redirect:jobNoticeList.jbo";
		} catch (Exception e) {
			//에러 발생시 파일 삭제
			for(int i=0; i<attList.size(); i++) {
				File file = new File(attList.get(i).getFilePath()+"\\"+attList.get(i).getChangeName());
		        file.delete();
			}
			model.addAttribute("msg",e.getMessage());
			return "common/errorPage";
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
	public String insertJobBoard(Board board,JobBoard jBoard,Model model,HttpServletRequest request) {
		ArrayList<Attachment> attList = null;
		try {
			attList = (ArrayList)AttchmentUtil.getAttList(request);
			System.out.println(attList);
			int result = jbs.insertJobBoard(board,jBoard,attList);
			return "redirect:jobMain.jbo";
		} catch (Exception e) {
			//에러 발생시 파일 삭제
			for(int i=0; i<attList.size(); i++) {
				File file = new File(attList.get(i).getFilePath()+"\\"+attList.get(i).getChangeName());
		        file.delete();
			}
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
			//첨부파일
			ArrayList<Attachment> attList = jbs.selectListBoardAtt(bno);
			model.addAttribute("attList", attList);
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
	 * @comment : 구인구직 매니저 게시판 승낙하기(계약)
	 */
	@RequestMapping("insertMngContract.jbo")
	public String insertMngContract(HttpServletRequest request,Board board,JobBoard jBoard,Model model) {
		ArrayList<Attachment> attList = null;
		HashMap<String,Object> conBoardMap = new HashMap<>();
		
				
		try {
			attList = (ArrayList)AttchmentUtil.getAttList(request);
			//참조하는 bno
			
			int refBno = Integer.parseInt(request.getParameter("refBno"));
			Member member = (Member)request.getSession().getAttribute("loginUser");
			conBoardMap.put("member", member);
			conBoardMap.put("jBoard", jBoard);
			conBoardMap.put("refBno", refBno);
			conBoardMap.put("board",board);
			conBoardMap.put("attList",attList);
			
			jbs.insertMngContractBoard(conBoardMap);
			
			return "redirect:selectOneJobBoard.jbo?bno="+refBno;
			
		} catch (Exception e) {
			model.addAttribute("msg",e.getMessage());
			return "common/errorPage";
		}
		
		
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
	
	/**
	 * @author : uukk
	 * @throws IOException 
	 * @date : 2019. 7. 8.
	 * @comment : 첨부파일 다운로드
	 */
	@RequestMapping("jobBoardDownloadFile.jbo")
	public String selectBoardDownload(Model model, HttpServletRequest request,HttpServletResponse response,  Attachment att) throws IOException {
		System.out.println(att);
		Attachment attachment = jbs.selectOneJobAtt(att.getAttno());
		
		
		//폴더에서 파일을 읽어드릴 스트림 생성
		BufferedInputStream buf = null;
		
		//클라이언트로 내보낼 출력스트립생성
		ServletOutputStream downOut = null;
		
		downOut = response.getOutputStream();
		
		//스트림으로 전송할 파일 객체 생성 경로 + 이름
		File downFile = new File(attachment.getFilePath() + "\\"+ attachment.getChangeName());
	
		response.setContentType("text/plain; charset=utf-8 ");
	
		//한글 파일명에 대한 인코딩처리
		//강제적으로 다운로드 처리
		response.setHeader("Content-Disposition", "attachment; filename=\""+ new String(attachment.getOriginName().getBytes("UTF-8"), "ISO-8859-1") + "\"");
		response.setContentLength((int)downFile.length());
	
		FileInputStream fin = new FileInputStream(downFile);
		
		buf = new BufferedInputStream(fin);
		
		int readBytes = 0;
		
		while((readBytes = buf.read()) != -1) {
			downOut.write(readBytes);
		}
		
		downOut.close();
		buf.close();
		
		return null;
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 7. 10.
	 * @comment : 매니저 게시판 지원서 승낙
	 */
	@RequestMapping("insertMngContConsent.jbo")
	public String insertMngContConsent(HttpServletRequest request,Model model,JobBoard jBoard,Streamer streamer,Board board) {
		//지원자 mno
		//지원서 상태를 변경해주기 위한 지원서 bno
		System.out.println(request.getParameter("contMno"));
		System.out.println(request.getParameter("contBno"));
		int contMno = Integer.parseInt(request.getParameter("contMno"));
		int contBno = Integer.parseInt(request.getParameter("contBno"));
		//글 작성자 mno
		int mno = Integer.parseInt(request.getParameter("mno"));
		HashMap<String,Object> hmap = new HashMap<>();
		hmap.put("contMno",contMno);
		//지원서 bno
		hmap.put("contBno",contBno);
		hmap.put("jBoard",jBoard);
		hmap.put("streamer",streamer);
		hmap.put("mno",mno);
		//구인구직 게시글 bno
		hmap.put("bno",board.getBno());
		System.out.println(hmap);
		try {
			if(jBoard.getJBtype().equals("구인")) {
				//구인인 경우 
				jbs.insertMngContConsent(hmap);
			}else {
				//구직인경우
				jbs.insertMngContConsent2(hmap);
			}
			return "redirect:jobBoardList.jbo?bType=JOBMNG&url=board/job/jobMngList";
		} catch (ContConsentExcption e) {
			model.addAttribute("msg",e.getMessage());
			return "common/errorPage";
		}
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 7. 11.
	 * @comment : 지원서 상세보기(ajax)
	 */
	@RequestMapping("showContractDeatil.jbo")
	public ResponseEntity<HashMap<String, Object>> showContractDeatil(HttpServletRequest request, Model model, Board board,Member member) {
		//정보를 담아 리턴하기 위한 hashMap
		HashMap<String,Object> contDeatailMap = new HashMap<>();
		//정보 조회를 위한 HashMap
		HashMap<String,Object> hmap = new HashMap<>();
		
		hmap.put("board",board);
		hmap.put("member",member);
		
		ArrayList<Attachment> attList = jbs.selectListBoardAtt(board.getBno());
		
		System.out.println(board);
		System.out.println(member);
		Board contBoard = jbs.selectOneContBoard(hmap);
		Member contMember = jbs.selectOneContMember(member.getMno());
		contDeatailMap.put("attList",attList);
		contDeatailMap.put("board",contBoard);
		contDeatailMap.put("member",contMember);
		
		System.out.println(contDeatailMap);
		return new ResponseEntity<HashMap<String,Object>>(contDeatailMap,HttpStatus.OK);
	}
	
	/**
	 * @author : uukk
	 * @throws BoardSelectListException 
	 * @date : 2019. 7. 11.
	 * @comment : 지원자 상세정보
	 */
	@RequestMapping("selectWritterDeatil.jbo")
	public ResponseEntity<ArrayList<HashMap<String, Object>>> selectWritterDeatil(HttpServletRequest request) throws BoardSelectListException{
		int mno = Integer.parseInt(request.getParameter("mno"));
		System.out.println(mno);
		String jBType = request.getParameter("jBtype");
		
		HashMap<String,Object> returnHmap = null;
		ArrayList<HashMap<String,Object>> mngPartnerList = null;
		//구인인 경우
		if(jBType.equals("구인")) {
			//구인 => 매니저 파트너 이력 조회
			mngPartnerList = jbs.selectJobMngDetail(mno);
			
		}else {
			//구직인 경우
			//구직 => 스트리머  상세 조회
			mngPartnerList = jbs.selectJobStreamerDetail(mno);
			
		}
		
		System.out.println(mngPartnerList);
		return new ResponseEntity<ArrayList<HashMap<String, Object>>>(mngPartnerList,HttpStatus.OK);
	}
	
	/**
	 * @author : uukk
	 * @date : 2019. 7. 12.
	 * @comment : 
	 */
	@RequestMapping("selectStreamerCheck.jbo")
	public  ResponseEntity<HashMap<String,Object>> selectStreamerCheck(HttpServletRequest request){
		int mno = Integer.parseInt(request.getParameter("mno"));
		Streamer streamer = jbs.selectStreamerCheck(mno);
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("Streamer", streamer);
		return new ResponseEntity<HashMap<String,Object>>(hmap,HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}





















