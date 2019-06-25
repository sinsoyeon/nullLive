package com.kh.nullLive.common.paging.model.service;

import java.util.ArrayList;

import com.kh.nullLive.board.model.vo.Board;
import com.kh.nullLive.common.paging.model.vo.PagingVo;

public interface PagingService {

	ArrayList<Board> selectPaging(PagingVo paging);

	int selectTotalPaging();

}
