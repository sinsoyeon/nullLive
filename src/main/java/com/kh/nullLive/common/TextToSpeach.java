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

public class TextToSpeach {
	public static void main(String[] args) {
		  try (TextToSpeechClient textToSpeechClient = TextToSpeechClient.create()) {
		      SynthesisInput input = SynthesisInput.newBuilder()
		            .setText("tts 테스트입니다 하하하")
		            .build();
		      VoiceSelectionParams voice = VoiceSelectionParams.newBuilder()
		          .setLanguageCode("ko-KR")
		          //.setSsmlGender(SsmlVoiceGender.NEUTRAL)
		          .setSsmlGender(SsmlVoiceGender.MALE)
		          .build();

		      AudioConfig audioConfig = AudioConfig.newBuilder()
		          .setAudioEncoding(AudioEncoding.MP3)
		          .build();
		      
		      

		      SynthesizeSpeechResponse response = textToSpeechClient.synthesizeSpeech(input, voice,
		          audioConfig);

		      ByteString audioContents = response.getAudioContent();

		      try (OutputStream out = new FileOutputStream("output.mp3")) {
		        out.write(audioContents.toByteArray());
		        new SoundPlayer("output.mp3",false).start();
		        System.out.println("성공했습니다.");		       
		      }
		  } catch (IOException e) {
			e.printStackTrace();
		}
	}
}
