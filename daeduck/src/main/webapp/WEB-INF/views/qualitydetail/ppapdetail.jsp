<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div class="board_btop" style="height:130px; margin-left:170px;">
    <div class="board_search" style="height:90px">
        <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <td style="padding-left: 5px;width:850px">
                        <table border="0" cellpadding="1" cellspacing="1" style="background-color:#ddd;width:99%">
                            <colgroup>
                                <col style="width: 13%">
                                <col style="width: 20%">
                                <col style="width: 13%">
                                <col style="width: 20%">
                                <col style="width: 13%">
                                <col style="width: 21%">
                            </colgroup>
                            <tbody>
                                <tr style="height:28px">

                                    <th style="background-color:#eee;">외주발의서</th>
                                    <td style="background-color:#fff;" colspan="3">
                                        <input name="step1_startDate" type="text" id="step1_startDate"
                                            style="width: 40%" readonly="" class="qualityDetail_start">
                                        ~ <input name="step1_endDate" type="text" id="step1_endDate"
                                            style="width: 40%" readonly="" class="qualityDetail_end">
                                    </td>

                                    <th style="background-color:#eee;">사업장</th>
                                    <td style="background-color:#fff;padding-left:7px">
                                        <select name="biz_place" id="cphContent_cphContent_bizplace">
                                            <option selected="selected" value="">전체</option>
                                            <option value="MLB">MLB</option>
                                            <option value="HDI">HDI</option>
                                            <option value="TLB">TLB</option>
                                            <option value="PKG1/PKG2">PKG1/PKG2</option>
                                        </select>
                                    </td>
                                </tr>

                                <tr style="height:28px">

                                    <th style="background-color:#eee;">4차평가결과</th>
                                    <td style="background-color:#fff;" colspan="3">
                                        <input name="step6_startDate" type="text" id="step6_startDate"
                                            style="width: 40%" readonly="" class="qualityDetail_start">
                                        ~ <input name="step6_endDate" type="text" id="step6_endDate" style="width: 40%"
                                            readonly="" class="qualityDetail_end">
                                    </td>

                                    <th style="background-color:#eee;">제목</th>
                                    <td style="background-color:#fff;">
                                        <input name="title_pre" type="text" id="cphContent_cphContent_subject"
                                            style="width: 80%">
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <th style="background-color:#eee;">기안자</th>
                                    <td style="background-color:#fff;">
                                        <input name="initiator_name" type="text"
                                            id="cphContent_cphContent_initiatorname" style="width: 70%">
                                        <input name="" type="hidden" id="cphContent_cphContent_initiatorid">
                                        <a onclick="OpenWinEmployee('cphContent_cphContent_initiatorname')">
                                            <img alt="search" style="vertical-align: middle; cursor:pointer;"
                                                src="/Images/Images/Common/Btn/btn_org.gif" width="21" height="18">
                                        </a>
                                    </td>
                                    <th style="background-color:#eee;">PPAP No.</th>
                                    <td style="background-color:#fff;">
                                        <input name="ppap_no" type="text" id="cphContent_cphContent_ppapno"
                                            style="width: 80%">
                                    </td>
                                    <th style="background-color:#eee;">LEVEL</th>
                                    <td style="background-color:#fff;">
                                        <input name="step_level_pre" type="text" id="cphContent_cphContent_steplevel"
                                            style="width: 80%">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                    <td style="text-align:right">
                        <div id="cphContent_cphContent_div_setView" style="display:none">
                            <!-- 초과일수 -->
                            <span id="span_viewEx" style="float: right">
                                <a id="a_viewEx" href="javascript:onclick_View('Ex');"><em class="btn_ws_l">
                                        <span class="btn_ws_r"><strong class="txt_btn_ws">Ex</strong></span></em></a>
                            </span>
                            <!-- 모두표시 -->
                            <span id="span_viewAll" style="float: right">
                                <a id="a_viewAll" href="javascript:onclick_View('ALL');"><em class="btn_ws_l">
                                        <span class="btn_ws_r"><strong class="txt_btn_ws">ALL</strong></span></em></a>
                            </span>
                            <!-- 표시여부적용 -->
                            <span id="span_viewYN" style="float: right">
                                <a id="a_viewYN" href="javascript:onclick_View('YN');"><em class="btn_ws_l">
                                        <span class="btn_ws_r"><strong class="txt_btn_ws">YN</strong></span></em></a>
                            </span>

                        </div>
                    </td>
                    <td>
                        <button type="button" onClick="doSetting('${value.colflag}','${value.collection}')">설정</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<script>
    // 품질관리 상세 검색 설정
function doSetting(colflag, collection){
    if($('#step1_startDate').val() !='' || $('#step1_endDate').val() !=''){

        
	   if($('#step1_startDate').val() == ''){
		   alert('시작 날짜를 입력하세요');
		   return;
	   }
	   if($('#step1_endDate').val() == ''){
		   alert('마지막 날짜를 입력하세요');
		   return;
       }

	   if(!compareStringNum($("#step1_startDate").val(), $("#step1_endDate").val(), ".")) {
		   alert("기간이 올바르지 않습니다. 시작일이 종료일보다 작거나 같도록 하세요.");
		   $("#step1_startDate").focus();
		   return;
       }
   }

   if($('#step6_startDate').val() !='' || $('#step6_endDate').val() !=''){
        if($('#step6_startDate').val() == ''){
		     alert('시작 날짜를 입력하세요');
		     return;
	      }
	     if($('#step6_endDate').val() == ''){
		     alert('마지막 날짜를 입력하세요');
		     return;
         }
         
         if(!compareStringNum($("#step6_startDate").val(), $("#step6_endDate").val(), ".")) {
		     alert("기간이 올바르지 않습니다. 시작일이 종료일보다 작거나 같도록 하세요.");
		     $("#step6_startDate").focus();
		     return;
         }
    }
   doQualitySearch(colflag, collection);

}
</script>