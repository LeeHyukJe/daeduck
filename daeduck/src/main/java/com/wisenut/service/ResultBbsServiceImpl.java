package com.wisenut.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;

import com.wisenut.common.WNDefine;
import com.wisenut.common.WNSearchInfo;

@Service
@Order(2)
public class ResultBbsServiceImpl extends ResultAbstractService implements ResultService {

	@Override
	public List<Map<String, Object>> getViewResult(WNSearchInfo wnSearch, String colName) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = new ArrayList<>();
		int count = wnSearch.getResultCount(colName);
		int thisTotalCount = wnSearch.getResultTotalCount(colName);

		boolean flag = false; // 값 중에 false가 있는지 확인하는 flag 값
		
		if (thisTotalCount > 0) {
			for (int i = 0; i < count; i++) {
				Map<String, Object> result = new HashMap<>();
				for (String value : wnSearch.getWNCollection().COLLECTION_INFO[1][WNDefine.RESULT_FIELD].split(",")) {
					
//					if(value.equals("Authoritytype")) { // 필드명이 Authoritytype 일 경우
//						
//						String[] vars = wnSearch.getField(colName, value, i, false).split("\\|"); // |가 구분자로 되어 분리
//						for(String var:vars) {
//							if(var.equals("false")) { // 값 중에서 false가 있으면 플래그 값 변경
//								flag = true;
//							}
//						}
//					}
//					
//					
					
					if (value.contains("/")) {
						value = value.substring(0, value.indexOf("/"));
					}
					
					if(!flag)
						result.put(value, wnSearch.getField(colName, value, i, false));
				}
				list.add(result);
			}

		}
		return list;
	}

}
