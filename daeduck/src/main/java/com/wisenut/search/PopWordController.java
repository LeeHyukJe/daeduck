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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wisenut.common.WNCollection;

@RestController
public class PopWordController {

	// 인기검색어
	@RequestMapping(value = "/popword", method= {RequestMethod.GET }, produces = "text/plain; charset=utf8")
	public ResponseEntity<String> popword(@RequestParam Map<String, String> params, HttpServletResponse response) {
		/**
		 * subject: 인기검색어 가져오는 페이지
		 **/
		

		ResponseEntity<String> entity = null;
		try {

			int timeout = 500; // 1000분의 500초 : 0.5초이내에 응답이 없는 경우 연결 종료
			String query = params.get("query"); // Normal:EUC-KR
			String target = params.get("target");
			String charset = params.get("charset");
			String range = params.get("range");
			String collection = params.get("collection");
			String datatype = params.get("datatype");

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

			if (charset != null) {
				url += "charset=" + charset + "&";
			}

			if (range != null) {
				url += "range=" + range + "&";
			}

			if (collection != null) {
				url += "collection=" + collection + "&";
			}
			
			if(datatype != null) {
				url += "datatype=" + datatype;
			}
			System.out.println(url);
			response.setHeader("Access-Control-Allow-Origin", "*");
			entity = new ResponseEntity<String>(getHtmls(url, timeout), HttpStatus.OK);
			return entity;
		} catch (Exception e) {
			entity = new ResponseEntity<String>("", HttpStatus.BAD_REQUEST);
			return entity;
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
