package com.kh.nullLive.common;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.nullLive.common.attachment.model.vo.Attachment;

public class AttchmentUtil {

	public static List<Attachment> getAttList(HttpServletRequest request) throws Exception{
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\uploadFiles";
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		
		// MultipartHttpServletRequest 객체에서 파일정보를 Iterator타입으로 저장
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
     
        MultipartFile multipartFile = null;
        String originFileName = null; // 사용자가 업로드한 파일명(확장자 제외) 
        String ext = null; // 파일 확장자명
        String changeFileName = null; // DB에 저장할 파일명
        
        // 사용자가 업로드한 여러개의 파일을 처리하기 위해 List 객체 생성
        List<Attachment> list = new ArrayList<Attachment>();
        
        // 각각의 파일정보를 저장할 VO 객체 초기화
        Attachment att = null; 
        
        // 파일을 저장할 디렉토리 확인, 디렉토리 없을 시 생성하는 로직 포함
        File file = new File(filePath);
		
        // MultipartHttpServletRequest 객체에서 파일의 개수 만큼 아래의 로직을 반복 수행
        while(iterator.hasNext()){
            multipartFile = multipartHttpServletRequest.getFile(iterator.next());
            if(multipartFile.isEmpty() == false){
                
            	originFileName = multipartFile.getOriginalFilename();
               
                ext = originFileName.substring(originFileName.lastIndexOf("."));
                changeFileName = FileUtil.getSaveFileNm(originFileName);
               
                file = new File(filePath + "\\" +changeFileName+ext);
                multipartFile.transferTo(file);
                 
                att = new Attachment();
                
                att.setOriginName(originFileName);
                att.setChangeName(changeFileName+ext);
                att.setFilePath(filePath);
                System.out.println(att);
                list.add(att);
            }
        }
		
		return list;
	}
}
