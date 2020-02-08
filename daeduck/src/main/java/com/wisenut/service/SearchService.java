package com.wisenut.service;

import com.wisenut.common.WNSearchInfo;
import com.wisenut.domain.SrchParamVO;

public interface SearchService {
	public WNSearchInfo setting(SrchParamVO value) throws Exception;
	public WNSearchInfo settingbyQuality(SrchParamVO value, Object obj) throws Exception;
}
