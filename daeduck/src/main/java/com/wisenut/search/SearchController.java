package com.wisenut.search;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wisenut.common.WNCollection;
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
import com.wisenut.service.ResultManagement;
import com.wisenut.service.ResultService;
import com.wisenut.service.SearchService;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/")
@Log
public class SearchController {

	private SearchService searchService;

	private List<ResultService> resultServices;

	private ResultManagement resultManageService;

	public SearchController(SearchService searchService, List<ResultService> resultServices,
			ResultManagement resultManageService) {
		this.searchService = searchService;
		this.resultServices = resultServices;
		this.resultManageService = resultManageService;
	}

	@RequestMapping(value = "/searchAll", method = { RequestMethod.GET, RequestMethod.POST })
	public String searchAll(@ModelAttribute SrchParamVO value, Model model,
			@RequestParam(defaultValue = "1") int depth) {
		Map<String, List<Map<String, Object>>> totalResult = new HashMap<>();
		Map<String, List<Map<String, Object>>> totalQualityResult = new HashMap<>();
		WNSearchInfo searchInfo = null;
		int totalCount = 0;
		Map<String, List<Map<String, String>>> cateStandardName = null;
		Map<String, List<Map<String, String>>> cateBbsName = null;
		try {
			// 전자결재, 게시판, 표준문서 통합검색 출력
			searchInfo = searchService.setting(value);
			for (int i = 0; i < resultServices.size(); i++) {
				totalResult.put(WNCollection.COLLECTIONS[i].toUpperCase(),
						resultServices.get(i).getViewResult(searchInfo, WNCollection.COLLECTIONS[i]));
			}

			// 품질관리 통합검색 출력
			for (int i = 4; i < WNCollection.COLLECTIONS.length; i++) {
				totalQualityResult.put(WNCollection.COLLECTIONS[i].toUpperCase(),
						resultManageService.getViewResult(searchInfo, WNCollection.COLLECTIONS[i]));
			}

			// log.info("품질관리 출력 " + totalQualityResult);

			// log.info("통합결과: " + totalResult.toString());

			// 1레벨 카테고리
			// cateStandardName = commonCategory(searchInfo, "standard", "FolderPath",
			// depth);
			// cateBbsName = commonCategory(searchInfo, "bbs", "FolderPath", depth);

			// log.info("카테고리 결과: "+cateStandardName);
			// log.info("카테고리 결과2 : "+cateBbsName);

			model.addAttribute("total", totalResult);
			model.addAttribute("value", value);

			model.addAttribute("totalQuality", totalQualityResult); // 품질관리 통합검색
			model.addAttribute("APPcount", searchInfo.getResultTotalCount("app")); // app 검색결과 건수
			model.addAttribute("BBScount", searchInfo.getResultTotalCount("bbs")); // bbs 검색 결과 건수
			model.addAttribute("STANDARDcount", searchInfo.getResultTotalCount("standard")); // standard 검색 결과 건수
			model.addAttribute("TECHNOLOGYcount", searchInfo.getResultTotalCount("technology")); // technology 검색결과 건수

			model.addAttribute("cateStandardName", cateStandardName);
			model.addAttribute("cateBbsName", cateBbsName);
			model.addAttribute("depth", depth);
			// 총 검색결과 건 수 구하기
			for (int i = 0; i < WNCollection.COLLECTIONS.length; i++) {
				totalCount += searchInfo.getResultTotalCount(WNCollection.COLLECTIONS[i]);
			}

			model.addAttribute("totalCount", totalCount);

			return "total";
		} catch (Exception e) {
			e.printStackTrace();
			return "home";
		}

		// wnsearch.closeServer();

	}

