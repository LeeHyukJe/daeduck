package com.wisenut.service;

import com.wisenut.common.WNSearchInfo;
import com.wisenut.domain.SrchParamVO;

public interface SearchService {
	public WNSearchInfo setting(SrchParamVO value) throws Exception;
}
