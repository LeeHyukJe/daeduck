<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>


<html>
<head>
	<title>품질관리 페이지</title>
	<meta charset="UTF-8" />
	<script src="/resources/js/jquery-3.4.1.min.js"></script>
    <script src="/resources/js/category.js"></script>
    <script src="/resources/js/popular.js"></script>
    <script src="/resources/js/search.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.2/handlebars.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/sidebar_menu.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/searchbox.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/popular.css" />
</head>
	<body>
	<%@ include file="./sidenav/sidenav.jsp" %>
	<%@ include file="./searchbox/searchbox.jsp" %>
	
	<div class="main">

        <c:choose>
            <c:when test="${colflag eq '0'}">
                <c:forEach var="entry" items="${totalQuality.MRB }">
	    		<div>DOCID: ${entry.DOCID }</div>
	    		<div>BIZ_PLACE : ${entry.FACTORY_ID  }</div>
	    		<div>PPAP_NO : ${entry.SUBJECT  }</div>
	    		<div>SUBJECT : ${entry.DOC_TYPE  }</div>
	    		<div>DATE : ${entry.ROUTE_CODE }</div>
                <div>ROUTE_NAME ${entry.ROUTE_NAME} </div>	
                <div>TYPE_4M ${entry.TYPE_4M}		    </div>
                <div>FACTORY_GUBUN ${entry.FACTORY_GUBUN}      </div>
                <div>FACTORY_CODE ${entry.FACTORY_CODE}	</div>	
                <div>FACTORY_NAME ${entry.FACTORY_NAME}	</div>	
                <div>LOT_ID ${entry.LOT_ID}	        </div>
                <div>RULE_OUT ${entry.RULE_OUT}		</div>	
                <div>INITIATOR_NAME ${entry.INITIATOR_NAME}	</div>
                <div>STEP1_ENDDATE ${entry.STEP1_ENDDATE}	</div>
                <div>STEP1_PIID ${entry.STEP1_PIID}		</div>
                <div>STATUS ${entry.STATUS}		    </div>
                <div>STEP2_ENDDATE ${entry.STEP2_ENDDATE}  </div>
                <div>STEP2_PIID ${entry.STEP2_PIID}	    </div>
        

	    		<hr>
	    	    </c:forEach>
	    	    <div>검색 건수: ${count}/${totalCount }</div>
	    	    ${paging}
            </c:when>



            <c:when test="${colflag eq '1'}">
                <c:forEach var="entry" items="${totalQuality.PPAP }">
	    		<div>DOCID: ${entry.DOCID }</div>
	    		<div>BIZ_PLACE : ${entry.BIZ_PLACE  }</div>
	    		<div>PPAP_NO : ${entry.PPAP_NO  }</div>
	    		<div>SUBJECT : ${entry.SUBJECT  }</div>
	    		<div>DATE : ${entry.DATE  }</div>

                <div> ${entry.STEP_LEVEL}        </div> 
                <div> ${entry.INITIATOR_NAME} 	</div>	
                <div> ${entry.STEP1_ENDDATE}	</div>		
                <div> ${entry.STEP1_PIID}</div>
                <div> ${entry.STEP2_ENDDATE}	</div>		
                <div> ${entry.STEP2_PIID}</div>
                <div> ${entry.STEP3_ENDDATE}	</div>		
                <div> ${entry.STEP3_PIID}</div>
                <div> ${entry.STEP4_ENDDATE }	</div>		
                <div> ${entry.STEP4_PIID}</div>
                <div> ${entry.STEP5_ENDDATE }	</div>		
                <div> ${entry.STEP5_PIID}</div>
                <div> ${entry.STEP6_ENDDATE }	</div>		
                <div> ${entry.STEP6_PIID}</div>
                <div> ${entry.STATUS}    		</div>
                <hr>
	    	    </c:forEach>
	    	    <div>검색 건수: ${count}/${totalCount }</div>
	    	    ${paging}
            </c:when>

            <c:when test="${colflag eq '2'}">
                <c:forEach var="entry" items="${totalQuality.ECN }">
	    		  <div> ${entry.FACTORY_ID   		}</div>
                  <div> ${entry.OWN_OUTSOURCED   	}</div>
                  <div> ${entry.ROUTE_CODE   		}</div>
                  <div> ${entry.ROUTE_NAME   		}</div>
                  <div> ${entry.DOC_NO   			}</div>
                  <div> ${entry.SUBJECT   			}</div>
                  <div> ${entry.GRADE_CLASS   		}</div>
                  <div> ${entry.GRADE   			}</div>
                  <div> ${entry.INITIATOR_ID   		}</div>
                  <div> ${entry.INITIATOR_NAME   	}</div>
                  <div> ${entry.STEP1_ENDDATE   	}</div>
                  <div> ${entry.STEP1_PIID   		}</div>
                  <div> ${entry.STEP2_ENDDATE  		}</div>
                  <div> ${entry.STEP2_PIID   		}</div>
                  <div> ${entry.STEP3_ENDDATE   	}</div>
                  <div> ${entry.STEP3_PIID  		}</div>
                  <div> ${entry.STEP4_ENDDATE   	}</div>
                  <div> ${entry.STEP4_PIID  		}</div>
                  <div> ${entry.STEP5_ENDDATE   	}</div>
                  <div> ${entry.STEP5_PIID   		}</div>
                  <div> ${entry.STEP6_ENDDATE   	}</div>
                  <div> ${entry.STEP6_PIID   		}</div>
                  <div> ${entry.STEP7_ENDDATE   	}</div>
                  <div> ${entry.STEP7_PIID  		}</div>
                  <div> ${entry.STEP8_ENDDATE   	}</div>
                  <div> ${entry.STEP8_PIID   		}</div>
                  <div> ${entry.STATUS   			}</div>
                  <div> ${entry.REG_ID   			}</div>
                  <div> ${entry.DATE   				}</div>
                  <div> ${entry.MODI_ID  			}</div>
                  <div> ${entry.MODI_DATE   		}</div>
                  <div> ${entry.MANAGER_ID  		}</div>
                  <div> ${entry.MANAGER_NAME   		}</div>
                  <div> ${entry.STEP_NUMBER   		}</div>
                  <div> ${entry.PARENT_PROCESS_ID  	}</div>
                  <div> ${entry.ISDISPLAY   		}</div>

	    	    </c:forEach>
	    	    <div>검색 건수: ${count}/${totalCount }</div>
	    	    ${paging}
            </c:when>

            <c:when test="${colflag eq '3'}">
                <c:forEach var="entry" items="${totalQuality.CHANGE }">
	    		  <div> ${entry.DOCID   			}</div>
                  <div> ${entry.BIZ_PLACE   		}</div>
                  <div> ${entry.FAULT_NAME   		}</div>
                  <div> ${entry.GRADE   			}</div>
                  <div> ${entry.SUBMIT   			}</div>
                  <div> ${entry.DATE   				}</div>
                  <div> ${entry.Quality_ID   		}</div>
                  <div> ${entry.SUBJECT   			}</div>
                  <div> ${entry.REQ_RETURN_DATE   	}</div>
                  <div> ${entry.SZPROGRESS   		}</div>
                  <div> ${entry.REC_QUALITY_ID  	}</div>
                  <div> ${entry.INITIATOR_ID   		}</div>
                  <div> ${entry.INITIATOR_NAME  	}</div>
                  <div> ${entry.CS_QUALITY_NAME  	}</div>
                  <div> ${entry.REC_QUALITY_NAME  	}</div>
                  <div> ${entry.STEP1_STARTDATE  	}</div>
                  <div> ${entry.STEP1_ENDDATE   	}</div>
                  <div> ${entry.STEP1_PIID   		}</div>
                  <div> ${entry.STEP2_STARTDATE   	}</div>
                  <div> ${entry.STEP2_ENDDATE   	}</div>
                  <div> ${entry.STEP2_PIID   		}</div>
                  <div> ${entry.STEP3_ENDDATE   	}</div>
                  <div> ${entry.STEP3_PIID   		}</div>
                  <div> ${entry.STEP4_ENDDATE   	}</div>
                  <div> ${entry.STEP4_PIID   		}</div>
                  <div> ${entry.STEP5_ENDDATE   	}</div>
                  <div> ${entry.STEP5_PIID   		}</div>
                  <div> ${entry.STEP6_ENDDATE   	}</div>
                  <div> ${entry.STEP6_PIID   		}</div>
                  <div> ${entry.MANAGER_ID   		}</div>
                  <div> ${entry.MANAGER_NAME   		}</div>
                  <div> ${entry.PARENT_PROCESS_ID   }</div>
                  <div> ${entry.STATUS   			}</div>
                  <div> ${entry.ISOVER   			}</div>
                  <div> ${entry.OVERDAY   			}</div>
                  <div> ${entry.OVERDAY1   			}</div>
                  <div> ${entry.OVERDAY2   			}</div>
                  <div> ${entry.OVERDAY3   			}</div>
                  <div> ${entry.IsDisplay   		}</div>
                  <div> ${entry.DROP_REASON   		}</div>
                  <div> ${entry.REC_STEP1_NAME   	}</div>
                  <div> ${entry.MAIN_ROUTE_NAME   	}</div>
                  <div> ${entry.SIMSA_GUBUN   		}</div>
                  <div> ${entry.SELF_GUBUN   		}</div>
                  <div> ${entry.RE_OCCUR   			}</div>
                  <div> ${entry.COMNAME   			}</div>
                  <div> ${entry.ORDER_GUBUN   		}</div>
                  <div> ${entry.ALIAS   			}</div>
                  <hr>
	    	    </c:forEach>
	    	    <div>검색 건수: ${count}/${totalCount }</div>
	    	    ${paging}
            </c:when>

            <c:when test="${colflag eq '4'}">
                <c:forEach var="entry" items="${totalQuality.OCAP }">
	    		<div>DOCID: ${entry.DOCID }</div>
	    		<div>BIZ_PLACE : ${entry.BIZ_PLACE  }</div>
	    		<div>PPAP_NO : ${entry.PPAP_NO  }</div>
	    		<div>SUBJECT : ${entry.SUBJECT  }</div>
	    		<div>DATE : ${entry.DATE  }</div>
	    		<hr>
	    	    </c:forEach>
	    	    <div>검색 건수: ${count}/${totalCount }</div>
	    	    ${paging}
            </c:when>

            <c:when test="${colflag eq '5'}">
                <c:forEach var="entry" items="${totalQuality.ANALYSIS }">
	    		<div>DOCID: ${entry.DOCID }</div>
	    		<div>BIZ_PLACE : ${entry.BIZ_PLACE  }</div>
	    		<div>PPAP_NO : ${entry.PPAP_NO  }</div>
	    		<div>SUBJECT : ${entry.SUBJECT  }</div>
	    		<div>DATE : ${entry.DATE  }</div>
	    		<hr>
	    	    </c:forEach>
	    	    <div>검색 건수: ${count}/${totalCount }</div>
	    	    ${paging}
            </c:when>

            <c:when test="${colflag eq '6'}">
                <c:forEach var="entry" items="${totalQuality.LIBRARY1 }">
	    		<div>DOCID: ${entry.DOCID }</div>
	    		<div>BIZ_PLACE : ${entry.BIZ_PLACE  }</div>
	    		<div>PPAP_NO : ${entry.PPAP_NO  }</div>
	    		<div>SUBJECT : ${entry.SUBJECT  }</div>
	    		<div>DATE : ${entry.DATE  }</div>
	    		<hr>
	    	    </c:forEach>
	    	    <div>검색 건수: ${count}/${totalCount }</div>
	    	    ${paging}
            </c:when>

            <c:when test="${colflag eq '7'}">
                <c:forEach var="entry" items="${totalQuality.LIBRARY2 }">
	    		<div>DOCID: ${entry.DOCID }</div>
	    		<div>BIZ_PLACE : ${entry.BIZ_PLACE  }</div>
	    		<div>PPAP_NO : ${entry.PPAP_NO  }</div>
	    		<div>SUBJECT : ${entry.SUBJECT  }</div>
	    		<div>DATE : ${entry.DATE  }</div>
	    		<hr>
	    	    </c:forEach>
	    	    <div>검색 건수: ${count}/${totalCount }</div>
	    	    ${paging}
            </c:when>

            <c:when test="${colflag eq '8'}">
                <c:forEach var="entry" items="${totalQuality.RAW }">
	    		<div>DOCID: ${entry.DOCID }</div>
	    		<div>BIZ_PLACE : ${entry.BIZ_PLACE  }</div>
	    		<div>PPAP_NO : ${entry.PPAP_NO  }</div>
	    		<div>SUBJECT : ${entry.SUBJECT  }</div>
	    		<div>DATE : ${entry.DATE  }</div>
	    		<hr>
	    	    </c:forEach>
	    	    <div>검색 건수: ${count}/${totalCount }</div>
	    	    ${paging}
            </c:when>

            <c:otherwise>
                잘 못 클릭하신 거겠죠 ^^;;
            </c:otherwise>


        </c:choose>

	</div>
	
	</body>
</html>