	@RequestMapping(value = "/search", method = { RequestMethod.GET, RequestMethod.POST })
	public String searchCollectionByName(@ModelAttribute SrchParamVO value, Model model,
			@RequestParam(defaultValue = "1") int depth) {
		WNSearchInfo searchInfo = null;
		List<Map<String, Object>> list = null;
		String paging = "";
		int collectionByCount;
		try {
			searchInfo = searchService.setting(value);

			for (int i = 0; i < resultServices.size(); i++) {
				if (value.getCollection().equals(WNCollection.COLLECTIONS[i])) { // 컬렉션 찾기
					list = resultServices.get(i).getViewResult(searchInfo, WNCollection.COLLECTIONS[i]); // 컬렉션 검색 결과
																											// 리스트
				}
			}
			// log.info("결과 " + list);

			// 컬렉션 별 카운트 얻기
			collectionByCount = searchInfo.getResultTotalCount(value.getCollection());

			log.info(value.getCollection() + " view 이동");
			model.addAttribute("value", value);
			model.addAttribute(value.getCollection(), list);
			model.addAttribute(value.getCollection().toUpperCase() + "count", collectionByCount);
			model.addAttribute("count", searchInfo.getResultCount(value.getCollection()) + value.getStartCount());

			if (searchInfo.getResultTotalCount(value.getCollection()) > searchInfo
					.getResultCount(value.getCollection())) {
				paging = searchInfo.getPageLinks(value.getStartCount(),
						searchInfo.getResultTotalCount(value.getCollection()), 10, 10);
			}

			model.addAttribute("paging", paging);

			return value.getCollection();
		} catch (Exception e) {
			e.printStackTrace();
			return "home";
		}

	}

