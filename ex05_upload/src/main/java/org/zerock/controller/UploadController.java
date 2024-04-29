package org.zerock.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UploadController {

	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload from..........");
	}
	
	@PostMapping("/uploadFormAction")
	public void uploadFormActionPost(MultipartFile[] uploadFile, Model model) {
		
		String uploadFolder = "c:\\upload";
		
		for( MultipartFile multipartFile : uploadFile) {
			log.info("-----------------------------------");
			log.info("upload file Name : " + multipartFile.getOriginalFilename());
			log.info("upload file size : " + multipartFile.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());  //저장 대상
			
			try {
				multipartFile.transferTo(saveFile);  //파일 저장
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax...........");
	}
	
	
	@PostMapping("/uploadAjaxAction")
	@ResponseBody
	public void uploadAjaxAction(MultipartFile[] uploadFile) {
		
		String uploadFolder = "C:\\upload";
		
		
		//make folder......
		File uploadPath = new File(uploadFolder, getFolder());  //c:\\upload\2024\04\29
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();   //폴더or디렉토리 생성
		}
		
		
		for( MultipartFile multipartFile : uploadFile) {
			
			log.info("-----------ajax-----------------------");
			log.info("upload file Name : " + multipartFile.getOriginalFilename());
			log.info("upload file size : " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			log.info(uploadFileName);
			uploadFileName =  uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			log.info(uploadFileName);
			
			
			File saveFile = new File(uploadPath, uploadFileName);  //저장 대상
			
			try {
				multipartFile.transferTo(saveFile);  //파일 저장
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		log.info("-----------------------------------------------");
		
		String str = sdf.format(date);  //2024-04-29
		
		return str.replace("-", File.separator);  //  2024\04\29
	}
}
