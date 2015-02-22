package core.util.upload;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;


public class FileUpload {

	
	    public boolean upload(File file,String fileName) throws Exception
	    {
	        String root = ServletActionContext.getServletContext().getRealPath("/upload");
	        
	        InputStream is = new FileInputStream(file);
	        
	        OutputStream os = new FileOutputStream(new File(root, fileName));
	        
	        System.out.println("fileFileName: " + fileName);

	       // 因为file是存放在临时文件夹的文件，我们可以将其文件名和文件路径打印出来，看和之前的fileFileName是否相同
	        System.out.println("file: " + file.getName());
	        System.out.println("file: " + file.getPath());
	        
	        byte[] buffer = new byte[500];
	        int length = 0;
	        
	        while(-1 != (length = is.read(buffer, 0, buffer.length)))
	        {
	            os.write(buffer);
	        }
	        os.flush();
	        os.close();
	        is.close();
	        
	        return true;
	    }

}
