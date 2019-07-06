package com.kh.nullLive.common;

import java.io.File;

public class FileUtil {
	 
    // 디렉토리 확인, 존재하지 않을 경우 생성
    public static void exsitDir(File file) throws Exception{
        if(file.exists() == false){
            file.mkdirs();
        }
    }
    
    // DB에 저장할 유일한 파일명으로 변경
    public static String getSaveFileNm(String orgFileName, String orgFileExtension) throws Exception{
        StringBuffer sb = new StringBuffer();
        sb.append(CommonUtils.getRandomString());
        sb.append("_");
        sb.append(orgFileName);
        sb.append(orgFileExtension);
        return sb.toString();
    }
    public static String getSaveFileNm(String orgFileName) throws Exception{
        StringBuffer sb = new StringBuffer();
        sb.append(CommonUtils.getRandomString());
        return sb.toString();
    }
    
    // 파일을 해당 디렉토리에서 삭제
    public static void deleteFile(String filePath,String changeName) throws Exception{
        File file = new File(filePath+"\\"+changeName);
        file.delete();
    }
 


}
