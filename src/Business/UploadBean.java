package Business;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.struts.upload.FormFile;

public class UploadBean {
	
	public boolean upload(String outpath,FormFile file){
		
		boolean b=false;
		
		FileOutputStream fout=null;
		InputStream in=null;
		
		byte[] bytes=new byte[4096];
		int n=0;
		
		try {
			
			fout
			=new FileOutputStream(outpath);
			in=file.getInputStream();
			
			while((n=in.read(bytes,0,4096))!=-1){
				fout.write(bytes, 0, n);
			}
			in.close();
			fout.close();
			b=true;
		} catch (FileNotFoundException e) {
			b=false;
			e.printStackTrace();
		} catch (IOException e) {
			b=false;
			e.printStackTrace();
		}
		return b;
	}
	
}
