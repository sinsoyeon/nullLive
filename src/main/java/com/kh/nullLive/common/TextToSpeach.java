package com.kh.nullLive.common;

import com.google.cloud.texttospeech.v1.AudioConfig;
import com.google.cloud.texttospeech.v1.AudioEncoding;
import com.google.cloud.texttospeech.v1.SsmlVoiceGender;
import com.google.cloud.texttospeech.v1.SynthesisInput;
import com.google.cloud.texttospeech.v1.SynthesizeSpeechResponse;
import com.google.cloud.texttospeech.v1.TextToSpeechClient;
import com.google.cloud.texttospeech.v1.VoiceSelectionParams;
import com.google.protobuf.ByteString;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TextToSpeach {	
	@RequestMapping("tts.me")
	@ResponseBody
	public String textToSpeach(@RequestParam("requestMsg")String requestMsg,@RequestParam("nickName")String nickName) {
		  try (TextToSpeechClient textToSpeechClient = TextToSpeechClient.create()) {
		      SynthesisInput input = SynthesisInput.newBuilder()
		            .setText(nickName+"님의 후원 메세지 : " + requestMsg)
		            .build();
		      VoiceSelectionParams voice = VoiceSelectionParams.newBuilder()
		          .setLanguageCode("ko-KR")
		          .setSsmlGender(SsmlVoiceGender.NEUTRAL)
		          //.setSsmlGender(SsmlVoiceGender.MALE)
		          .build();


            AudioConfig audioConfig = AudioConfig.newBuilder()
                .setAudioEncoding(AudioEncoding.MP3)
                .build();
            
            SynthesizeSpeechResponse response = textToSpeechClient.synthesizeSpeech(input, voice,
                audioConfig);

            ByteString audioContents = response.getAudioContent();

		      String fileName = nickName + "01.mp3";
		      
		      try (OutputStream out = new FileOutputStream(fileName)) {
		        out.write(audioContents.toByteArray());
				/* new SoundPlayer(fileName,false).start(); */
		        System.out.println("성공했습니다.");		       
		        return fileName;
		      }
		  } catch (IOException e) {
			e.printStackTrace();
			return "";
		}
	}
	
	
	@RequestMapping("startTTs.me")
	@ResponseBody
	public String startTTS(String fileName) {
		
		 new SoundPlayer(fileName,false).start();
		
		return "";
	}
}
