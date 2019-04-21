package com.member;

import java.util.Random;

public class cert_test {

	public static void main(String[] args) {
		String certno[] = new String[6];
		Random random = new Random();
		String cert_num = "";
		for(int i=0;i<certno.length;i++) {
			certno[i] = String.valueOf(random.nextInt(8)+1);
			System.out.println(certno[i]);
			cert_num=cert_num+certno[i];
		}
		System.out.println(cert_num.toString());
		
	}

}
