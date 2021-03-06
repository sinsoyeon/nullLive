package com.kh.nullLive.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.nullLive.board.model.exception.BoardSelectListException;
import com.kh.nullLive.board.model.exception.ContConsentExcption;
import com.kh.nullLive.board.model.exception.JobBoardInsertException;
import com.kh.nullLive.board.model.exception.SelectOneBoardException;
import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.board.model.vo.JobBoard;
import com.kh.nullLive.board.model.vo.PageInfo;
import com.kh.nullLive.common.attachment.model.exception.AttachmentInsertException;
import com.kh.nullLive.common.attachment.model.vo.Attachment;
import com.kh.nullLive.common.paging.model.vo.PagingVo;
import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streamer.model.vo.Streamer;

public interface JobBoardService {

	ArrayList<Board> selectListJobNotice(PageInfo pi);

	Board selectOneJobNotice(int bno) throws SelectOneBoardException;

	void insertJobNotice(Board board, ArrayList<Attachment> attList) throws AttachmentInsertException, JobBoardInsertException;

	void updateJobNotice();

	void deleteJobNotice();

	void selectListJobMngBoard();

	ArrayList<HashMap<String, Object>> selectListJobMyBoardPaging(HashMap<String,Object> hmap);

	int insertJobBoard(Board board, JobBoard jBoard, ArrayList<Attachment> attList) throws JobBoardInsertException, AttachmentInsertException;

	void searchJobBoard();

	HashMap<String, Object> selectOneJobBoard(int bno) throws BoardSelectListException;

	void SelectListApply();

	void updateJobBoard();

	void insertApply();


	void insertJobBoardReport();

	void insertJobBoardNote();

	int getListCount();

	ArrayList<HashMap<String,Object>> selectJobListJobPaging(HashMap<String,Object> hmap);

	int selectJobMngTotalPaging();

	int getJobBoardListCount(String bType);

	ArrayList<HashMap<String,Object>> selectJobNoticePaging(PagingVo paging);

	int getJobNoticeListCount();

	int getJobMyJobBoardCount(HashMap<String, Object> hmap);

	ArrayList<Attachment> selectListBoardAtt(int bno);

	Attachment selectOneJobAtt(int attno);

	void insertMngContractBoard(HashMap<String, Object> conBoardMap) throws AttachmentInsertException;

	void insertMngContConsent(HashMap<String, Object> hmap) throws ContConsentExcption;

	Board selectOneContBoard(HashMap<String, Object> hmap);

	Member selectOneContMember(int mno);

	 ArrayList<HashMap<String, Object>> selectJobMngDetail(int mno);

	ArrayList<HashMap<String, Object>> selectJobStreamerDetail(int mno) throws BoardSelectListException;

	void insertMngContConsent2(HashMap<String, Object> hmap) throws ContConsentExcption;

	Streamer selectStreamerCheck(int mno);

	ArrayList<HashMap<String, Object>> selectListEditorPartner(HashMap<String, Object> hmap);

	HashMap<String,Object> showUpdateJobConBoard(int bno);

	void updateJobConBoard(HashMap<String, Object> hmap) throws JobBoardInsertException;


}
