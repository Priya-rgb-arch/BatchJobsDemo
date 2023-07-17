package com.error.alert;

import java.io.IOException;

public class SkopeRejectsAlert {

	public static void main(String[] args) {

		try {
			String scriptPath = "/SkopeRejectAlert.sh";
			ProcessBuilder processBuilder = new ProcessBuilder("bash", scriptPath);
			Process process = processBuilder.start();
			int exitCode = process.waitFor();
			if (exitCode == 0) {
				System.out.println(" successfully.");
			} else {
				System.out.println("Failed .");
			}
		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
		}
	}
}