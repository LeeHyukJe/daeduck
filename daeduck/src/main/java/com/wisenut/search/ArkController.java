package com.wisenut.search;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wisenut.common.WNCollection;

import lombok.extern.java.Log;

@RestController
@Log
public class ArkController {
	
	// 자동완성
	
	
	@RequestMapping(value="/ark", method= {RequestMethod.GET,RequestMethod.POST}, produces = "text/plain; charset=utf8")
	public ResponseEntity<String> Ark(@RequestBody Map<String,String> params, HttpServletResponse response) {
		
		int timeout = 500;	// 1000분의 500초 : 0.5초이내에 응답이 없는 경우 연결 종료
		String query = params.get("query");
		String convert = params.get("convert");
		String target =  params.get("target");
		String charset = params.get("charset");
		String datatype =params.get("datatype");
		//System.out.println("--> Query:" + query + "/ datatype:" + datatype);
		response.setHeader("Access-Control-Allow-Origin", "*");
		
		log.info("자동완성 파라미터 : "+params);
		try {
			query = URLEncoder.encode(query, "UTF-8");
			String url = "http://" + WNCollection.MANAGER_IP + ":" + WNCollection.MANAGER_PORT + "/manager/WNRun.do";
			String param = "query=" + query + "&convert=" + convert + "&target=" + target + "&charset=" + charset + "&datatype=" + datatype;
			
			String result = getHtmls(url,param,timeout);
			
			return new ResponseEntity<>(result,HttpStatus.OK);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
		}

		
	}
	
	public String getHtmls(String receiverURL, String parameter, int timeout) {
		StringBuffer receiveMsg = new StringBuffer();
		HttpURLConnection uc = null;
		try {
			URL servletUrl = new URL(receiverURL);
			uc = (HttpURLConnection) servletUrl.openConnection();
			uc.setRequestProperty("Content-type", "application/x-www-form-urlencoded");
			uc.setRequestMethod("POST");
			uc.setDoOutput(true);
			uc.setDoInput(true);
			uc.setUseCaches(false);
			uc.setDefaultUseCaches(false);
			DataOutputStream dos = new DataOutputStream (uc.getOutputStream());
			dos.write(parameter.getBytes());
			dos.flush();
			dos.close();
			
			@SuppressWarnings("unused")
			int errorCode = 0;
			// -- Network error check
			//System.out.println("[URLConnection Response Code] " + uc.getResponseCode());
			if (uc.getResponseCode() == HttpURLConnection.HTTP_OK) {
				String currLine = "";
                // UTF-8. ..
                BufferedReader in = new BufferedReader(new InputStreamReader(uc.getInputStream(), "UTF-8"));
                while ((currLine = in.readLine()) != null) {
                	receiveMsg.append(currLine).append("\r\n");
                }
                in.close();
            } else {
                  errorCode = uc.getResponseCode();
                  return receiveMsg.toString();
             }
       } catch(Exception ex) {
            System.out.println(ex);
       } finally {
            uc.disconnect();
       }

       //System.out.println(receiveMsg.toString());
       return receiveMsg.toString();
	}

}
