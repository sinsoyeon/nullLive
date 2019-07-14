package com.kh.nullLive.partner.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.nullLive.partner.model.excption.updateMngAuthException;

public interface PartnerService {

	HashMap<String, ArrayList<String>> selectMngAuth(HashMap<String, Object> hmap);

	void updateMngAuth(HashMap<String, Object> hmap) throws updateMngAuthException;

}
