package com.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

public class FileManager {
	public static boolean doFiledownload(String saveFilename, String originalFilename, String pathname,
			HttpServletResponse resp) {
		// 1. saveFilename => 서버에 저장되는 파일 이름
		// 2. originalFilename => 다운로드 시 클라이언트에 보여주는 파일명 (클라이언트가 최초에 업로드했던 시점에서의 파일 이름)
		// 3. pathname => 경로명
		// 4. resp => 파일을 클라이언트에 전송할 수 있는 유일한 객체
		boolean flag = false;

		BufferedInputStream bis = null;
		OutputStream os = null;

		try {
			//네트워크 송수신 기본 문자타입: ISO-8859-1 인코딩
			//참조:https://www.it-swarm.dev/ko/utf-8/utf8%EA%B3%BC-iso88591%EC%9D%98-%EC%B0%A8%EC%9D%B4%EC%A0%90%EC%9D%80-%EB%AC%B4%EC%97%87%EC%9E%85%EB%8B%88%EA%B9%8C/940246725/
			//그러나 저장된 파일명은 MS949 (euc-kr) 형식으로 저장되어 있다.
			//그러므로 네트워크 송수신 기본 문자 타입으로 변환하여 전송해야 파일이름이 깨지지 않는다.
			originalFilename = new String(originalFilename.getBytes("euc-kr"), "8859_1");
			pathname = pathname + File.separator + saveFilename;
			File f = new File(pathname);
			if(!f.exists()) {//파일이 존재하는지 체크
				return flag;
			}
			/////////////////// 파일이 존재하는 경우에
			//클라이언트에 전송할 문서 타입을 지정한다.
			resp.setContentType("application/octet-stream");
			
			// 클라이언트에 파일명을 헤더에 실어서 전송
			resp.setHeader("Content-disposition", "attachment;filename="+originalFilename);
			//disposition: 1.성향 2.처분 3.기질 4.생각
			
			// 클라이언트에 파일 내용을 전송 (Reader는 사용할 수 없음 => 파일이 깨지므로)
			byte[] b = new byte[1024];
			bis = new BufferedInputStream(new FileInputStream(f));
			// 클라이언트에 전송할 출력 스트림 선언
			os = resp.getOutputStream();
			
			int n;
			while((n=bis.read(b))!=-1) {
				os.write(b,0,n);
			}
			os.flush();
			flag = true;//전송을 성공한 경우
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (bis != null) {
				try {
					bis.close();
				} catch (Exception e2) {
				}
			}
			if (os != null) {
				try {
					os.close();
				} catch (Exception e2) {
				}
			}
		}

		return flag;
	}
}
