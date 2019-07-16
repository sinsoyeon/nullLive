package com.kh.nullLive.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.nullLive.board.model.dao.JobBoardDao;
import com.kh.nullLive.board.model.exception.BoardSelectListException;
import com.kh.nullLive.board.model.exception.ContConsentExcption;
import com.kh.nullLive.board.model.exception.JobBoardInsertException;
import com.kh.nullLive.board.model.exception.SelectOneBoardException;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.JobBoard;
import com.kh.nullLive.board.model.vo.PageInfo;
import com.kh.nullLive.broadCenter.model.dao.BroadCenterDao;
import com.kh.nullLive.common.AttchmentUtil;
import com.kh.nullLive.common.attachment.model.exception.AttachmentInsertException;
import com.kh.nullLive.common.attachment.model.vo.Attachment;
import com.kh.nullLive.common.paging.model.vo.PagingVo;
import com.kh.nullLive.member.model.dao.MemberDao;
import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streamer.model.dao.StreamerDao;
import com.kh.nullLive.streamer.model.vo.Streamer;
import com.kh.nullLive.subscription.model.dao.SubscriptionDao;

@Service
public class JobBoardServiceImpl implements JobBoardService{

	@Autowired
	private JobBoardDao jbd;
	@Autowired
	private MemberDao md;
	@Autowired
	private StreamerDao sd;
	@Autowired
	private SubscriptionDao sud;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	@Autowired
	private BroadCenterDao bcd;
	
	/**
	 * @author : uukk
	 * @date : 2019. 6. 24.
	 * @comment : 구인구직 공지사항 목록조회
	 */
	@Override
	public ArrayList<Board> selectListJobNotice(PageInfo pi) {
		return jbd.selectListJobNotice(sqlSession,pi);
	}

	/**
	 * @author : uukk
	 * @throws SelectOneBoardException 
	 * @date : 2019. 6. 24.
	 * @comment : 구인구직 공지사항 상세조회
	 */
	@Override
	public Board selectOneJobNotice(int bno) throws SelectOneBoardException {
		Board board = null;
		int result = jbd.updateBoardCount(sqlSession,bno);
		System.out.println(result);
		board = jbd.selectOneJobNotice(sqlSession, bno); 
		
		if(board == null) {
			throw new SelectOneBoardException("게시글 상세보기 실패");
		}
		
		return board;
	}

	/**
	 * @author : uukk
	 * @throws AttachmentInsertException 
	 * @throws JobBoardInsertException 
	 * @date : 2019. 7. 6.
	 * @comment : 구인구직 공지사항 작성
	 */
	@Override
	public void insertJobNotice(Board board,ArrayList<Attachment> attList) throws AttachmentInsertException, JobBoardInsertException {
		int result = 0;
		HashMap<String,Object> attHmap = new HashMap<>();
		int boardResult = jbd.insertJobNotice(sqlSession, board);
		if(boardResult<=0) {
			throw new JobBoardInsertException("구인구직 공지사항 작성 실패");
		}
		
		attHmap.put("board", board);
		//첨부파일이 있는 경우
		if(attList.size() != 0) {
			
			attHmap.put("attList", attList);
			
			//Attachment 입력
			int attResult = jbd.insertJobNoticeAttList(sqlSession,attHmap);
			//작성 bno currval조회
			int bno = jbd.selectCurrval(sqlSession); 
			
			HashMap<String,Object> attmHmap = new HashMap<>();
			
			//작성 attachment currval조회
			ArrayList<Integer> attnoList = jbd.getAttnoList(sqlSession,attList.size());
			
			//attManager 작성을 위한 parameter값
			attmHmap.put("bno", bno);
			attmHmap.put("attnoList", attnoList);
			
			//attManager 입력
			int attmResult = jbd.insertJobNoticeAttMng(sqlSession,attmHmap);
			
			//리턴값이 size와 동일하지 않을시 예외처리
			if(attmResult != attList.size() ||
			   attResult != attList.size()) {
				throw new AttachmentInsertException("첨부파일 입력 에러");
			}
		}
	}

	@Override
	public void updateJobNotice() {
		jbd.updateJobNotice();
	}

