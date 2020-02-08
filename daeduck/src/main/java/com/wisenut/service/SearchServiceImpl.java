package com.wisenut.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Service;

import com.wisenut.common.WNCollection;
import com.wisenut.common.WNDefine;
import com.wisenut.common.WNSearch;
import com.wisenut.common.WNSearchInfo;
import com.wisenut.domain.QualityAnalysisDTO;
import com.wisenut.domain.QualityChangeDTO;
import com.wisenut.domain.QualityEcnDTO;
import com.wisenut.domain.QualityLibrary1DTO;
import com.wisenut.domain.QualityLibrary2DTO;
import com.wisenut.domain.QualityMrbDTO;
import com.wisenut.domain.QualityOcapDTO;
import com.wisenut.domain.QualityPpapDTO;
import com.wisenut.domain.QualityRawDTO;
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

//	private String auth = ""; // 전자결재용 권한 변수
//	private String bbsAuth = ""; // 통합게시판 권한 변수

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

		log.info("검색엔지 객체 " + wnSearchInfo == null ? "널이다" : "널이 아니다.");

		int viewResultCount = value.getListCount(); // 통합검색이 아닐 경우 보여주는 갯수

		if (value.getCollection().equals("ALL") || value.getCollection().equals(""))
			viewResultCount = value.getTotalViewCnt(); // 통합검색 일 경우 기본적으로 보여주는 갯수

		for (int i = 0; i < collections.length; i++) {

			wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.PAGE_INFO,
					value.getStartCount() + "," + viewResultCount);

			if (!value.getQuery().equals("")) {
				// wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.SORT_FIELD,
				// value.getSort() + "/DESC");
				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.SORT_FIELD, "DATE/DESC");
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
				} else { // 마지막 날짜가 있는 경우
					wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.DATE_RANGE,
							value.getStartDate().replaceAll("[.]", "/") + ","
									+ value.getEndDate().replaceAll("[.]", "/") + ",-");
				}
			}

			// 정렬 선택
//			if (!value.getSort().equals("")) {
//				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.SORT_FIELD, value.getSort() + "/DESC");
//			}

			// app 컬렉션 설정하는 부분
			if (collections[i].equals("app")) {
				String auth = "";
				if (!value.getTech().equals("")) { // 기술보고서(tech) 여부 파라미터가 있을 경우
					if (!value.getAuthority().equals("") || !value.getAuthorityapdept().equals("")) {
						auth += value.getAuthority() + "|" + value.getAuthorityapdept() + "|";
						wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.EXQUERY_FIELD,
								"<AUTHORITY:contains:" + auth + "> <TechnologyDOC:contains:" + value.getTech() + ">");
					} else {
						wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.EXQUERY_FIELD,
								"<TechnologyDOC:contains:" + value.getTech() + ">");
					}
				} else if (!value.getAuthority().equals("") || !value.getAuthorityapdept().equals("")) { // 기술보고서 여부
																											// 파라미터가 없을
																											// 경우
					auth += value.getAuthority() + "|" + value.getAuthorityapdept() + "|";
					wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.EXQUERY_FIELD,
							"<AUTHORITY:contains:" + auth + ">");
				}

				// 전자결재 정렬 셋팅
				if (!value.getSort().equals("")) {
					wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.SORT_FIELD, "DATE/DESC");
				} else {
					wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.SORT_FIELD, "DATE/DESC");
				}
				
				
				//전자결재 카테고리 설정
				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.CATEGORY_GROUPBY, "TYPE:1,2/SC");
				
				
				//전자결재 카테고리 쿼리 설정
				if (!value.getCateQuery().equals(""))
					wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.CATEGORY_QUERY,
							"TYPE|" + value.getCateQuery());

			}

			// 컬렉션 bbs 설정
			if (collections[i].equals("bbs")) {
				String bbsAuth = "";
				if (!value.getAuthorityex().equals("") || !value.getAuthoritydept().equals("")) {
					bbsAuth += value.getAuthorityex() + "|" + value.getAuthoritydept() + "|";
					wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.EXQUERY_FIELD,
							"<Authority1:contains:" + bbsAuth + ">");
					log.info("bbs 권한 설정!!>>>>" + "<Authority1:contains:" + bbsAuth + ">");
				}
//				else { // 권한 값이 없는 경우 결과를 보여주지 않는다.
//					wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.EXQUERY_FIELD,
//							"<Authority1:contains:" + "권한설정이 없는 필드입니다." + ">");
//				}
				// bbs 컬렉션 정렬 설정
				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.SORT_FIELD, "DATE/DESC");

				// 카테고리 그룹핑
				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.CATEGORY_GROUPBY, "FolderPath:1,2,3/SC");
			}

			// 전자결재 외 필터 쿼리 적용 및 전체 필터 쿼리 적용
