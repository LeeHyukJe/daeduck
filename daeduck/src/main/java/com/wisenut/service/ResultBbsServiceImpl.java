package com.wisenut.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.wisenut.common.WNDefine;
import com.wisenut.common.WNSearchInfo;

@Service
public class ResultBbsServiceImpl extends ResultAbstractService implements ResultService{

	@Override
	public List<Map<String, Object>> getViewResult(WNSearchInfo wnSearch, String colName) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = new ArrayList<>();
		int count = wnSearch.getResultCount(colName);
		int thisTotalCount = wnSearch.getResultTotalCount(colName);

		if (thisTotalCount > 0) {
			for (int i = 0; i < count; i++) {
				Map<String, Object> result = new HashMap<>();
				for(String value:wnSearch.getWNCollection().COLLECTION_INFO[1][WNDefine.RESULT_FIELD].split(",")) {
					if(value.contains("/")) {
						value = value.substring(0, value.indexOf("/"));
					}
					result.put(value,wnSearch.getField(colName, value, i, false));
				}
				list.add(result);
			}

		}
		return list;
	}

}
