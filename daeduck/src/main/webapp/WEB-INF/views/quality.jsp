<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>


<html>

<head>
    <title>품질관리 페이지</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta content="IE=Edge" http-equiv="X-UA-Compatible" />
    <meta name="viewport"
        content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>대덕전자 전자결재</title>


    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/jquery-ui.min.js"></script>
    <script src="/resources/js/beta.fix.js"></script>
    <%-- <script src="/resources/js/ark.js"></script> --%>
    <script src="/resources/js/autocomplete.js"></script>
    <script src="/resources/js/category.js"></script>
    <script src="/resources/js/search.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.2/handlebars.js"></script>
    <script src="/resources/js/popular.js"></script>
	<script src="/resources/js/recommend.js"></script>


    <link rel="stylesheet" type="text/css" href="/resources/css/search_sty.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/default.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/popular.css" />
</head>

<body>
    <div class="wrapper">
        <div class="wrap">

            <div class="header_wrap">
                <!--header -->
                <%@ include file="./searchbox/searchbox.jsp"%>
            </div>
        </div>
        <!-- //header_wrap-->

        <!-- container_wrap -->
        <div class="container_wrap">
            <!-- container -->
            <div class="container">
                <!-- leftArea -->
                <div class="leftArea">
                    <%@ include file="./sidenav/sidenav.jsp"%>
                </div>
                <!--//leftArea-->


                <!-- contents -->
                <div class="contents">
                    <div class="result_top">
                        검색어 <strong>${value.query}</strong>에 대한 통합검색 결과 입니다.
                    </div>
                    <!-- 품질관리 -->
                    <c:choose>
                        <c:when test="${colflag eq '0'}">
                            <div class="sectit01">
                                <h2>
                                    <span>DRM/MRB</span><span>${MRBcount}</span>
                                </h2>
                                <c:forEach var="entry" items="${totalQuality.MRB}">
                                    <dl class="resultsty">
                                        <dt>
                                            <a href="#"
                                                onClick="javascript:popupOpen('https://gw.portal.daeduck.com/Website/Approval/Forms/Form.aspx?mode=COMPLETE&piid=${entry.DOCID }','전자결재','width=950','')">
                                                ${entry.SUBJECT }
                                            </a>
                                        <dt>문서번호작업장 :</dt>
                                        <dl>${entry.FACTORY_ID }</dl>
                                        <dt>제목 :</dt>
                                        <dl>${entry.SUBJECT }</dl>
                                        <dt>DRB/MRB :</dt>
                                        <dl>${entry.FOLDER_NAME}</dl>
                                        <dt>공정 :</dt>
                                        <dl>${entry.DOC_TYPE }</dl>
                                        <dt>4M(발생유형)인자유형관리인자명 :</dt>
                                        <dl>${entry.TYPE_4M }</dl>
                                        <dt>생산오더 :</dt>
                                        <dl>${entry.STATUS}</dl>
                                        <dt>Rule Out :</dt>
                                        <dl>${entry.RULE_OUT }</dl>
                                        <dt>기안자 :</dt>
                                        <dl>${entry.INITIATOR_NAME }</dl>
                                        <dt>발생일자 :</dt>
                                        <dl>${entry.DATE}</dl>
                                        <dt>유효성 평가 :</dt>
                                        <dl>${entry.FOLDER_NAME}</dl>
                                        </dt>

                                    </dl>
                                </c:forEach>
                            </div>
                            <div class="page_btn">
                                ${paging}
                            </div>
                        </c:when>

                        <c:when test="${colflag eq '1'}">
                            <div class="sectit01">
                                <h2>
                                    <span>PPAP 승인</span><span>${MRBcount}</span>
                                </h2>
                                <c:forEach var="entry" items="${totalQuality.PPAP }">
                                    <dl class="resultsty">
                                        <dt>
                                            <a href="#"
                                                onClick="javascript:popupOpen('https://gw.portal.daeduck.com/Website/Approval/Forms/Form.aspx?mode=COMPLETE&piid=${entry.DOCID }','전자결재','width=950','')">
                                                ${entry.SUBJECT }
                                            </a>


                                        <dt>사업장 : ${entry.BIZ_PLACE }</dt>
                                        <dt> : ${entry.PPAP_NO }</dt>
                                        <dt>PPAP NO. : ${entry.SUBJECT }</dt>
                                        <dt> : ${entry.DATE }</dt>

                                        <dt> PPAP 제목${entry.STEP_LEVEL} </dt>
                                        <dl> ${entry.INITIATOR_NAME} </dl>
                                        <dt> LEVEL${entry.STEP1_ENDDATE} </dt>
                                        <dl> ${entry.STEP1_PIID}</dl>
                                        <dt> 기안자${entry.STEP2_ENDDATE} </dt>
                                        <dl> ${entry.STEP2_PIID}</dl>
                                        <dt> 외주발의서${entry.STEP3_ENDDATE} </dt>
                                        <dl> ${entry.STEP3_PIID}</dl>
                                        <dt> PPAP 계획서${entry.STEP4_ENDDATE } </dt>
                                        <dl> ${entry.STEP4_PIID}</dl>
                                        <dt> 1차 샘플결과${entry.STEP5_ENDDATE } </dt>
                                        <dl> ${entry.STEP5_PIID}</dl>
                                        <dt> 2차 Audit${entry.STEP6_ENDDATE } </dt>
                                        <dl> ${entry.STEP6_PIID}</dl>
                                        <dt> 3차평가결과${entry.STATUS} </dt>
                                        <dl> ${entry.STEP6_PIID}</dl>
                                        <dt> 3차평가결과${entry.STATUS} </dt>
                                        <dl> ${entry.STEP6_PIID}</dl>
                                        <dt> 4차평가결과${entry.STATUS} </dt>
                                        <dl> ${entry.STEP6_PIID}</dl>
                                        <dt> 진행상황${entry.STATUS} </dt>
                                        <dl> ${entry.STEP6_PIID}</dl>
                                        <dt> 사업장${entry.STATUS} </dt>
                                        <dl> ${entry.STEP6_PIID}</dl>
                                    </dl>

                                </c:forEach>
                                <div>검색 건수: ${count}/${PPAPcount }</div>
                                ${paging}
                            </div>
                        </c:when>

                        <c:when test="${colflag eq '2'}">
                            <div class="sectit01">
                                <h2>
                                    <span>ECN 계획서</span><span>${ECNcount}</span>
                                </h2>
                                <c:forEach var="entry" items="${totalQuality.ECN}">
                                    <dl class="resultsty">
                                        <dt>
                                            
                                            <dt>공장구분 :</dt>
                                            <dl>${entry.FACTORY_ID }</dl>
                                            <dt>자체외주 :</dt>
                                            <dl>${entry.SUBJECT }</dl>
                                            <dt>공장코드 :</dt>
                                            <dl>${entry.FOLDER_NAME}</dl>
                                            <dt>공정 :</dt>
                                            <dl>${entry.DOC_TYPE }</dl>
                                            <dt>변경점 No. :</dt>
                                            <dl>${entry.TYPE_4M }</dl>
                                            <dt>제목 :</dt>
                                            <dl>${entry.STATUS}</dl>
                                            <dt>Grade Class :</dt>
                                            <dl>${entry.RULE_OUT }</dl>
                                            <dt>등급 :</dt>
                                            <dl>${entry.INITIATOR_NAME }</dl>
                                            <dt>기안자 :</dt>
                                            <dl>${entry.DATE}</dl>
                                            <dt>계획서 :</dt>
                                            <dl>${entry.FOLDER_NAME}</dl>
                                            <dt>ES 결과보고 :</dt>
                                            <dl>${entry.FOLDER_NAME}</dl>
                                            <dt>CCB 1차/업체평가결과 :</dt>
                                            <dl>${entry.FOLDER_NAME}</dl>
                                            <dt>T-ECN 양산평가 :</dt>
                                            <dl>${entry.FOLDER_NAME}</dl>
                                            <dt>CCB2차 :</dt>
                                            <dl>${entry.FOLDER_NAME}</dl>
                                            <dt>표준변경서 협력사 승인원 :</dt>
                                            <dl>${entry.FOLDER_NAME}</dl>
                                            <dt>유효성 결과보고 :</dt>
                                            <dl>${entry.FOLDER_NAME}</dl>
                                            <dt>PCN 승인결과 :</dt>
                                            <dl>${entry.FOLDER_NAME}</dl>
                                            <dt>진행상황 :</dt>
                                            <dl>${entry.FOLDER_NAME}</dl>
                                        </dt>

                                    </dl>
                                </c:forEach>
                            </div>
                            <div class="page_btn">
                                ${paging}
                            </div>
                        </c:when>



                        <c:when test="${colflag eq '3'}">
                            <div class="sectit01">
                                <h2>
                                    <span>시정조치요구</span><span>${Changecount}</span>
                                </h2>
                                <c:forEach var="entry" items="${totalQuality.CHANGE}">
                                    <dl class="resultsty">
                                        <dt>
                                            
                                            <dt>문서번호 :</dt>
                                            <dl>${entry.FACTORY_ID }</dl>
                                            <dt>등급 :</dt>
                                            <dl>${entry.SUBJECT }</dl>
                                            <dt>사업장 :</dt>
                                            <dl>${entry.FOLDER_NAME}</dl>
                                            <dt>공정 :</dt>
                                            <dl>${entry.DOC_TYPE }</dl>
                                            <dt>제목 :</dt>
                                            <dl>${entry.TYPE_4M }</dl>
                                            <dt>발의자 :</dt>
                                            <dl>${entry.STATUS}</dl>
                                            <dt>CS 담당자 :</dt>
                                            <dl>${entry.RULE_OUT }</dl>
                                            <dt>대책사 작성자 :</dt>
                                            <dl>${entry.INITIATOR_NAME }</dl>
                                            <dt>유효성 담당자 :</dt>
                                            <dl>${entry.DATE}</dl>
                                            <dt>시정조치 요구일 :</dt>
                                            <dl>${entry.FOLDER_NAME}</dl>
                                            <dt>대책서 작성일 :</dt>
                                            <dl>${entry.FOLDER_NAME}</dl>
                                            <dt>유효성 확인일 :</dt>
                                            <dl>${entry.FOLDER_NAME}</dl>
                                            <dt>확인 :</dt>
                                            <dl>${entry.FOLDER_NAME}</dl>
                                            <dt>진행상태 :</dt>
                                            <dl>${entry.FOLDER_NAME}</dl>
                                            <dt>8D 제출 :</dt>
                                            <dl>${entry.FOLDER_NAME}</dl>
                                        </dt>

                                    </dl>
                                </c:forEach>
                            </div>
                            <div class="page_btn">
                                ${paging}
                            </div>
                        </c:when>



                        <c:when test="${colflag eq '4'}">
                            <div class="sectit01">
                                <h2>
                                    <span>OCAP (PKG/MBL)</span><span>${OCAPcount}</span>
                                </h2>
                                <c:forEach var="entry" items="${totalQuality.OCAP}">
                                    <dl class="resultsty">
                                       
                                        <dt>공장구분 :</dt>
                                        <dl>${entry.FACTORY_ID }</dl>
                                        <dt>제목 :</dt>
                                        <dl>${entry.SUBJECT }</dl>
                                        <dt>공정 :</dt>
                                        <dl>${entry.FOLDER_NAME}</dl>
                                        <dt>인자유형 :</dt>
                                        <dl>${entry.DOC_TYPE }</dl>
                                        <dt>관리인지명 :</dt>
                                        <dl>${entry.TYPE_4M }</dl>
                                        <dt>기안자 :</dt>
                                        <dl>${entry.STATUS}</dl>
                                        <dt>기안일자 :</dt>
                                        <dl>${entry.RULE_OUT }</dl>

                                    </dl>
                                </c:forEach>
                            </div>
                            <div class="page_btn">
                                ${paging}
                            </div>
                        </c:when>




                        <c:when test="${colflag eq '5'}">
                            <div class="sectit01">
                                <h2>
                                    <span>분석요구서</span><span>${MRBcount}</span>
                                </h2>
                                <c:forEach var="entry" items="${totalQuality.MRB}">
                                    <dl class="resultsty">
                                        
                                        <dt>No. :</dt>
                                        <dl>${entry.FACTORY_ID }</dl>
                                        <dt>의뢰제목 :</dt>
                                        <dl>${entry.SUBJECT }</dl>
                                        <dt>의뢰자 :</dt>
                                        <dl>${entry.FOLDER_NAME}</dl>
                                        <dt>분석요구서 :</dt>
                                        <dl>${entry.DOC_TYPE }</dl>
                                        <dt>완료요청일자 :</dt>
                                        <dl>${entry.TYPE_4M }</dl>
                                        <dt>분석담당자 :</dt>
                                        <dl>${entry.STATUS}</dl>
                                        <dt>분석결과서 :</dt>
                                        <dl>${entry.RULE_OUT }</dl>
                                        <dt>유효성 확인 :</dt>
                                        <dl>${entry.INITIATOR_NAME }</dl>
                                        <dt>진행상태 :</dt>
                                        <dl>${entry.DATE}</dl>
                                     
                                        

                                    </dl>
                                </c:forEach>
                            </div>
                            <div class="page_btn">
                                ${paging}
                            </div>
                        </c:when>




                        <c:when test="${colflag eq '6'}">
                            <div class="sectit01">
                                <h2>
                                    <span>FT/IR 라이브러리(공정이물)</span><span>${Library1count}</span>
                                </h2>
                                <c:forEach var="entry" items="${totalQuality.Library1}">
                                    <dl class="resultsty">
                                        <dt>
                                            <a href="#"
                                                onClick="javascript:popupOpen('https://gw.portal.daeduck.com/Website/Approval/Forms/Form.aspx?mode=COMPLETE&piid=${entry.DOCID }','전자결재','width=950','')">
                                                ${entry.SUBJECT }
                                            </a>
                                        <dt>No. :</dt>
                                        <dl>${entry.FACTORY_ID }</dl>
                                        <dt> 대표이미지 :</dt>
                                        <dl>${entry.SUBJECT }</dl>
                                        <dt>구분 :</dt>
                                        <dl>${entry.FOLDER_NAME}</dl>
                                        <dt>Plant :</dt>
                                        <dl>${entry.DOC_TYPE }</dl>
                                        <dt>공정명 :</dt>
                                        <dl>${entry.TYPE_4M }</dl>
                                        <dt>설비명 :</dt>
                                        <dl>${entry.STATUS}</dl>
                                        <dt>단 :</dt>
                                        <dl>${entry.RULE_OUT }</dl>
                                        <dt>이물색상 :</dt>
                                        <dl>${entry.INITIATOR_NAME }</dl>
                                        <dt>채취일 :</dt>
                                        <dl>${entry.DATE}</dl>
                                        <dt>유효성 평가 :</dt>
                                        <dl>${entry.FOLDER_NAME}</dl>
                                        </dt>

                                    </dl>
                                </c:forEach>
                            </div>
                            <div class="page_btn">
                                ${paging}
                            </div>
                        </c:when>



                        <c:when test="${colflag eq '0'}">
                            <div class="sectit01">
                                <h2>
                                    <span>품질관리</span><span>${MRBcount}</span>
                                </h2>
                                <c:forEach var="entry" items="${totalQuality.MRB}">
                                    <dl class="resultsty">
                                        <dt>
                                            <a href="#"
                                                onClick="javascript:popupOpen('https://gw.portal.daeduck.com/Website/Approval/Forms/Form.aspx?mode=COMPLETE&piid=${entry.DOCID }','전자결재','width=950','')">
                                                ${entry.SUBJECT }
                                            </a>
                                        <dt>문서번호작업장 :</dt>
                                        <dl>${entry.FACTORY_ID }</dl>
                                        <dt>제목 :</dt>
                                        <dl>${entry.SUBJECT }</dl>
                                        <dt>DRB/MRB :</dt>
                                        <dl>${entry.FOLDER_NAME}</dl>
                                        <dt>공정 :</dt>
                                        <dl>${entry.DOC_TYPE }</dl>
                                        <dt>4M(발생유형)인자유형관리인자명 :</dt>
                                        <dl>${entry.TYPE_4M }</dl>
                                        <dt>생산오더 :</dt>
                                        <dl>${entry.STATUS}</dl>
                                        <dt>Rule Out :</dt>
                                        <dl>${entry.RULE_OUT }</dl>
                                        <dt>기안자 :</dt>
                                        <dl>${entry.INITIATOR_NAME }</dl>
                                        <dt>발생일자 :</dt>
                                        <dl>${entry.DATE}</dl>
                                        <dt>유효성 평가 :</dt>
                                        <dl>${entry.FOLDER_NAME}</dl>
                                        </dt>

                                    </dl>
                                </c:forEach>
                            </div>
                            <div class="page_btn">
                                ${paging}
                            </div>
                        </c:when>

                    </c:choose>
                </div>
                <!--//contenst -->
                <!-- rightArea -->
				<div class="rightArea">
					<dl class="rank">
						<%@ include file="./popular/popular.jsp"%>
					</dl>
					<dl class="keyword">
						<dt>내가 찾은 검색어</dt>
						<dd>
							<ul id="mykeyword">
								
							</ul>
						</dd>
					</dl>
					<dl class="recommend">
						<dt>개인화 문서 추천</dt>
						<dd>
							<ul id="recommend">
								<%-- <li>
									<a href="#">2018년도 업무용 자동차(건설기계)보험 가입.zip</a>
								</li>
								<li>
									<a href="#">2018년도 업무용 자동차(건설기계)보험 가입.zip</a>
								</li>
								<li>
									<a href="#">2018년도 업무용 자동차(건설기계)보험 가입.zip</a>
								</li>
								<li>
									<a href="#">2018년도 업무용 자동차(건설기계)보험 가입.zip</a>
								</li>
								<li>
									<a href="#">2018년도 업무용 자동차(건설기계)보험 가입.zip</a>
								</li> --%>
							</ul>
						</dd>
					</dl>
				</div>
				<!-- //rightArea -->
            </div>
        </div>
        <!-- container_wrap-->


    </div>

    <div class="main">

        <c:choose>






            <c:when test="${colflag eq '2'}">
                <c:forEach var="entry" items="${totalQuality.ECN }">
                    <div> ${entry.FACTORY_ID }</div>
                    <div> ${entry.OWN_OUTSOURCED }</div>
                    <div> ${entry.ROUTE_CODE }</div>
                    <div> ${entry.ROUTE_NAME }</div>
                    <div> ${entry.DOC_NO }</div>
                    <div> ${entry.SUBJECT }</div>
                    <div> ${entry.GRADE_CLASS }</div>
                    <div> ${entry.GRADE }</div>
                    <div> ${entry.INITIATOR_ID }</div>
                    <div> ${entry.INITIATOR_NAME }</div>
                    <div> ${entry.STEP1_ENDDATE }</div>
                    <div> ${entry.STEP1_PIID }</div>
                    <div> ${entry.STEP2_ENDDATE }</div>
                    <div> ${entry.STEP2_PIID }</div>
                    <div> ${entry.STEP3_ENDDATE }</div>
                    <div> ${entry.STEP3_PIID }</div>
                    <div> ${entry.STEP4_ENDDATE }</div>
                    <div> ${entry.STEP4_PIID }</div>
                    <div> ${entry.STEP5_ENDDATE }</div>
                    <div> ${entry.STEP5_PIID }</div>
                    <div> ${entry.STEP6_ENDDATE }</div>
                    <div> ${entry.STEP6_PIID }</div>
                    <div> ${entry.STEP7_ENDDATE }</div>
                    <div> ${entry.STEP7_PIID }</div>
                    <div> ${entry.STEP8_ENDDATE }</div>
                    <div> ${entry.STEP8_PIID }</div>
                    <div> ${entry.STATUS }</div>
                    <div> ${entry.REG_ID }</div>
                    <div> ${entry.DATE }</div>
                    <div> ${entry.MODI_ID }</div>
                    <div> ${entry.MODI_DATE }</div>
                    <div> ${entry.MANAGER_ID }</div>
                    <div> ${entry.MANAGER_NAME }</div>
                    <div> ${entry.STEP_NUMBER }</div>
                    <div> ${entry.PARENT_PROCESS_ID }</div>
                    <div> ${entry.ISDISPLAY }</div>

                </c:forEach>
                <div>검색 건수: ${count}/${ECNcount }</div>
                ${paging}
            </c:when>

            <c:when test="${colflag eq '3'}">
                <c:forEach var="entry" items="${totalQuality.CHANGE }">
                    <div> ${entry.DOCID }</div>
                    <div> ${entry.BIZ_PLACE }</div>
                    <div> ${entry.FAULT_NAME }</div>
                    <div> ${entry.GRADE }</div>
                    <div> ${entry.SUBMIT }</div>
                    <div> ${entry.DATE }</div>
                    <div> ${entry.Quality_ID }</div>
                    <div> ${entry.SUBJECT }</div>
                    <div> ${entry.REQ_RETURN_DATE }</div>
                    <div> ${entry.SZPROGRESS }</div>
                    <div> ${entry.REC_QUALITY_ID }</div>
                    <div> ${entry.INITIATOR_ID }</div>
                    <div> ${entry.INITIATOR_NAME }</div>
                    <div> ${entry.CS_QUALITY_NAME }</div>
                    <div> ${entry.REC_QUALITY_NAME }</div>
                    <div> ${entry.STEP1_STARTDATE }</div>
                    <div> ${entry.STEP1_ENDDATE }</div>
                    <div> ${entry.STEP1_PIID }</div>
                    <div> ${entry.STEP2_STARTDATE }</div>
                    <div> ${entry.STEP2_ENDDATE }</div>
                    <div> ${entry.STEP2_PIID }</div>
                    <div> ${entry.STEP3_ENDDATE }</div>
                    <div> ${entry.STEP3_PIID }</div>
                    <div> ${entry.STEP4_ENDDATE }</div>
                    <div> ${entry.STEP4_PIID }</div>
                    <div> ${entry.STEP5_ENDDATE }</div>
                    <div> ${entry.STEP5_PIID }</div>
                    <div> ${entry.STEP6_ENDDATE }</div>
                    <div> ${entry.STEP6_PIID }</div>
                    <div> ${entry.MANAGER_ID }</div>
                    <div> ${entry.MANAGER_NAME }</div>
                    <div> ${entry.PARENT_PROCESS_ID }</div>
                    <div> ${entry.STATUS }</div>
                    <div> ${entry.ISOVER }</div>
                    <div> ${entry.OVERDAY }</div>
                    <div> ${entry.OVERDAY1 }</div>
                    <div> ${entry.OVERDAY2 }</div>
                    <div> ${entry.OVERDAY3 }</div>
                    <div> ${entry.IsDisplay }</div>
                    <div> ${entry.DROP_REASON }</div>
                    <div> ${entry.REC_STEP1_NAME }</div>
                    <div> ${entry.MAIN_ROUTE_NAME }</div>
                    <div> ${entry.SIMSA_GUBUN }</div>
                    <div> ${entry.SELF_GUBUN }</div>
                    <div> ${entry.RE_OCCUR }</div>
                    <div> ${entry.COMNAME }</div>
                    <div> ${entry.ORDER_GUBUN }</div>
                    <div> ${entry.ALIAS }</div>
                    <hr>
                </c:forEach>
                <div>검색 건수: ${count}/${CHANGEcount }</div>
                ${paging}
            </c:when>

            <c:when test="${colflag eq '4'}">
                <c:forEach var="entry" items="${totalQuality.OCAP }">
                    <div>${entry.DOCID}</div>
                    <div> ${entry.FACTORY_ID }</div>
                    <div> ${entry.SUBJECT }</div>
                    <div> ${entry.DOC_TYPE }</div>
                    <div> ${entry.ROUTE_NAME }</div>
                    <div> ${entry.TYPE_4M }</div>
                    <div> ${entry.FACTOR_GUBUN }</div>
                    <div> ${entry.FACTOR_NAME }</div>
                    <div> ${entry.LOT_ID }</div>
                    <div> ${entry.RULE_OUT }</div>
                    <div> ${entry.INITIATOR_NAME }</div>
                    <div> ${entry.STEP1_ENDDATE }</div>
                    <div> ${entry.STEP1_PIID }</div>
                    <div> ${entry.STATUS }</div>
                    <div> ${entry.STEP2_ENDDATE }</div>
                    <div> ${entry.STEP2_PIID }</div>
                    <div> ${entry.DATE }</div>
                    <div> ${entry.ALIAS }</div>
                    <hr>
                </c:forEach>
                <div>검색 건수: ${count}/${OCAPcount }</div>
                ${paging}
            </c:when>

            <c:when test="${colflag eq '5'}">
                <c:forEach var="entry" items="${totalQuality.ANALYSIS }">
                    <div>${entry.DOCID}</div>
                    <div>${entry.SUBJECT }</div>
                    <div>${entry.INITIATOR_ID }</div>
                    <div>${entry.INITIATOR_NAME }</div>
                    <div>${entry.STEP1_STARTDATE }</div>
                    <div>${entry.STEP1_ENDDATE }</div>
                    <div>${entry.STEP1_PIID }</div>
                    <div>${entry.STEP2_STARTDATE }</div>
                    <div>${entry.STEP2_ENDDATE }</div>
                    <div>${entry.STEP2_PIID }</div>
                    <div>${entry.STEP3_ENDDATE }</div>
                    <div>${entry.STEP3_PIID }</div>
                    <div>${entry.MANAGER_ID }</div>
                    <div>${entry.MANAGER_NAME }</div>
                    <div>${entry.PARENT_PROCESS_ID }</div>
                    <div>${entry.STATUS }</div>
                    <div>${entry.IsDisplay }</div>
                    <div>${entry.DATE }</div>
                    <div>${entry.deveplop }</div>
                    <div>${entry.COMCODE }</div>
                    <div>${entry.SUPPROGRESS }</div>
                    <div>${entry.BUMUN }</div>
                    <div>${entry.PROGRESSCODE }</div>
                    <div>${entry.PROGRESS }</div>
                    <div>${entry.SEVERITY }</div>
                    <div>${entry.MODEL }</div>
                    <div>${entry.LOTNO }</div>
                    <div>${entry.Environmental_Test }</div>
                    <div>${entry.Mechanical_Analysis}</div>
                    <div>${entry.Micro-Analysis }</div>
                    <div>${entry.Measurement }</div>
                    <div>${entry.Electrical_Test }</div>
                    <div>${entry.Other }</div>
                    <div>${entry.Result1 }</div>
                    <div>${entry.Result2 }</div>
                    <div>${entry.Result3 }</div>
                    <div>${entry.PSTATUS }</div>
                    <div>${entry.PROGRESS1 }</div>
                    <div>${entry.ALIAS }</div>

                    <hr>
                </c:forEach>
                <div>검색 건수: ${count}/${ANALYSIScount }</div>
                ${paging}
            </c:when>


            <c:when test="${colflag eq '6'}">
                <c:forEach var="entry" items="${totalQuality.LIBRARY1 }">
                    <div>DOCID: ${entry.DOCID }</div>
                    <div>BIZ_PLACE : ${entry.BIZ_PLACE }</div>
                    <div>PPAP_NO : ${entry.PPAP_NO }</div>
                    <div>SUBJECT : ${entry.SUBJECT }</div>
                    <div>DATE : ${entry.DATE }</div>
                    <hr>
                </c:forEach>
                <div>검색 건수: ${count}/${LIBRARY1count }</div>
                ${paging}
            </c:when>


            <c:when test="${colflag eq '7'}">
                <c:forEach var="entry" items="${totalQuality.LIBRARY2 }">
                    <div>DOCID: ${entry.DOCID }</div>
                    <div>BIZ_PLACE : ${entry.BIZ_PLACE }</div>
                    <div>PPAP_NO : ${entry.PPAP_NO }</div>
                    <div>SUBJECT : ${entry.SUBJECT }</div>
                    <div>DATE : ${entry.DATE }</div>
                    <hr>
                </c:forEach>
                <div>검색 건수: ${count}/${LIBRARY2count }</div>
                ${paging}
            </c:when>

            <c:when test="${colflag eq '8'}">
                <c:forEach var="entry" items="${totalQuality.RAW }">
                    <div>${entry.DOCID }</div>
                    <div>${entry.Gubun }</div>
                    <div>${entry.Plant }</div>
                    <div>${entry.ProcessName }</div>
                    <div>${entry.FacilitiesName }</div>
                    <div>${entry.Only }</div>
                    <div>${entry.ToWhere }</div>
                    <div>${entry.SomethingElse }</div>
                    <div>${entry.ByWhatMeans }</div>
                    <div>${entry.HowMuch }</div>
                    <div>${entry.DATE }</div>
                    <div>${entry.ForeignForm }</div>
                    <div>${entry.ForeignSize }</div>
                    <div>${entry.ForeignColor }</div>
                    <div>${entry.Requester }</div>
                    <div>${entry.Creator }</div>
                    <div>${entry.EntryNo }</div>
                    <div>${entry.FTIR_Result }</div>
                    <div>${entry.EDS }</div>
                    <div>${entry.BODY }</div>
                    <div>${entry.ALIAS }</div>

                    <hr>
                </c:forEach>
                <div>검색 건수: ${count}/${RAWcount }</div>
                ${paging}
            </c:when>


            <c:otherwise>
                잘 못 클릭하신 거겠죠 ^^;;
            </c:otherwise>


        </c:choose>

    </div>

</body>

<!-- 내가 찾은 검색어 -->
	<script>
		getMyKeyword('${value.query}', '${totalCount}');
	</script>

</html>