//			if (!value.getAuthorityex().equals("") || !value.getAuthoritydept().equals("")) { // 이 두개의 파라미터는 반드시
//																								// 존재해야 하
//				auth += value.getAuthorityex() + "|" + value.getAuthoritydept();
//
//				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.EXQUERY_FIELD,
//						"<AUTHORITY:contains:" + auth + "> <TechnologyDOC:contains:" + value.getTech() + ">");
//			}

			// 표준문서 설정
			if (collections[i].equals("standard")) {
				String standardAuth = "";
				if (!value.getAuthorityex().equals("") || !value.getAuthoritydept().equals("")) {
					standardAuth += value.getAuthorityex() + "|" + value.getAuthoritydept() + "|";
					wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.EXQUERY_FIELD,
							"<Authority1:contains:" + standardAuth + ">");
					log.info("standard 권한 설정!!>>>>" + "<Authority1:contains:" + standardAuth + ">");
				}

				// 카테고리 그룹핑
				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.CATEGORY_GROUPBY, "FolderPath:1,2/SC");

				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.SORT_FIELD, "DATE/DESC");
			}
			
			
			

			// 기술문서 설정
			if (collections[i].equals("technology")) {
				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.EXQUERY_FIELD,
						"<TechnologyDOC:contains:Y>");
				
				//카테고리 설정
				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.CATEGORY_GROUPBY, "TECHNOLOGYPATH:1,2,3,4/SC");
				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.CATEGORY_QUERY, "TECHNOLOGYPATH|"+value.getCateQuery());
			}

//			if (collections[i].equals("bbs")) {
//				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.CATEGORY_GROUPBY, "FolderPath:1,2,3/SC");
//			}

			// 카테고리 쿼리
			if (collections[i].equals("standard") || collections[i].equals("bbs")) {
				if (!value.getCateQuery().equals(""))
					wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.CATEGORY_QUERY,
							"FolderPath|" + value.getCateQuery());
			}

			if (collections[i].equals("ecn")) {

			}

		}
		// System.out.println("현재VO " + value.toString());
		wnSearchInfo.search(value.getRealQuery(), isRealTimeKeyword, WNDefine.CONNECTION_CLOSE, useSuggestedQuery);

		String debugMsg = wnSearchInfo.printDebug() != null ? wnSearchInfo.printDebug().trim() : "";
		// log.info("로그로그로그 " + debugMsg);

//		if (!value.getCollection().equals("ALL")) {
//			String paging = wnSearchInfo.getPageLinks(wnSearchInfo, 10, 10, 10);
//			value.setPaging(paging);
//		}

		log.info("파라미터: " + value.toString());

//		if ( wnSearchInfo != null ) {
//			wnSearchInfo.closeServer();
//		}

		return wnSearchInfo;
	}

	@Override
	public WNSearchInfo settingbyQuality(SrchParamVO value, Object obj) throws Exception {
		// TODO Auto-generated method stub
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

		log.info("검색엔지 객체 " + wnSearchInfo == null ? "널이다" : "널이 아니다.");

		int viewResultCount = value.getListCount(); // 통합검색이 아닐 경우 보여주는 갯수

		if (value.getCollection().equals("ALL") || value.getCollection().equals(""))
			viewResultCount = value.getTotalViewCnt(); // 통합검색 일 경우 기본적으로 보여주는 갯수

		for (int i = 0; i < collections.length; i++) {

			wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.PAGE_INFO,
					value.getStartCount() + "," + viewResultCount);

			if (!value.getQuery().equals("")) {
				// wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.SORT_FIELD,
				// value.getSort() + "/DESC");
				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.SORT_FIELD, "DATE/DESC");
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

//						wnSearchInfo.setCollectionInfoValue(collections[i],WNDefine.BOOST_QUERY,"");
//						wnSearchInfo.setCollectionInfoValue(collections[i],WNDefine.RANKING_OPTION,"");
			}

			// 날짜 설정
			if (!value.getStartDate().equals("")) {
				if (value.getEndDate().equals("")) { // endDate가 없으면 오늘날짜 기준까지 검색
					wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.DATE_RANGE,
							value.getStartDate().replaceAll("[.]", "/") + "," + format.format(date) + ",-");
					// System.out.println(value.getStartDate() + ","+format.format(date)+",-");
				} else { // 마지막 날짜가 있는 경우
					wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.DATE_RANGE,
							value.getStartDate().replaceAll("[.]", "/") + ","
									+ value.getEndDate().replaceAll("[.]", "/") + ",-");
				}
			}

			// 정렬 선택
