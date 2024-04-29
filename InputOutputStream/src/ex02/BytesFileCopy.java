package ex02;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Scanner;

public class BytesFileCopy {

	public static void main(String[] args) {
		
		
		try {
			InputStream in = new FileInputStream("c:/upload/kbc.dat");
//			OutputStream out = new FileOutputStream("c:/upload/kbc.dat");
			
//			byte[] bs = "korea".getBytes();
			
//			out.write(bs);
			
			int data;
			
			while(true) {
				data = in.read();
				if(data ==  -1) {
					break;
				}
				System.out.print((char)data);
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