	@Override
	public void deleteJobNotice() {
		jbd.deleteJobNotice();
	}

	/**
	 * @author : uukk
	 * @date : 2019. 6. 27.
	 * @comment : 매니저 리스트 페이징
	 */
	@Override
	public void selectListJobMngBoard() {
		jbd.selectListJobMngBoard();
	}

	/**
	 * @author : uukk
	 * @throws JobBoardInsertException 
	 * @throws AttachmentInsertException 
	 * @date : 2019. 6. 26.
	 * @comment : 구인구직게시판 작성
	 */
	@Override
	public int insertJobBoard(Board board, JobBoard jBoard,ArrayList<Attachment> attList) throws JobBoardInsertException, AttachmentInsertException {
		HashMap<String,Object> attHmap = new HashMap<>();
		int result = 0;
		int boardResult = jbd.insertJobBoard(sqlSession,board);
		attHmap.put("board", board);
		int boardCurrval = jbd.selectCurrval(sqlSession);
		
		jBoard.setBno(boardCurrval);
		int jBoardResult = jbd.insertJobJBoard(sqlSession,jBoard);
		
		if(boardResult<=0 || jBoardResult<=0) {
			throw new JobBoardInsertException("구인구직 작성 실패");
		}
		
		
		if(attList.size() != 0) {
			
			attHmap.put("attList", attList);
			
			//Attachment 입력
			int attResult = jbd.insertJobNoticeAttList(sqlSession,attHmap);
			
			HashMap<String,Object> attmHmap = new HashMap<>();
			
			//작성 attachment currval조회
			ArrayList<Integer> attnoList = jbd.getAttnoList(sqlSession,attList.size());
			
			//attManager 작성을 위한 parameter값
			attmHmap.put("bno", boardCurrval);
			attmHmap.put("attnoList", attnoList);
			
			//attManager 입력
			int attmResult = jbd.insertJobNoticeAttMng(sqlSession,attmHmap);
			
			//리턴값이 size와 동일하지 않을시 예외처리
			if(attmResult != attList.size() ||
			   attResult != attList.size()) {
				throw new AttachmentInsertException("첨부파일 입력 에러");
			}
		}
		
		
		
		return result;
	}

	@Override
	public void searchJobBoard() {
		jbd.searchJobBoard();
	}

	/**
	 * @author : uukk
	 * @throws BoardSelectListException 
	 * @date : 2019. 7. 1.
	 * @comment : 구인구직 게시판 상세조회
	 */
	@Override
	public HashMap<String, Object> selectOneJobBoard(int bno) throws BoardSelectListException {
		HashMap<String,Object> boardMap = new HashMap<>();
		//조회수 증가
		int result = jbd.updateBoardCount(sqlSession,bno);
		//board 조회
		Board board = jbd.selectOneMngBoard(sqlSession,bno);
		
		//board 상태 조회
		System.out.println(jbd.selectOneBoardStatus(sqlSession,board.getBStatus()));
		String boardStatus = (String)(jbd.selectOneBoardStatus(sqlSession,board.getBStatus()));
		
		
		//jobBoard 조회
		JobBoard jBoard = jbd.selectOnejobMngBoard(sqlSession,bno);
		
		System.out.println(jBoard);
		//글작성자 조회
		int mno = Integer.parseInt((String)(board.getBWriter()+""));
		Member member = md.selectMemberMno(sqlSession, mno);
		System.out.println(member);
		
		Attachment profile = bcd.getProfile(sqlSession, mno);
		
		//해당 글의 지원서 / 유저정보 가져오기
		ArrayList<HashMap<String,Object>> contBoardList = jbd.selectListContBoard(sqlSession,bno);
		System.out.println(contBoardList);
		
		//해당 작성자의 파트너 리스트 가져오기
		//ArrayList<HashMap<String,Object>> partnerList = jbd.selectListPartner(sqlSession,mno);
		
		if(jBoard.getJBtype().equals("구인")) {
			//구인구직게시판 타입이 구인인경우 스트리머정보를 가져옴
			Streamer streamer = sd.selectStreamerMno(sqlSession,mno);
			if(streamer == null) {
				throw new BoardSelectListException("스트리머 정보 불러오기 실패");
			}
			boardMap.put("streamer", streamer);
			//구독자수 조회
			int suCount = sud.getSubscriptionCount(sqlSession,streamer.getSno());
			boardMap.put("suCount",suCount);
		}
		
		boardMap.put("boardStatus", boardStatus);
		boardMap.put("board", board);
		boardMap.put("jBoard", jBoard);
		boardMap.put("member", member);
		boardMap.put("contBoardList", contBoardList);
		boardMap.put("profile", profile);
		return boardMap;
	}