//					if (!value.getSort().equals("")) {
//						wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.SORT_FIELD, value.getSort() + "/DESC");
//					}

			// app 컬렉션 설정하는 부분
			if (collections[i].equals("app")) {
				String auth = "";
				if (!value.getTech().equals("")) { // 기술보고서(tech) 여부 파라미터가 있을 경우
					if (!value.getAuthority().equals("") || !value.getAuthorityapdept().equals("")) {
						auth += value.getAuthority() + "|" + value.getAuthorityapdept() + "|";
						wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.EXQUERY_FIELD,
								"<AUTHORITY:contains:" + auth + "> <TechnologyDOC:contains:" + value.getTech() + ">");
					} else {
						wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.EXQUERY_FIELD,
								"<TechnologyDOC:contains:" + value.getTech() + ">");
					}
				} else if (!value.getAuthority().equals("") || !value.getAuthorityapdept().equals("")) { // 기술보고서 여부
																											// 파라미터가 없을
																											// 경우
					auth += value.getAuthority() + "|" + value.getAuthorityapdept() + "|";
					wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.EXQUERY_FIELD,
							"<AUTHORITY:contains:" + auth + ">");
				}

				// 전자결재 정렬 셋팅
				if (!value.getSort().equals("")) {
					wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.SORT_FIELD, "DATE/DESC");
				} else {
					wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.SORT_FIELD, "DATE/DESC");
				}

			}

			// 컬렉션 bbs 설정
			if (collections[i].equals("bbs")) {
				String bbsAuth = "";
				if (!value.getAuthorityex().equals("") || !value.getAuthoritydept().equals("")) {
					bbsAuth += value.getAuthorityex() + "|" + value.getAuthoritydept() + "|";
					wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.EXQUERY_FIELD,
							"<Authority1:contains:" + bbsAuth + ">");
				}

				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.SORT_FIELD, "DATE/DESC");

				// 카테고리 그룹핑
				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.CATEGORY_GROUPBY, "FolderPath:1,2,3/SC");
			}

			// 전자결재 외 필터 쿼리 적용 및 전체 필터 쿼리 적용
//					if (!value.getAuthorityex().equals("") || !value.getAuthoritydept().equals("")) { // 이 두개의 파라미터는 반드시
//																										// 존재해야 하
//						auth += value.getAuthorityex() + "|" + value.getAuthoritydept();
			//
//						wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.EXQUERY_FIELD,
//								"<AUTHORITY:contains:" + auth + "> <TechnologyDOC:contains:" + value.getTech() + ">");
//					}

			// 표준문서 설정
			if (collections[i].equals("standard")) {

				// 카테고리 그룹핑
				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.CATEGORY_GROUPBY, "FolderPath:1,2/SC");

				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.SORT_FIELD, "DATE/DESC");
			}

			// 기술문서 설정
			if (collections[i].equals("technology")) {
				wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.EXQUERY_FIELD,
						"<TechnologyDOC:contains:Y>");
			}

