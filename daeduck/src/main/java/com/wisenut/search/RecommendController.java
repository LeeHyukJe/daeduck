package com.wisenut.search;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.wisenut.common.WNCollection;

import lombok.extern.java.Log;
@Log
@RestController
public class RecommendController {

	// http://192.168.8.36:7800/manager/WNRun.do?target=recommend&query=TEST&label=daeduck&datatype=json
	@PostMapping(value = "/recommend", produces="application/json;charset=UTF-8")
	public ResponseEntity<String> recommend(@RequestBody Map<String, String> params, HttpServletResponse response) {
		int timeout = 500; // 1000분의 500초 : 0.5초이내에 응답이 없는 경우 연결 종료
		String query = params.get("query");
		String target = params.get("target");
		String datatype = params.get("datatype");
		String label = params.get("label");
		// System.out.println("--> Query:" + query + "/ datatype:" + datatype);
		response.setHeader("Access-Control-Allow-Origin", "*");
		try {
			
			if (query != null) {
				try {
					query = URLEncoder.encode(query, "UTF-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			String url = "http://" + WNCollection.MANAGER_IP + ":" + WNCollection.MANAGER_PORT + "/manager/WNRun.do?";
		

			if (query != null) {
				url += "query=" + query + "&";
			}

			if (target != null) {
				url += "target=" + target + "&";
			}
			
			if(datatype != null) {
				url += "datatype=" + datatype + "&";
			}
			
			if(label != null) {
				url += "label=" + label;
			}
			

			log.info("추천서비스 URL : "+url);
			String result = getHtmls(url, timeout);

			return new ResponseEntity<>(result, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
		}

	}

	public String getHtmls(String receiverURL, int timeout) {
		StringBuffer receiveMsg = new StringBuffer();
		try {
			@SuppressWarnings("unused")
			int errorCode = 0;
			// -- receive servlet connect
			URL servletUrl = new URL(receiverURL);
			HttpURLConnection uc = (HttpURLConnection) servletUrl.openConnection();
			uc.setReadTimeout(timeout);
			uc.setRequestMethod("POST");
			uc.setDoOutput(true);
			uc.setDoInput(true);
			uc.setUseCaches(false);
			uc.connect();
			// init
			errorCode = 0;
			// -- Network error check
			if (uc.getResponseCode() == HttpURLConnection.HTTP_OK) {
				String currLine = new String();
				// UTF-8인 경우
				BufferedReader in = new BufferedReader(new InputStreamReader(uc.getInputStream(), "UTF-8"));
				// BufferedReader in = new BufferedReader(new
				// InputStreamReader(uc.getInputStream()));
				while ((currLine = in.readLine()) != null) {
					receiveMsg.append(currLine).append("\r\n");
				}
			} else {
				errorCode = uc.getResponseCode();
				return receiveMsg.toString();
			}
			uc.disconnect();
		} catch (Exception ex) {
			System.out.println(ex);
		}
		return receiveMsg.toString();
	}
}
