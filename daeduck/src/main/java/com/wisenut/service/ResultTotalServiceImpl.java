package com.wisenut.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.wisenut.common.WNCollection;
import com.wisenut.common.WNDefine;
import com.wisenut.common.WNSearchInfo;

import lombok.extern.java.Log;

@Log
@Service
public class ResultTotalServiceImpl implements ResultManagement {

	@Override
	public List<Map<String, Object>> getViewResult(WNSearchInfo wnSearch, String colName) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = new ArrayList<>();
		int count = wnSearch.getResultCount(colName);
		int thisTotalCount = wnSearch.getResultTotalCount(colName);
		log.info("ALL 검색결과건수" + count);
		log.info("ALL 전체 검색결과 건수" + thisTotalCount);
		int collTarget = 0;
		if (thisTotalCount > 0) {
			for (int index = 0; index < WNCollection.COLLECTIONS.length; index++) {
				if (WNCollection.COLLECTIONS[index].equals(colName))
					collTarget = index;
			}
			for (int i = 0; i < count; i++) {
				Map<String, Object> result = new HashMap<>();

				String[] result_fields = wnSearch.getWNCollection().COLLECTION_INFO[collTarget][WNDefine.RESULT_FIELD]
						.split(",");
				for (String value:result_fields) {
					result.put(value, wnSearch.getField(colName, value, i, false));
				}

				list.add(result);
			}

		}
		
		return list;
	}

}