//					if (collections[i].equals("bbs")) {
//						wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.CATEGORY_GROUPBY, "FolderPath:1,2,3/SC");
//					}

			// 카테고리 쿼리
			if (collections[i].equals("standard") || collections[i].equals("bbs")) {
				if (!value.getCateQuery().equals(""))
					wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.CATEGORY_QUERY,
							"FolderPath|" + value.getCateQuery());
			}

			if (collections[i].equals("mrb")) { // mrb 컬렉션일 경우
				String mrbCollectionQuery = "";

				if (obj instanceof QualityMrbDTO) { // mbr 상세검색 객체일 경우
					QualityMrbDTO mrbDTO = (QualityMrbDTO) obj;

					// 상세 검색 변수가 하나라도 있을 경우
					if (!mrbDTO.getBiz_place().equals("") || !mrbDTO.getFactory_gubun().equals("")
							|| !mrbDTO.getRole_out().equals("") || !mrbDTO.getCol_time_start().equals("")
							|| !mrbDTO.getCol_time_end().equals("")) {
						if (!mrbDTO.getBiz_place().equals("")) {
							mrbCollectionQuery += "<FACTORY_ID:contains:" + mrbDTO.getBiz_place() + ">|";
						}
						if (!mrbDTO.getFactory_gubun().equals("")) {
							mrbCollectionQuery += "<FACTORY_GUBUN:contains:" + mrbDTO.getFactory_gubun() + ">|";
						}
						if (!mrbDTO.getRole_out().equals("")) {
							mrbCollectionQuery += "<RULE_OUT:contains:" + mrbDTO.getRole_out() + ">|";
						}

						if (!mrbDTO.getCol_time_start().equals("") && !mrbDTO.getCol_time_end().equals("")) {
							log.info("MRB 날짜 상세 설정>>>>>>" + "<COL_TIME:gte:" + mrbDTO.getCol_time_start()
									+ "> <COL_TIME:lte:" + mrbDTO.getCol_time_end() + ">");
							wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.FILTER_OPERATION,
									"<COL_TIME:gte:" + mrbDTO.getCol_time_start() + "> <COL_TIME:lte:"
											+ mrbDTO.getCol_time_end() + ">");
						}

						log.info("MRB 상세검색 설정>>>>>>" + mrbCollectionQuery);
						wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.COLLECTION_QUERY,
								mrbCollectionQuery);

					}

				}
			}

			if (collections[i].equals("ppap")) {
				String ppapCollectionQuery = "";
				if (obj instanceof QualityPpapDTO) {
					QualityPpapDTO ppapDTO = (QualityPpapDTO) obj;
					if (!ppapDTO.getBiz_place().equals("") || !ppapDTO.getInitiator_name().equals("")
							|| !ppapDTO.getPpap_no().equals("") || !ppapDTO.getStep_level_pre().equals("")
							|| !ppapDTO.getTitle_pre().equals("") || !ppapDTO.getStep1_startDate().equals("")
							|| !ppapDTO.getStep1_endDate().equals("") || !ppapDTO.getStep6_startDate().equals("")
							|| !ppapDTO.getStep6_endDate().equals("")) {

						if (!ppapDTO.getBiz_place().equals("")) {
							ppapCollectionQuery += "<BIZ_PLACE:contains:" + ppapDTO.getBiz_place() + ">|";
						}
						if (!ppapDTO.getInitiator_name().equals("")) {
							ppapCollectionQuery += "<INITIATOR_NAME:contains:" + ppapDTO.getInitiator_name() + ">|";
						}
						if (!ppapDTO.getPpap_no().equals("")) {
							ppapCollectionQuery += "<PPAP_NO:contains:" + ppapDTO.getPpap_no() + ">|";
						}
						if (!ppapDTO.getStep_level_pre().equals("")) {
							ppapCollectionQuery += "<STEP_LEVEL:contains:" + ppapDTO.getStep_level_pre() + ">|";
						}
						if (!ppapDTO.getTitle_pre().equals("")) {
							ppapCollectionQuery += "<SUBJECT :contains:" + ppapDTO.getTitle_pre() + ">|";
						}
						
						
						String step1_filter;
						String step6_filter;
						if(!ppapDTO.getStep1_startDate().equals("") && !ppapDTO.getStep1_endDate().equals("")) {
							step1_filter = "<STEP1_ENDDATE:gte:"+ppapDTO.getStep1_startDate()+"> <STEP1_ENDDATE:lte:"+ppapDTO.getStep1_endDate()+">";
							wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.FILTER_OPERATION, step1_filter);
						}
						if(!ppapDTO.getStep6_startDate().equals("") && !ppapDTO.getStep6_endDate().equals("")) {
							step6_filter = "<STEP6_ENDDATE:gte:"+ppapDTO.getStep6_startDate()+"> <STEP6_ENDDATE:lte:"+ppapDTO.getStep6_endDate()+">";
							wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.FILTER_OPERATION, step6_filter);
						}
						if(!ppapDTO.getStep1_startDate().equals("") && !ppapDTO.getStep1_endDate().equals("")
								&& !ppapDTO.getStep6_startDate().equals("") && !ppapDTO.getStep6_endDate().equals("")){
							step1_filter = "(<STEP1_ENDDATE:gte:"+ppapDTO.getStep1_startDate()+"> <STEP1_ENDDATE:lte:"+ppapDTO.getStep1_endDate()+">)";
							step6_filter = "(<STEP6_ENDDATE:gte:"+ppapDTO.getStep6_startDate()+"> <STEP6_ENDDATE:lte:"+ppapDTO.getStep6_endDate()+">)";
							wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.FILTER_OPERATION, step1_filter+"|"+step6_filter);
						}
						

						log.info("PPAP 상세검색 설정>>>>>>" + ppapCollectionQuery);
						wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.COLLECTION_QUERY,
								ppapCollectionQuery);

					}
				}
			}

			// ECN 컬렉션 설정
			if (collections[i].equals("ecn")) {
				String ecnCollectionQuery = "";
				if (obj instanceof QualityEcnDTO) {
					QualityEcnDTO ecnDTO = (QualityEcnDTO) obj;

					if (ecnDTO.getFactory_id() != null || ecnDTO.getGrade() != null || ecnDTO.getGrade_class() != null
							|| !ecnDTO.getInitiator_name().equals("") || ecnDTO.getOwn_outsourced() != null
							|| !ecnDTO.getStep1_startDate().equals("") || !ecnDTO.getStep1_endDate().equals("")
							|| !ecnDTO.getStep6_startDate().equals("") || !ecnDTO.getStep6_endDate().equals("")
							|| !ecnDTO.getStep7_startDate().equals("") || !ecnDTO.getStep7_endDate().equals("")) {

						if (ecnDTO.getFactory_id() != null) {
							String val = "";
							for (String var : ecnDTO.getFactory_id()) {
								val += var + "|";
							}
							ecnCollectionQuery += "<FACTORY_ID:contains:" + val + ">|";
						}
						if (ecnDTO.getGrade() != null) {
							String val = "";
							for (String var : ecnDTO.getGrade()) {
								val += var + "|";
							}
							ecnCollectionQuery += "<GRADE:contains:" + val + ">|";
						}
						if (ecnDTO.getGrade_class() != null) {
							String val = "";
							for (String var : ecnDTO.getGrade_class()) {
								val += var + "|";
							}
							ecnCollectionQuery += "<GRADE_CLASS:contains:" + val + ">|";
						}
						if (!ecnDTO.getInitiator_name().equals("")) {
							ecnCollectionQuery += "<INITIATOR_NAME:contains:" + ecnDTO.getInitiator_name() + ">|";
						}
						if (ecnDTO.getOwn_outsourced() != null) {
							String val = "";
							for (String var : ecnDTO.getOwn_outsourced()) {
								val += var + "|";
							}
							ecnCollectionQuery += "<OWN_OUTSOURCED:contains:" + val + ">|";
						}
						
						
						
						String step1_filter;
						String step6_filter;
						String step7_filter;
						if(!ecnDTO.getStep1_startDate().equals("") && !ecnDTO.getStep1_endDate().equals("")) {
							step1_filter = "<STEP1_ENDDATE:gte:"+ecnDTO.getStep1_startDate()+"> <STEP1_ENDDATE:lte:"+ecnDTO.getStep1_endDate()+">";
							wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.FILTER_OPERATION, step1_filter);
						}
						if(!ecnDTO.getStep6_startDate().equals("") && !ecnDTO.getStep6_endDate().equals("")) {
							step6_filter = "<STEP6_ENDDATE:gte:"+ecnDTO.getStep6_startDate()+"> <STEP6_ENDDATE:lte:"+ecnDTO.getStep6_endDate()+">";
							wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.FILTER_OPERATION, step6_filter);
						}
						if(!ecnDTO.getStep7_startDate().equals("") && !ecnDTO.getStep7_endDate().equals("")) {
							step7_filter = "<STEP6_ENDDATE:gte:"+ecnDTO.getStep7_startDate()+"> <STEP6_ENDDATE:lte:"+ecnDTO.getStep7_endDate()+">";
							wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.FILTER_OPERATION, step7_filter);
						}
						
						// step1 && step7
						
						// step1 && step6
						if(!ecnDTO.getStep1_startDate().equals("") && !ecnDTO.getStep1_endDate().equals("")
								&& !ecnDTO.getStep6_startDate().equals("") && !ecnDTO.getStep6_endDate().equals("")){
							step1_filter = "(<STEP1_ENDDATE:gte:"+ecnDTO.getStep1_startDate()+"> <STEP1_ENDDATE:lte:"+ecnDTO.getStep1_endDate()+">)";
							step6_filter = "(<STEP6_ENDDATE:gte:"+ecnDTO.getStep6_startDate()+"> <STEP6_ENDDATE:lte:"+ecnDTO.getStep6_endDate()+">)";
							wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.FILTER_OPERATION, step1_filter+"|"+step6_filter);
						}
						
						// step6 && step7
						if(!ecnDTO.getStep6_startDate().equals("") && !ecnDTO.getStep6_endDate().equals("")
								&& !ecnDTO.getStep7_startDate().equals("") && !ecnDTO.getStep7_endDate().equals("")){
							step6_filter = "(<STEP6_ENDDATE:gte:"+ecnDTO.getStep1_startDate()+"> <STEP6_ENDDATE:lte:"+ecnDTO.getStep6_endDate()+">)";
							step7_filter = "(<STEP7_ENDDATE:gte:"+ecnDTO.getStep6_startDate()+"> <STEP7_ENDDATE:lte:"+ecnDTO.getStep7_endDate()+">)";
							wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.FILTER_OPERATION, step6_filter+"|"+step7_filter);
						}
						
						// step6 && step7
						if(!ecnDTO.getStep1_startDate().equals("") && !ecnDTO.getStep1_endDate().equals("")
								&& !ecnDTO.getStep7_startDate().equals("") && !ecnDTO.getStep7_endDate().equals("")){
							step1_filter = "(<STEP1_ENDDATE:gte:"+ecnDTO.getStep1_startDate()+"> <STEP1_ENDDATE:lte:"+ecnDTO.getStep1_endDate()+">)";
							step7_filter = "(<STEP7_ENDDATE:gte:"+ecnDTO.getStep7_startDate()+"> <STEP7_ENDDATE:lte:"+ecnDTO.getStep7_endDate()+">)";
							wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.FILTER_OPERATION, step1_filter+"|"+step7_filter);
						}
						
						// step1 && step6 && step7
						if(!ecnDTO.getStep1_startDate().equals("") && !ecnDTO.getStep1_endDate().equals("")
								&& !ecnDTO.getStep6_startDate().equals("") && !ecnDTO.getStep6_endDate().equals("")
								&& !ecnDTO.getStep7_startDate().equals("") && !ecnDTO.getStep7_endDate().equals("")){
							step1_filter = "(<STEP1_ENDDATE:gte:"+ecnDTO.getStep1_startDate()+"> <STEP1_ENDDATE:lte:"+ecnDTO.getStep1_endDate()+">)";
							step6_filter = "(<STEP6_ENDDATE:gte:"+ecnDTO.getStep6_startDate()+"> <STEP6_ENDDATE:lte:"+ecnDTO.getStep6_endDate()+">)";
							step7_filter = "(<STEP7_ENDDATE:gte:"+ecnDTO.getStep7_startDate()+"> <STEP7_ENDDATE:lte:"+ecnDTO.getStep7_endDate()+">)";
							wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.FILTER_OPERATION, step1_filter+"|"+step6_filter+"|"+step7_filter);
						}

						wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.COLLECTION_QUERY,
								ecnCollectionQuery);
						log.info("ECN 상세검색 설정>>>>>>" + ecnCollectionQuery);
					}
				}
			}

			// change 컬렉션 설정
			if (collections[i].equals("change")) {
				String changeCollectionQuery = "";
				if (obj instanceof QualityChangeDTO) {
					QualityChangeDTO changeDTO = (QualityChangeDTO) obj;

					if (!changeDTO.getFault_name().equals("") || changeDTO.getBiz_place() != null
							|| !changeDTO.getSubject().equals("") || changeDTO.getGrade() != null
							|| !changeDTO.getInitiator_name().equals("") || !changeDTO.getRec_step1_name().equals("")
							|| !changeDTO.getCs_quality_name().equals("") || changeDTO.getSimsa_gubun() != null
							|| changeDTO.getMain_route_name() != null || changeDTO.getStatus() != null
							|| !changeDTO.getStep2_startDate().equals("") || !changeDTO.getStep2_endDate().equals("")
							|| !changeDTO.getStep4_startDate().equals("") || !changeDTO.getStep4_endDate().equals("")) { // first if
																											// start

						if (!changeDTO.getFault_name().equals("")) {
							changeCollectionQuery += "<FAULT_NAME:contains:" + changeDTO.getFault_name() + ">|";
						}
						if (changeDTO.getBiz_place() != null) {
							String val = "";
							for (String var : changeDTO.getBiz_place()) {
								val += var + "|";
							}
							changeCollectionQuery += "<BIZ_PLACE:contains:" + val + ">|";
						}
						if (!changeDTO.getSubject().equals("")) {
							changeCollectionQuery += "<SUBJECT:contains:" + changeDTO.getSubject() + ">|";
						}
						if (changeDTO.getGrade() != null) {
							String val = "";
							for (String var : changeDTO.getGrade()) {
								val += var + "|";
							}
							changeCollectionQuery += "<GRADE:contains:" + val + ">|";
						}
						if (!changeDTO.getInitiator_name().equals("")) {
							changeCollectionQuery += "<INITIATOR_NAME:contains:" + changeDTO.getInitiator_name() + ">|";
						}
						if (!changeDTO.getRec_step1_name().equals("")) {
							changeCollectionQuery += "<REC_STEP1_NAME:contains:" + changeDTO.getRec_quality_name()
									+ ">|";
						}
						if (!changeDTO.getCs_quality_name().equals("")) {
							changeCollectionQuery += "<CS_QUALITY_NAME:contains:" + changeDTO.getCs_quality_name()
									+ ">|";
						}
						if (changeDTO.getSimsa_gubun() != null) {
							String val = "";
							for (String var : changeDTO.getSimsa_gubun()) {
								val += var + "|";
							}
							changeCollectionQuery += "<SIMSA_GUBUN:contains:" + val + ">|";
						}
						if (changeDTO.getMain_route_name() != null) {
							String val = "";
							for (String var : changeDTO.getMain_route_name()) {
								val += var + "|";
							}
							changeCollectionQuery += "<MAIN_ROUTE_NAME:contains:" + val + ">|";
						}
						if (changeDTO.getStatus() != null) {
							String val = "";
							for (String var : changeDTO.getStatus()) {
								val += var + "|";
							}
							changeCollectionQuery += "<STATUS:contains:" + val + ">|";
						}
						
						
						String step2_filter;
						String step4_filter;
						if(!changeDTO.getStep2_startDate().equals("") && !changeDTO.getStep2_endDate().equals("")) {
							step2_filter = "<STEP2_ENDDATE:gte:"+changeDTO.getStep2_startDate()+"> <STEP2_ENDDATE:lte:"+changeDTO.getStep2_endDate()+">";
							wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.FILTER_OPERATION, step2_filter);
						}
						if(!changeDTO.getStep4_startDate().equals("") && !changeDTO.getStep4_endDate().equals("")) {
							step4_filter = "<STEP4_ENDDATE:gte:"+changeDTO.getStep4_startDate()+"> <STEP4_ENDDATE:lte:"+changeDTO.getStep4_endDate()+">";
							wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.FILTER_OPERATION, step4_filter);
						}
						if(!changeDTO.getStep2_startDate().equals("") && !changeDTO.getStep2_endDate().equals("")
								&& !changeDTO.getStep4_startDate().equals("") && !changeDTO.getStep4_endDate().equals("")){
							step2_filter = "(<STEP2_ENDDATE:gte:"+changeDTO.getStep2_startDate()+"> <STEP2_ENDDATE:lte:"+changeDTO.getStep2_endDate()+">)";
							step4_filter = "(<STEP4_ENDDATE:gte:"+changeDTO.getStep4_startDate()+"> <STEP4_ENDDATE:lte:"+changeDTO.getStep4_endDate()+">)";
							wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.FILTER_OPERATION, step2_filter+"|"+step4_filter);
						}
						
						log.info("change 상세검색 설정>>>>>>" + changeCollectionQuery);
						wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.COLLECTION_QUERY,
								changeCollectionQuery);
					} // first if end
				}
			}

			// OCAP 컬렉션 설정
			if (collections[i].equals("ocap")) {
				String ocapCollectionQuery = "";
				if (obj instanceof QualityOcapDTO) {
					QualityOcapDTO ocapDTO = (QualityOcapDTO) obj;
					if (!ocapDTO.getOcap_detail().equals("") && !ocapDTO.getOcap_search().equals("")) {
						ocapCollectionQuery = "<" + ocapDTO.getOcap_detail().toUpperCase() + ":contains:"
								+ ocapDTO.getOcap_search() + ">";
						wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.COLLECTION_QUERY,
								ocapCollectionQuery);
					}
				}
				log.info("ocap 상세검색 설정>>>>>>" + ocapCollectionQuery);
			}

			// analysis 컬렉션 설정
			if (collections[i].equals("analysis")) {
				String analysisCollectionQuery = "";
				if (obj instanceof QualityAnalysisDTO) {
					QualityAnalysisDTO analysisDTO = (QualityAnalysisDTO) obj;
					if (!analysisDTO.getInitiator_name().equals("") || !analysisDTO.getManager_name().equals("")
							|| !analysisDTO.getSubject().equals("")
							|| !analysisDTO.getRecompl_startDate().equals("") || !analysisDTO.getRecompl_endDate().equals("")
							|| !analysisDTO.getStep1_startDate().equals("") || !analysisDTO.getStep1_endDate().equals("")) {

						if (!analysisDTO.getInitiator_name().equals("")) {
							analysisCollectionQuery += "<INITIATOR_NAME:contains:" + analysisDTO.getInitiator_name()
									+ ">|";
						}
						if (!analysisDTO.getManager_name().equals("")) {
							analysisCollectionQuery += "<MANAGER_NAME:contains:" + analysisDTO.getManager_name() + ">|";
						}
						if (!analysisDTO.getSubject().equals("")) {
							analysisCollectionQuery += "<SUBJECT:contains:" + analysisDTO.getSubject() + ">|";
						}
						
						
						String recompl_filter;
						String step1_filter;
						if(!analysisDTO.getRecompl_startDate().equals("") && !analysisDTO.getRecompl_endDate().equals("")) {
							recompl_filter = "<STEP2_ENDDATE:gte:"+analysisDTO.getRecompl_startDate()+"> <STEP2_ENDDATE:lte:"+analysisDTO.getRecompl_endDate()+">";
							wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.FILTER_OPERATION, recompl_filter);
						}
						if(!analysisDTO.getStep1_startDate().equals("") && !analysisDTO.getStep1_endDate().equals("")) {
							step1_filter = "<STEP1_ENDDATE:gte:"+analysisDTO.getStep1_startDate()+"> <STEP1_ENDDATE:lte:"+analysisDTO.getStep1_endDate()+">";
							wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.FILTER_OPERATION, step1_filter);
						}
						if(!analysisDTO.getRecompl_startDate().equals("") && !analysisDTO.getRecompl_endDate().equals("")
								&& !analysisDTO.getStep1_startDate().equals("") && !analysisDTO.getStep1_endDate().equals("")){
							recompl_filter = "(<STEP2_ENDDATE:gte:"+analysisDTO.getRecompl_startDate()+"> <STEP2_ENDDATE:lte:"+analysisDTO.getRecompl_endDate()+">)";
							step1_filter = "(<STEP1_ENDDATE:gte:"+analysisDTO.getStep1_startDate()+"> <STEP1_ENDDATE:lte:"+analysisDTO.getStep1_endDate()+">)";
							wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.FILTER_OPERATION, recompl_filter+"|"+step1_filter);
						}
						
						
						wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.COLLECTION_QUERY,
								analysisCollectionQuery);
					}
				}
				log.info("analysis 상세검색 설정>>>>>>" + analysisCollectionQuery);
			}

			// library1 컬렉션 설정
			if (collections[i].equals("library1")) {
				String library1CollectoionQuery = "";
				if (obj instanceof QualityLibrary1DTO) {
					QualityLibrary1DTO lib1DTO = (QualityLibrary1DTO) obj;

					if (lib1DTO.getEds() != null || !lib1DTO.getEntry_no().equals("")
							|| !lib1DTO.getForeigncolor().equals("") || !lib1DTO.getFtir_result().equals("")
							|| !lib1DTO.getPlant().equals("") || !lib1DTO.getProcessname().equals("")) {

						if (lib1DTO.getEds() != null) {
							String val = "";
							for (String var : lib1DTO.getEds()) {
								val += var + "|";
							}
							library1CollectoionQuery += "<EDS:contains:" + val + ">";
						}

						if (!lib1DTO.getEntry_no().equals("")) {
							library1CollectoionQuery += "<EntryNo:contains:" + lib1DTO.getEntry_no() + ">|";
						}
						if (!lib1DTO.getForeigncolor().equals("")) {
							library1CollectoionQuery += "<ForeignColor:contains:" + lib1DTO.getForeigncolor() + ">|";
						}
						if (!lib1DTO.getFtir_result().equals("")) {
							library1CollectoionQuery += "<FTIR_Result:contains:" + lib1DTO.getFtir_result() + ">|";
						}
						if (!lib1DTO.getPlant().equals("")) {
							library1CollectoionQuery += "<Plant:contains:" + lib1DTO.getPlant() + ">|";
						}
						if (!lib1DTO.getProcessname().equals("")) {
							library1CollectoionQuery += "<ProcessName:contains:" + lib1DTO.getProcessname() + ">|";
						}
						log.info("library1 상세검색 설정>>>>>>" + library1CollectoionQuery);
						wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.COLLECTION_QUERY,
								library1CollectoionQuery);
					}
				}
			}

			// library2 설정
			// library1 컬렉션 설정
			if (collections[i].equals("library2")) {
				String library2CollectoionQuery = "";
				if (obj instanceof QualityLibrary2DTO) {
					QualityLibrary2DTO lib2DTO = (QualityLibrary2DTO) obj;

					if (lib2DTO.getEds() != null || !lib2DTO.getEntry_no().equals("") || !lib2DTO.getColor().equals("")
							|| !lib2DTO.getFtir_result().equals("") || !lib2DTO.getPlant().equals("")
							|| !lib2DTO.getProcessname().equals("")) {

						if (lib2DTO.getEds() != null) {
							String val = "";
							for (String var : lib2DTO.getEds()) {
								val += var + "|";
							}
							library2CollectoionQuery += "<EDS:contains:" + val + ">";
						}

						if (!lib2DTO.getEntry_no().equals("")) {
							library2CollectoionQuery += "<EntryNo:contains:" + lib2DTO.getEntry_no() + ">|";
						}
						if (!lib2DTO.getColor().equals("")) {
							library2CollectoionQuery += "<ForeignColor:contains:" + lib2DTO.getColor() + ">|";
						}
						if (!lib2DTO.getFtir_result().equals("")) {
							library2CollectoionQuery += "<FTIR_Result:contains:" + lib2DTO.getFtir_result() + ">|";
						}
						if (!lib2DTO.getPlant().equals("")) {
							library2CollectoionQuery += "<Plant:contains:" + lib2DTO.getPlant() + ">|";
						}
						if (!lib2DTO.getProcessname().equals("")) {
							library2CollectoionQuery += "<ProcessName:contains:" + lib2DTO.getProcessname() + ">|";
						}
						log.info("library2 상세검색 설정>>>>>>" + library2CollectoionQuery);
						wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.COLLECTION_QUERY,
								library2CollectoionQuery);
					}
				}
			}

			// raw 컬렉션 설정
			if (collections[i].equals("raw")) {
				String rawCollectionQuery = "";
				if (obj instanceof QualityRawDTO) {
					QualityRawDTO rawDTO = (QualityRawDTO) obj;

					if (!rawDTO.getDisplayName().equals("") || !rawDTO.getManufacturer().equals("")
							|| !rawDTO.getMaterialsname().equals("") || !rawDTO.getMaterialstype().equals("")
							|| !rawDTO.getSubject().equals("")) {

						if (!rawDTO.getDisplayName().equals("")) {
							rawCollectionQuery += "<DisplayName:contains:" + rawDTO.getDisplayName() + ">";
						}
						if (!rawDTO.getManufacturer().equals("")) {
							rawCollectionQuery += "<Manufacturer:contains:" + rawDTO.getManufacturer() + ">";
						}
						if (!rawDTO.getMaterialsname().equals("")) {
							rawCollectionQuery += "<MaterialsName:contains:" + rawDTO.getMaterialsname() + ">";
						}
						if (!rawDTO.getMaterialstype().equals("")) {
							rawCollectionQuery += "<MaterialsType:contains:" + rawDTO.getMaterialstype() + ">";
						}
						if (!rawDTO.getSubject().equals("")) {
							rawCollectionQuery += "<SUBJECT:contains:" + rawDTO.getSubject() + ">";
						}
						log.info("raw 상세검색 설정>>>>>>" + rawCollectionQuery);
						wnSearchInfo.setCollectionInfoValue(collections[i], WNDefine.COLLECTION_QUERY,
								rawCollectionQuery);

					}
				}
			}
		}
		// System.out.println("현재VO " + value.toString());
		wnSearchInfo.search(value.getRealQuery(), isRealTimeKeyword, WNDefine.CONNECTION_CLOSE, useSuggestedQuery);

		String debugMsg = wnSearchInfo.printDebug() != null ? wnSearchInfo.printDebug().trim() : "";
		// log.info("로그로그로그 " + debugMsg);

//				if (!value.getCollection().equals("ALL")) {
//					String paging = wnSearchInfo.getPageLinks(wnSearchInfo, 10, 10, 10);
//					value.setPaging(paging);
//				}

		log.info("파라미터: " + value.toString());
		log.info("파라미터2: " + obj.toString());

//				if ( wnSearchInfo != null ) {
//					wnSearchInfo.closeServer();
//				}

		return wnSearchInfo;
	}

}