	@Override
	public void SelectListApply() {
		jbd.SelectListApply();
	}

	@Override
	public void updateJobBoard() {
		jbd.updateJobBoard();
	}

	@Override
	public void insertApply() {
		jbd.insertApply();
	}


	@Override
	public void insertJobBoardReport() {
		jbd.insertJobBoardReport();
	}

	@Override
	public void insertJobBoardNote() {
		jbd.insertJobBoardNote();
	}

	/**
	 * @author : uukk
	 * @date : 2019. 6. 24.
	 * @comment : 게시글 리스트 갯수 조회
	 */
	@Override
	public int getListCount() {
		return  jbd.getListCount(sqlSession);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 6. 26.
	 * @comment : 매니저 리스트 페이징 조회
	 */
	@Override
	public ArrayList<HashMap<String,Object>> selectJobListJobPaging(HashMap<String,Object> hmap) {
		return jbd.selectJobListJobPaging(sqlSession,hmap);
	}

	@Override
	public int selectJobMngTotalPaging() {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 1.
	 * @comment : 매니저 리스트 전체조회
	 */
	@Override
	public int getJobBoardListCount(String bType) {
		return jbd.getJobBoardListCount(sqlSession,bType);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 3.
	 * @comment : 구인구직 공지사항 페이징 조회
	 */
	@Override
	public ArrayList<HashMap<String,Object>> selectJobNoticePaging(PagingVo paging) {
		return jbd.selectJobNoticePaging(sqlSession,paging);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 3.
	 * @comment : 구인구직 공지사항 전체 갯수
	 */
	@Override
	public int getJobNoticeListCount() {
		return jbd.getJobNoticeListCount(sqlSession);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 5.
	 * @comment : 내가 쓴 글 조회
	 */
	@Override
	public ArrayList<HashMap<String, Object>> selectListJobMyBoardPaging(HashMap<String,Object> hmap) {
		return jbd.selectListJobMyBoardPaging(sqlSession,hmap);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 5.
	 * @comment : 구인구직 매니저 전체 갯수
	 */
	@Override
	public int getJobMyJobBoardCount(HashMap<String, Object> hmap) {
		return jbd.getJobMyJobBoardCount(sqlSession,hmap);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 8.
	 * @comment : 게시판 첨부파일 조회
	 */
	@Override
	public ArrayList<Attachment> selectListBoardAtt(int bno) {
		return jbd.selectListBoardAtt(sqlSession,bno);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 8.
	 * @comment : 첨부파일 조회
	 */
	@Override
	public Attachment selectOneJobAtt(int attno) {
		return jbd.selectOneJobAtt(sqlSession, attno);
	}

	/**
	 * @author : uukk
	 * @throws AttachmentInsertException 
	 * @date : 2019. 7. 10.
	 * @comment : 구인구직 매니저 지원서 입력 
	 */
	@Override
	public void insertMngContractBoard(HashMap<String, Object> conBoardMap) throws AttachmentInsertException {
		
		//지원서 board 입력
		int resultBoard = jbd.insertMngContractBoard(sqlSession,conBoardMap);
		ArrayList<Attachment> attList = (ArrayList) conBoardMap.get("attList");
		
		int boardCurrval = jbd.selectCurrval(sqlSession);
		
		//attachment 입력을 위한 hashMap
		HashMap<String,Object> attHmap = new HashMap<>();
		if(attList.size() != 0) {
			
			attHmap.put("attList", attList);
			
			//Attachment 입력
			int attResult = jbd.insertJobNoticeAttList(sqlSession,attHmap);
			
			HashMap<String,Object> attmHmap = new HashMap<>();
			
			//작성 attachment currval조회
			ArrayList<Integer> attnoList = jbd.getAttnoList(sqlSession,attList.size());
			
			//attManager 작성을 위한 parameter값
			attmHmap.put("bno", boardCurrval);
			attmHmap.put("attnoList", attnoList);
			
			//attManager 입력
			int attmResult = jbd.insertJobNoticeAttMng(sqlSession,attmHmap);
			
			//리턴값이 size와 동일하지 않을시 예외처리
			if(attmResult != attList.size() ||
			   attResult != attList.size()) {
				throw new AttachmentInsertException("첨부파일 입력 에러");
			}
		}
		
		
	}

	/**
	 * @author : uukk
	 * @throws ContConsentExcption 
	 * @date : 2019. 7. 10.
	 * @comment : 매니저게시판 지원서 승낙하기(구인)
	 */
	@Override
	public void insertMngContConsent(HashMap<String, Object> hmap) throws ContConsentExcption {
		//계약테이블 입력
		int contResult = jbd.insertMngContract(sqlSession,hmap);
		
		if(contResult <=0) {
			throw new ContConsentExcption("에러  code:jb0001");
		}
		
		//지원서 상태 변경
		int contUpdateResult = jbd.updateMngContBoard(sqlSession,hmap);
		
		if(contUpdateResult <=0) {
			throw new ContConsentExcption("에러  code:jb0002");
		}
		
		//계약currval조회
		int contCurrval = jbd.selectContCurrval(sqlSession);
		if(contCurrval <=0) {
			throw new ContConsentExcption("에러  code:jb0003");
		}
		
		//파트너 테이블 입력을 위한 계약테이블 pk
		hmap.put("contCurrval", contCurrval);
		
		//파트너 테이블 입력
		int partnerResult = jbd.insertMngPartner(sqlSession,hmap);
		if(partnerResult <=0) {
			throw new ContConsentExcption("에러  code:jb0004");
		}
		//파트너 테이블 CURRVAL
		int partnerCurrval = jbd.selectPartnerCurrval(sqlSession);
		hmap.put("partnerCurrval", partnerCurrval);
		//구인구직 게시글 board 상태 변경
		int boardResult = jbd.updateJobMngBoardComplt(sqlSession,hmap);
		if(boardResult <= 0) {
			throw new ContConsentExcption("에러  code:jb0005");
		}
		JobBoard jBoard = (JobBoard) hmap.get("jBoard");
		//파트너가 매니저인경우 권한 입력
		if(jBoard.getJob().equals("매니저")) {
			
			int authResult = jbd.insertManagerAuth(sqlSession,hmap);
		}
		
	}

	/**
	 * @author : uukk
	 * @throws ContConsentExcption 
	 * @date : 2019. 7. 12.
	 * @comment : 매니저게시판 지원서 승낙하기(구직)
	 */
	@Override
	public void insertMngContConsent2(HashMap<String, Object> hmap) throws ContConsentExcption {
		//계약테이블 입력
		int contResult = jbd.insertMngContract(sqlSession,hmap);
		
		if(contResult <=0) {
			throw new ContConsentExcption("에러  code:jb0001");
		}
		
		//지원서 상태 변경
		int contUpdateResult = jbd.updateMngContBoard(sqlSession,hmap);
		
		if(contUpdateResult <=0) {
			throw new ContConsentExcption("에러  code:jb0002");
		}
		
		//계약currval조회
		int contCurrval = jbd.selectContCurrval(sqlSession);
		if(contCurrval <=0) {
			throw new ContConsentExcption("에러  code:jb0003");
		}
		
		//파트너 테이블 입력을 위한 계약테이블 pk
		hmap.put("contCurrval", contCurrval);
		
		//지원자 mno
		int mno = (int) hmap.get("contMno");
		//지원자 스트리머 정보 조회
		Streamer streamer = sd.selectStreamerMno(sqlSession, mno);
		
		hmap.put("streamer", streamer);
		
		
		//파트너 테이블 입력
		int partnerResult = jbd.insertMngPartner(sqlSession,hmap);
		if(partnerResult <=0) {
			throw new ContConsentExcption("에러  code:jb0004");
		}
		int partnerCurrval = jbd.selectPartnerCurrval(sqlSession);
		
		//구인구직 게시글 board 상태 변경
		int boardResult = jbd.updateJobMngBoardComplt(sqlSession,hmap);
		if(boardResult <= 0) {
			throw new ContConsentExcption("에러  code:jb0005");
		}
		JobBoard jBoard = (JobBoard) hmap.get("jBoard");
		
		//파트너가 매니저인경우 권한 입력
		if(jBoard.getJob().equals("매니저")) {
			//파트너 테이블 CURRVAL
			hmap.put("partnerCurrval", partnerCurrval);
			int authResult = jbd.insertManagerAuth(sqlSession,hmap);
		}
		
		
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 11.
	 * @comment : 구인구직 지원서 상세보기용 메소드
	 */
	@Override
	public Board selectOneContBoard(HashMap<String, Object> hmap) {
		return jbd.selectOneContBoard(sqlSession,hmap);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 11.
	 * @comment : mno로 member 조회
	 */
	@Override
	public Member selectOneContMember(int mno) {
		return md.selectMemberMno(sqlSession, mno);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 11.
	 * @comment : 매니저 구인 상세정보 조회
	 */
	@Override
	public ArrayList<HashMap<String, Object>> selectJobMngDetail(int mno) {
		ArrayList<HashMap<String, Object>> mngPartnerList = jbd.selectMngDetail(sqlSession,mno);
		return mngPartnerList;
	}

	/**
	 * @author : uukk
	 * @throws BoardSelectListException 
	 * @date : 2019. 7. 12.
	 * @comment : 매니저게시판 구직 스트리머 상세정보 조회
	 */
	@Override
	public ArrayList<HashMap<String, Object>> selectJobStreamerDetail(int mno) throws BoardSelectListException {
		ArrayList<HashMap<String,Object>> list = new ArrayList<>();
		HashMap<String,Object> hmap = new HashMap<>();
		Streamer streamer = sd.selectStreamerMno(sqlSession,mno);
		Member member = md.selectMemberMno(sqlSession, mno);
		if(streamer == null) {
			throw new BoardSelectListException("스트리머 정보 불러오기 실패");
		}
		hmap.put("streamer", streamer);
		//구독자수 조회
		int suCount = sud.getSubscriptionCount(sqlSession,streamer.getSno());
		hmap.put("suCount",suCount);
		hmap.put("member",member);
		list.add(hmap);
		
		return list;
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 12.
	 * @comment : 
	 */
	@Override
	public Streamer selectStreamerCheck(int mno) {
		return sd.selectStreamerMno(sqlSession, mno);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 13.
	 * @comment : 편집자 파트너 리스트 조회
	 */
	@Override
	public ArrayList<HashMap<String, Object>> selectListEditorPartner(HashMap<String, Object> hmap) {
		return jbd.selectListPartner(sqlSession,hmap);
	}

	/**
	 * @author : uukk
	 * @date : 2019. 7. 16.
	 * @comment : 구인구직 콘텐츠제작자 게시판 수정폼 조회
	 */
	@Override
	public HashMap<String,Object> showUpdateJobConBoard(int bno) {
		HashMap<String,Object> boardMap = new HashMap<>();
		Board board = jbd.selectOneMngBoard(sqlSession, bno);
		JobBoard jBoard = jbd.selectOneJobBoard(sqlSession, bno);
		
		boardMap.put("board", board);
		boardMap.put("jBoard",jBoard);
		
		
		return boardMap;
			
	}

	/**
	 * @author : uukk
	 * @throws JobBoardInsertException 
	 * @date : 2019. 7. 16.
	 * @comment : 구인구직 콘텐츠 제작자 게시판 업데이트
	 */
	@Override
	public void updateJobConBoard(HashMap<String, Object> hmap) throws JobBoardInsertException {
		int bdResult = jbd.updateConBoard(sqlSession,hmap);
		int jbdResult = jbd.updateJobConBoard(sqlSession,hmap);
		if(bdResult<=0 || jbdResult<=0) {
			throw new JobBoardInsertException("구인구직 수정 오류");
		}
	}




}































