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
                    <!--
                        <input name="startDate" id="startDate" type="text"  readOnly="true"/> 
                        ~ <input name="endDate" id="endDate" type="text" readOnly="true"/>
                        -->
                    </td>
                    <th style="background-color:#eee;">*작업장ID</th>
                    <td style="background-color:#fff;padding-left:7px">
                        <select name="BIZ_PLACE" id="cphContent_cphContent_reqid">
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
                        <select name="" id="cphContent_cphContent_reqtype" style="width: 80%">
                            <option selected="" value="">선택</option>
                            <option value="X">X</option>
                            <option value="Y">Y</option>
                        </select>
                    </td>
                    <th style="background-color:#eee;">룰아웃구분</th>
                    <td style="background-color:#fff;padding-left:7px" colspan="3">
                        <select name="" id="cphContent_cphContent_rullout">
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
    </tr>
    </tbody>
</table>

