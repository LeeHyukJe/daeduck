package com.wisenut.service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

import com.wisenut.common.WNSearchInfo;

public interface ResultService {
	//public JSONObject getResultList(WNSearchInfo wnSearch, String colName) throws Exception;
	public JSONObject jsonOutputParsing(List<Map<String, Object>> list, String colName, int totalCount) throws Exception;
	public List<Map<String, Object>> getViewResult(WNSearchInfo wnSearch, String colName);

}
