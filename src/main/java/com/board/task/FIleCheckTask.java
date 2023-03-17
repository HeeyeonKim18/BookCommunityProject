package com.board.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.board.domain.BoardAttachVO;
import com.board.mapper.BoardAttachMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Component	
public class FIleCheckTask {
	
	@Autowired
	BoardAttachMapper mapper;
	
	@Scheduled(cron="0 0 2 * * *")
	public void checkFiles() throws Exception {
		log.warn("file check task run .....");
		log.warn("...........");
		log.warn(new Date());
		
		List<BoardAttachVO> fileList = mapper.getOldFiles();
		
		List<Path> fileListPaths = fileList.stream()
				.map(vo -> Paths.get("/Users/kimheeyeon/Desktop/upload12", vo.getUploadPath(),
		vo.getUuid() + "_" + vo.getFileName())).collect(Collectors.toList());
		
		fileList.stream().map(vo -> Paths.get("/Users/kimheeyeon/Desktop/upload12", vo.getUploadPath(), "s_" +
		vo.getUuid() + "_" + vo.getFileName())).forEach(p -> fileListPaths.add(p));
		
		log.warn("=================");
		
		fileListPaths.forEach(p -> log.warn(p));
		
		File targetDir = Paths.get("/Users/kimheeyeon/Desktop/upload12", getFolderYesterDay()).toFile();
		
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath())== false);
		
		log.warn("================");
		
		for(File file: removeFiles) {
			log.warn(file.getAbsolutePath());
			file.delete();
		}
		
	}
	
	private String getFolderYesterDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);;
		
		String str = sdf.format(cal.getTime());
		
		return str.replace("-", File.separator);
	}

}
