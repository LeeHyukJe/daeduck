package com.wisenut.service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public abstract class ResultAbstractService implements ResultService {
	
	@SuppressWarnings("unchecked")
	@Override
	public JSONObject jsonOutputParsing(List<Map<String, Object>> list, String colName, int totalCount) throws Exception {
		JSONArray jsonArray = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			JSONObject jsonObject = new JSONObject();
			for (Map.Entry<String, Object> entry : list.get(i).entrySet()) {
				String key = entry.getKey();
				Object keyVal = entry.getValue();
				jsonObject.put(key, keyVal);
			}
			jsonArray.add(jsonObject);
		}
		
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put(colName, jsonArray);
		jsonObj.put("totalCount", totalCount);
		return jsonObj;
	}
	
	

	
}
