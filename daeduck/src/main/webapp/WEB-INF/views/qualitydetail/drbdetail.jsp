<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<table border="0" cellpadding="0" cellspacing="0" style="margin-left:140px;">
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
                <tbody><tr style="height:28px">
                    <th style="background-color:#eee;">발생일시</th>
                    <td style="background-color:#fff;" colspan="3">
                        <input name="col_time_start" id="col_time_start" class="datepick" type="text"  readOnly="true"/> 
                        ~ <input name="col_time_end" id="col_time_end"  class="datepick"type="text" readOnly="true"/>
                    </td>
                    <th style="background-color:#eee;">*작업장ID</th>
                    <td style="background-color:#fff;padding-left:7px">
                        <select name="biz_place" id="cphContent_cphContent_reqid">
                            <option selected="" value="">선택</option>
                            <option value="P1">P1</option>
                            <option value="P2-1">P2-1</option>
                            <option value="P2-2">P2-2</option>
                            <option value="P4">P4</option>
                            <option value="DP센터">DP센터</option>
                        </select>
                    </td>
                </tr>
                <tr style="height:28px">
                    <th style="background-color:#eee;">*인자구분</th>
                    <td style="background-color:#fff;padding-left:7px">
                        <select name="factory_gubun" id="cphContent_cphContent_reqtype" style="width: 80%">
                            <option selected="" value="">선택</option>
                            <option value="X">X</option>
                            <option value="Y">Y</option>
                        </select>
                    </td>
                    <th style="background-color:#eee;">룰아웃구분</th>
                    <td style="background-color:#fff;padding-left:7px" colspan="3">
                        <select name="role_out" id="cphContent_cphContent_rullout">
                            <option selected="searchField" value="">전체</option>
                        	<option value="OOC">OOC</option>
                        	<option value="OOS">OOS</option>
                        </select>
                    </td>
                </tr>
                <tr style="height:28px">
                    <th style="background-color:#eee;">공정명</th>
                    <td style="background-color:#fff;padding-left:7px" colspan="5">
                        <input name="" type="hidden" id="cphContent_cphContent_hdnOperID">
                        <input name="" type="hidden" id="cphContent_cphContent_hdnOperName">
                        <div id="divOperName" style="float:left;margin-top:3px;margin-right:5px;"></div>
                        <div style="float:left"><input type="button" value="선택" onclick="findFMEA()"></div>
                    </td>
                </tr>
                <tr style="height:28px">
                    <th style="background-color:#eee;">측정인자</th>
                    <td style="background-color:#fff;padding-left:7px" colspan="5">
                        
                        <input name="" type="hidden" id="cphContent_cphContent_hdnSelMainCode">
                        <input name="" type="hidden" id="cphContent_cphContent_hdnSelMainName">
                        <div id="divSelMainName" style="float:left;margin-top:3px;margin-right:5px;"></div>
                        <div style="float:left"><input type="button" value="선택" onclick="findMAIN()"></div>
                    </td>
                </tr>
                <tr style="height:28px">
                    <th style="background-color:#eee;">관리번호</th>
                    <td style="background-color:#fff;" colspan="5">
                        <input name="" type="text" id="cphContent_cphContent_reqno" style="width: 80%">
                    </td>
                </tr>
            </tbody></table>
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
<script>
    // 품질관리 상세 검색 설정
function doSetting(colflag, collection){
    if($('#col_time_start').val() !='' || $('#col_time_end').val() !=''){

        
	   if($('#col_time_start').val() == ''){
		   alert('시작 날짜를 입력하세요');
		   return;
	   }
	   if($('#col_time_end').val() == ''){
		   alert('마지막 날짜를 입력하세요');
		   return;
       }

	   if(!compareStringNum($("#col_time_start").val(), $("#col_time_end").val(), ".")) {
		   alert("기간이 올바르지 않습니다. 시작일이 종료일보다 작거나 같도록 하세요.");
		   $("#col_time_start").focus();
		   return;
       }
   }
   doQualitySearch(colflag, collection);

}
</script>

