package com.wisenut.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Service;

import com.wisenut.common.WNCollection;
import com.wisenut.common.WNDefine;
import com.wisenut.common.WNSearch;
import com.wisenut.common.WNSearchInfo;
import com.wisenut.domain.SrchParamVO;

import lombok.extern.java.Log;

@Service("searchService")
@Log
public class SearchServiceImpl implements SearchService {

	WNSearch wnsearch;
	public WNSearchInfo wnSearchInfo;

	public static int TOTALVIEWCOUNT = 3; // 통합검색시 기본적으로 보여주는 갯
	public static int COLLECTIONVIEWCOUNT = 3; // 컬렉션 검색시 기본적으로 보여주는 갯수

	String START_DATE = "1970.01.01"; //

	int totalCount = 0;
	int startCount = 0;

	String strOperation = "";

	// 실시간 검색어 화면 출력 여부 체크
	boolean isRealTimeKeyword = false;

	// 오타 후 추천 검색어 화면 출력 여부 체크
	boolean useSuggestedQuery = true;
	String suggestQuery = "";

	// 디버깅 보기 설정
	boolean isDebug = false;
	
	private String auth = "";

	@Override
	public WNSearchInfo setting(SrchParamVO value) throws Exception {
		// TODO Auto-generated method stub

		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();

		String[] searchFields = null;
		if (value.getSearchField() != null)
			searchFields = value.getSearchField().split(",");

		String[] collections = null;

		if (value.getCollection().equals("ALL")) {
			collections = WNCollection.COLLECTIONS;
		} else {
			collections = new String[] { value.getCollection() };
		}

		if (value.getReQuery().equals("1")) {
			value.setRealQuery(value.getQuery() + " " + value.getRealQuery());
		} else if (!value.getReQuery().equals("2")) {
			value.setRealQuery(value.getQuery());
		}

		// wnsearch = new WNSearch(isDebug, false, collections, searchFields);
		wnSearchInfo = new WNSearchInfo.WNSearchBuilder().isDebug(isDebug).isUidSrch(false).collections(collections)
				.searchFields(searchFields).Build();

		int viewResultCount = value.getListCount(); // 통합검색이 아닐 경우 보여주는 갯수

		if (value.getCollection().equals("ALL") || value.getCollection().equals(""))
			viewResultCount = value.getTotalViewCnt(); // 통합검색 일 경우 기본적으로 보여주는 갯수

		for (int i = 0; i < collections.length; i++) {

			wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.PAGE_INFO,
					value.getStartCount() + "," + viewResultCount);

			if (!value.getQuery().equals("")) {
				// wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.SORT_FIELD,
				// value.getSort() + "/DESC");
				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.SORT_FIELD, "RANK/DESC");
			} else {
				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.DATE_RANGE,
						START_DATE.replaceAll("[.]", "/") + ",2030/01/01,-");
				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.SORT_FIELD, "DATE/DESC");
			}

			// searchField 값이 있으면 설정, 없으면 기본검색필드
			if (!value.getSearchField().equals("") && value.getSearchField().indexOf("ALL") == -1) {
				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.SEARCH_FIELD, value.getSearchField());
			}

			// operation 설정
			if (!strOperation.equals("")) {
				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.FILTER_OPERATION, strOperation);
			}

			// exquery 설정
			if (!value.getExquery().equals("")) {
				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.EXQUERY_FIELD, value.getExquery());
			}

			// 기간 설정 , 날짜가 모두 있을때
			if (!value.getStartDate().equals("") && !value.getEndDate().equals("")) {
				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.DATE_RANGE,
						value.getStartDate().replaceAll("[.]", "/") + "," + value.getEndDate().replaceAll("[.]", "/")
								+ ",-");

//				wnSearchInfo.setCollectionInfoValue(collections[i],WNDefine.BOOST_QUERY,"");
//				wnSearchInfo.setCollectionInfoValue(collections[i],WNDefine.RANKING_OPTION,"");
			}

			// 날짜 설정
			if (!value.getStartDate().equals("")) {
				if (value.getEndDate().equals("")) { // endDate가 없으면 오늘날짜 기준까지 검색
					wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.DATE_RANGE,
							value.getStartDate().replaceAll("[.]", "/") + "," + format.format(date) + ",-");
					// System.out.println(value.getStartDate() + ","+format.format(date)+",-");
				}
				else { // 마지막 날짜가 있는 경우
					wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.DATE_RANGE,
							value.getStartDate().replaceAll("[.]", "/") + "," + value.getEndDate().replaceAll("[.]", "/") + ",-");
				}
			}

			// 정렬 선택
			if (!value.getSort().equals("")) {

				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.SORT_FIELD, value.getSort() + "/DESC");
			}

			// 필터쿼리 처기
			if (collections[i].equals("app")) {
				// 권한 처리
				if (!value.getAuthority().equals("") || !value.getAuthorityapdept().equals("")) {
					auth += value.getAuthority() + "|" + value.getAuthorityapdept() + "|";
				}
				if (!value.getTech().equals(""))
					wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.PREFIX_FIELD,
							"<TechnologyDOC:contains:" + value.getTech() + ">");
			} else if (collections[i].equals("bbs")) {
				if (!value.getAuthority().equals(""))
					wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.EXQUERY_FIELD,
							"<authority:contains:" + value.getAuthority() + ">");
			}
			
			// 전자결재 외 필터 쿼리 적용 및 전체 필터 쿼리 적용
			if(!value.getAuthorityex().equals("") || !value.getAuthoritydept().equals("")) {
				auth += value.getAuthorityex() +"|" + value.getAuthoritydept();
				
				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.EXQUERY_FIELD, "<AUTHORITY:contains:"+auth+">");
			}

			// 카테고리 그룹핑
			if (collections[i].equals("standard")) {
				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.CATEGORY_GROUPBY, "FolderPath:1,2/SC");
			}

			if (collections[i].equals("bbs")) {
				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.CATEGORY_GROUPBY, "FolderPath:1,2,3/SC");
			}

			// 카테고리 쿼리
			if (collections[i].equals("standard") || collections[i].equals("bbs")) {
				if (!value.getCateQuery().equals(""))
					wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.CATEGORY_QUERY,
							"FolderPath|" + value.getCateQuery());
			}

		}
		// System.out.println("현재VO " + value.toString());
		wnSearchInfo.search(value.getRealQuery(), isRealTimeKeyword, WNDefine.CONNECTION_CLOSE, useSuggestedQuery);

		String debugMsg = wnSearchInfo.printDebug() != null ? wnSearchInfo.printDebug().trim() : "";
		log.info("로그로그로그 " + debugMsg);

//		if (!value.getCollection().equals("ALL")) {
//			String paging = wnSearchInfo.getPageLinks(wnSearchInfo, 10, 10, 10);
//			value.setPaging(paging);
//		}

		return wnSearchInfo;
	}

}
