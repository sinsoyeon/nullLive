package com.kh.nullLive.streamer.model.service;

import com.kh.nullLive.streamer.model.vo.Streamer;

public interface StreamerService {


	int selectStreamer(String streamer);

	int insertSubscribe(Streamer streamer);

	int insertMnthlSbscr(Streamer streamer,int amount);

	int insertNP(Streamer streamer, int amount);

}
