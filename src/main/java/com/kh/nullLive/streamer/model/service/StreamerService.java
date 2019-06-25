package com.kh.nullLive.streamer.model.service;

public interface StreamerService {

	int insertSubscribe(int mno, String streamer, int amount);

	int selectStreamer(String streamer);

}
