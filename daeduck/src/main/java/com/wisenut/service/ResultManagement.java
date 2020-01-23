package com.wisenut.service;

import java.util.List;
import java.util.Map;

import com.wisenut.common.WNSearchInfo;

public interface ResultManagement {
	public List<Map<String, Object>> getViewResult(WNSearchInfo wnSearch, String colName);
}
