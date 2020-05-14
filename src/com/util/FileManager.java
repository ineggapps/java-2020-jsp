package com.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

public class FileManager {
	public static boolean doFiledownload(String saveFilename, String originalFilename, String pathname,
			HttpServletResponse resp) {
		// 1. saveFilename => ������ ����Ǵ� ���� �̸�
		// 2. originalFilename => �ٿ�ε� �� Ŭ���̾�Ʈ�� �����ִ� ���ϸ� (Ŭ���̾�Ʈ�� ���ʿ� ���ε��ߴ� ���������� ���� �̸�)
		// 3. pathname => ��θ�
		// 4. resp => ������ Ŭ���̾�Ʈ�� ������ �� �ִ� ������ ��ü
		boolean flag = false;

		BufferedInputStream bis = null;
		OutputStream os = null;

		try {
			//��Ʈ��ũ �ۼ��� �⺻ ����Ÿ��: ISO-8859-1 ���ڵ�
			//����:https://www.it-swarm.dev/ko/utf-8/utf8%EA%B3%BC-iso88591%EC%9D%98-%EC%B0%A8%EC%9D%B4%EC%A0%90%EC%9D%80-%EB%AC%B4%EC%97%87%EC%9E%85%EB%8B%88%EA%B9%8C/940246725/
			//�׷��� ����� ���ϸ��� MS949 (euc-kr) �������� ����Ǿ� �ִ�.
			//�׷��Ƿ� ��Ʈ��ũ �ۼ��� �⺻ ���� Ÿ������ ��ȯ�Ͽ� �����ؾ� �����̸��� ������ �ʴ´�.
			originalFilename = new String(originalFilename.getBytes("euc-kr"), "8859_1");
			pathname = pathname + File.separator + saveFilename;
			File f = new File(pathname);
			if(!f.exists()) {//������ �����ϴ��� üũ
				return flag;
			}
			/////////////////// ������ �����ϴ� ��쿡
			//Ŭ���̾�Ʈ�� ������ ���� Ÿ���� �����Ѵ�.
			resp.setContentType("application/octet-stream");
			
			// Ŭ���̾�Ʈ�� ���ϸ��� ����� �Ǿ ����
			resp.setHeader("Content-disposition", "attachment;filename="+originalFilename);
			//disposition: 1.���� 2.ó�� 3.���� 4.����
			
			// Ŭ���̾�Ʈ�� ���� ������ ���� (Reader�� ����� �� ���� => ������ �����Ƿ�)
			byte[] b = new byte[1024];
			bis = new BufferedInputStream(new FileInputStream(f));
			// Ŭ���̾�Ʈ�� ������ ��� ��Ʈ�� ����
			os = resp.getOutputStream();
			
			int n;
			while((n=bis.read(b))!=-1) {
				os.write(b,0,n);
			}
			os.flush();
			flag = true;//������ ������ ���
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
