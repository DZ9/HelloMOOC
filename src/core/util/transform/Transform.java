package core.util.transform;
import it.sauronsoftware.jave.AudioAttributes;
import it.sauronsoftware.jave.Encoder;
import it.sauronsoftware.jave.EncoderException;
import it.sauronsoftware.jave.EncodingAttributes;
import it.sauronsoftware.jave.InputFormatException;
import it.sauronsoftware.jave.VideoAttributes;
import it.sauronsoftware.jave.VideoSize;

import java.io.File;


public class Transform {

	public static void main(String[] args) throws IllegalArgumentException, InputFormatException, EncoderException {
		// TODO Auto-generated method stub
		File source = new File("source.avi");
		File target = new File("target.mp4");
		AudioAttributes audio = new AudioAttributes();
		audio.setCodec("libmp3lame");
		audio.setBitRate(new Integer(64000));
		audio.setChannels(new Integer(1));
		audio.setSamplingRate(new Integer(22050));
		VideoAttributes video = new VideoAttributes();
		video.setCodec("mpeg4");
		video.setBitRate(new Integer(3200000));
		video.setFrameRate(new Integer(15));
		video.setSize(new VideoSize(1600, 900));
		EncodingAttributes attrs = new EncodingAttributes();
		attrs.setFormat("mp4");
		attrs.setAudioAttributes(audio);
		attrs.setVideoAttributes(video);
		Encoder encoder = new Encoder();
		encoder.encode(source, target, attrs);
		String sting[] = encoder.getSupportedEncodingFormats();
		for(int i = 0; i < sting.length;i++) {
			System.out.println(sting[i]);
		}
		System.out.println("-----------------------");
		String sting2[] = encoder.getVideoEncoders();
		for(int i = 0; i < sting2.length;i++) {
			System.out.println(sting2[i]);
		}
	}

}