	@RequestMapping(value = "/category", method = { RequestMethod.GET })
	@ResponseBody
	public ResponseEntity<Map<String, List<Map<String, String>>>> category(@ModelAttribute SrchParamVO value) {
		WNSearchInfo searchInfo = null;

		try {
			searchInfo = searchService.setting(value);
			int depth1GroupCount = searchInfo.getCategoryCount(value.getCollection(), value.getTarget(), 1);
			String cateName = null;
			Map<String, List<Map<String, String>>> cateResultMap = new HashMap<>();
			int catedepthCount = 0;
			int catedepth2Count = 0;
			int catedepth3Count = 0;
			int catedepth4Count = 0;
			List<Map<String, String>> list1 = new ArrayList<>();
			List<Map<String, String>> list2 = new ArrayList<>();
			List<Map<String, String>> list3 = new ArrayList<>();
			List<Map<String, String>> list4 = new ArrayList<>();
			String parent = "", parent2 = "", parent3 = "";
			for (int i = 0; i < depth1GroupCount; i++) {
				Map<String, String> map = new HashMap<>();
				cateName = searchInfo.getCategoryName(value.getCollection(), value.getTarget(), 1, i);
				catedepthCount = searchInfo.getDocumentCountInCategory(value.getCollection(), value.getTarget(), 1, i);
				if (cateName.equals("null"))
					continue;
				map.put("cateName", cateName);
				map.put("count", catedepthCount + "");
				parent = cateName;
				list1.add(map);

				catedepth2Count = searchInfo.getCategoryCount(value.getCollection(), value.getTarget(), 2);
				for (int j = 0; j < catedepth2Count; j++) {
					Map<String, String> map2 = new HashMap<>();
					String cate2Name = searchInfo.getCategoryName(value.getCollection(), value.getTarget(), 2, j);

					int cate2Count = searchInfo.getDocumentCountInCategory(value.getCollection(), value.getTarget(), 2,
							j);
//					if (cateName.equals(cate2Name.split(">")[0]) && i == 0) { // 첫번째 뎁스 중 에서 첫번째 카테고리와 같을 경우
//						map2.put("cateName1", cate2Name.substring(cate2Name.indexOf(">") + 1, cate2Name.length()));
//						map2.put("count1", cate2Count + "");
//
//						list2.add(map2);
//
//					} else if (cateName.equals(cate2Name.split(">")[0]) && i == 1) { // 첫번째 뎁스 중에서 두번째 카테고리와 같을 경우
//						map2.put("cateName2", cate2Name.substring(cate2Name.indexOf(">") + 1, cate2Name.length()));
//						map2.put("count2", cate2Count + "");
//
//						list2.add(map2);
//					}

					if (cateName.equals(cate2Name.split(">")[0])) {
						map2.put("cateName1", cate2Name.split(">")[1]);
						map2.put("count1", cate2Count + "");
						map2.put("parent", cate2Name.split(">")[0]);

						parent2 = cate2Name;
						list2.add(map2);

						catedepth3Count = searchInfo.getCategoryCount(value.getCollection(), value.getTarget(), 3);
						for (int k = 0; k < catedepth3Count; k++) {
							Map<String, String> map3 = new HashMap<>();
							String cate3Name = searchInfo.getCategoryName(value.getCollection(), value.getTarget(), 3,
									k);

							int cate3Count = searchInfo.getDocumentCountInCategory(value.getCollection(),
									value.getTarget(), 3, k);

							/**
							 * if(cate2Name.split(">")[1].equals(cate3Name.split(">")[1]) &&
							 * dept3flag++<=j){ map3.put("cateName"+j, cate3Name.split(">")[2]);
							 * map3.put("count"+j, cate3Count+""); map3.put("parent",
							 * cate2Name.split(">")[1]); list3.add(map3); }
							 **/

							if (cateName.equals(cate3Name.split(">")[0])
									&& cate2Name.split(">")[1].equals(cate3Name.split(">")[1])) {
								map3.put("cateName3", cate3Name.split(">")[2]);
								map3.put("count3", cate3Count + "");
								map3.put("parent", cate2Name.split(">")[1]);
								map3.put("parent2", cateName);

								parent3 = cate3Name;
								list3.add(map3);

								catedepth4Count = searchInfo.getCategoryCount(value.getCollection(), value.getTarget(),
										4);
								for (int l = 0; l < catedepth4Count; l++) {
									Map<String, String> map4 = new HashMap<>();
									String cate4Name = searchInfo.getCategoryName(value.getCollection(),
											value.getTarget(), 4, l);
									int cate4Count = searchInfo.getDocumentCountInCategory(value.getCollection(),
											value.getTarget(), 4, l);

									if (cateName.equals(cate4Name.split(">")[0])
											&& cate2Name.split(">")[1].equals(cate4Name.split(">")[1])
											&& cate3Name.split(">")[2].equals(cate4Name.split(">")[2])) {

										map4.put("cateName4", cate4Name.split(">")[3]);
										map4.put("count4", cate4Count + "");
										map4.put("parent", cate3Name.split(">")[2]);
										map4.put("parent2", cate2Name.split(">")[1]);
										map4.put("parent3", cateName);

										list4.add(map4);
									}
								}
								cateResultMap.put("dep4", list4);
							}
						}
						cateResultMap.put("dep3", list3);
					}
				}
				cateResultMap.put("dep2", list2);
			}
			cateResultMap.put("dep1", list1);
			return new ResponseEntity<>(cateResultMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
		}

	}

	@RequestMapping(value = "/colquality", method = { RequestMethod.GET, RequestMethod.POST })
	public String collectionQuality(@ModelAttribute SrchParamVO value, Model model, @RequestParam String colflag,
			@ModelAttribute QualityAnalysisDTO analysisDTO, @ModelAttribute QualityChangeDTO changeDTO,
			@ModelAttribute QualityEcnDTO ecnDTO, @ModelAttribute QualityLibrary1DTO library1DTO,
			@ModelAttribute QualityLibrary2DTO library2DTO, @ModelAttribute QualityMrbDTO mrbDTO,
			@ModelAttribute QualityOcapDTO ocapDTO, @ModelAttribute QualityPpapDTO ppapDTO,
			@ModelAttribute QualityRawDTO rawDTO) {
		WNSearchInfo searchInfo = null;
		Map<String, List<Map<String, Object>>> totalQualityResult = new HashMap<>();
		log.info("품질관리 파라미터 " + value);
		String paging = "";
		try {
			int collTarget = 0;

			switch (colflag) {
			case "0":
				searchInfo = searchService.settingbyQuality(value, mrbDTO);
				break;
			case "1":
				searchInfo = searchService.settingbyQuality(value, ppapDTO);
				break;
			case "2":
				searchInfo = searchService.settingbyQuality(value, ecnDTO);
				break;
			case "3":
				searchInfo = searchService.settingbyQuality(value, changeDTO);
				break;
			case "4":
				searchInfo = searchService.settingbyQuality(value, ocapDTO);
				break;
			case "5":
				searchInfo = searchService.settingbyQuality(value, analysisDTO);
				break;
			case "6":
				searchInfo = searchService.settingbyQuality(value, library1DTO);
				break;
			case "7":
				searchInfo = searchService.settingbyQuality(value, library2DTO);
				break;
			case "8":
				searchInfo = searchService.settingbyQuality(value, rawDTO);
				break;
			default:
				searchInfo = searchService.setting(value);
				break;
			}
			// searchInfo = searchService.settingbyQuality(value,ppapDTO);
			// 품질관리 통합검색 출력
			for (int index = 0; index < WNCollection.COLLECTIONS.length; index++) {
				if (WNCollection.COLLECTIONS[index].equals(value.getCollection()))
					collTarget = index;
			}
			totalQualityResult.put(WNCollection.COLLECTIONS[collTarget].toUpperCase(),
					resultManageService.getViewResult(searchInfo, WNCollection.COLLECTIONS[collTarget]));

			log.info("품질관리 별 검색하기 " + totalQualityResult);
			log.info("품질관리 플래그 " + colflag);

			model.addAttribute(value.getCollection().toUpperCase() + "count",
					searchInfo.getResultTotalCount(value.getCollection()));
			model.addAttribute("count", searchInfo.getResultCount(value.getCollection()) + value.getStartCount());

			if (searchInfo.getResultTotalCount(value.getCollection()) > searchInfo
					.getResultCount(value.getCollection())) {
				paging = searchInfo.getPageLinks(value.getStartCount(),
						searchInfo.getResultTotalCount(value.getCollection()), 10, 10);
			}

			model.addAttribute("value", value);
			model.addAttribute("colflag", colflag);
			model.addAttribute("totalQuality", totalQualityResult);
			model.addAttribute("paging", paging);
			return "quality";
		} catch (Exception e) {
			e.printStackTrace();
			return "home";
		}
	}

	public Map<String, List<Map<String, String>>> commonCategory(WNSearchInfo searchInfo, String collectionName,
			String categoryField, int depth) {
		int depth1GroupCount = searchInfo.getCategoryCount(collectionName, categoryField, depth);
		String cateName = null;
		Map<String, List<Map<String, String>>> cateResultMap = new HashMap<>();
		int catedepthCount = 0;
		int catedepth2Count = 0;
		List<Map<String, String>> list1 = new ArrayList<>();
		List<Map<String, String>> list2 = new ArrayList<>();
		for (int i = 0; i < depth1GroupCount; i++) {
			Map<String, String> map = new HashMap<>();
			cateName = searchInfo.getCategoryName(collectionName, "FolderPath", 1, i);
			catedepthCount = searchInfo.getDocumentCountInCategory(collectionName, "FolderPath", 1, i);
			map.put("cateName", cateName);
			map.put("count", catedepthCount + "");

			list1.add(map);

			catedepth2Count = searchInfo.getCategoryCount(collectionName, "FolderPath", 2);
			for (int j = 0; j < catedepth2Count; j++) {
				Map<String, String> map2 = new HashMap<>();
				String cate2Name = searchInfo.getCategoryName(collectionName, "FolderPath", 2, j);
				int cate2Count = searchInfo.getDocumentCountInCategory(collectionName, "FolderPath", 2, j);
				if (cateName.equals(cate2Name.split(">")[0]) && i == 0) {
					map2.put("cateName1", cate2Name.substring(cate2Name.indexOf(">") + 1, cate2Name.length()));
					map2.put("count1", cate2Count + "");

					list2.add(map2);

				} else if (cateName.equals(cate2Name.split(">")[0]) && i == 1) {
					map2.put("cateName2", cate2Name.substring(cate2Name.indexOf(">") + 1, cate2Name.length()));
					map2.put("count2", cate2Count + "");

					list2.add(map2);
				}

			}
			cateResultMap.put("dep2", list2);
		}
		cateResultMap.put("dep1", list1);

		return cateResultMap;
	}
}
