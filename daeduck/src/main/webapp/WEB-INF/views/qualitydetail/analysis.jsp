<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div class="board_btop" style="height:130px">
            <div class="board_search" style="height:90px">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tbody><tr>
                        <td style="padding-left: 5px;width:960px">
                            <table border="0" cellpadding="1" cellspacing="1" style="background-color:#ddd;width:95%">
                                <tbody><tr style="height:28px">
                                    <td style="background-color:#eee; text-align:center;width:100px">의뢰제목</td>
                                    <td style="background-color:#fff;width:160px">
                                        <input name="ctl00$ctl00$cphContent$cphContent$txtSubject" type="text" id="cphContent_cphContent_txtSubject" onkeydown="onKeyCheck()">
                                    </td>
                                    <td style="background-color:#eee; text-align:center;width:100px">의뢰자</td>
                                    <td style="background-color:#fff">
                                        <input name="ctl00$ctl00$cphContent$cphContent$txtInitiator" type="text" id="cphContent_cphContent_txtInitiator" onkeydown="onKeyCheck()">
                                    </td>
                                    <td style="background-color:#eee; width:100px; text-align:center">완료요청일자</td>
                                    <td style="background-color:#fff; width:280px">
                                        <span><input name="ctl00$ctl00$cphContent$cphContent$txtCompleteDate1" type="text" maxlength="10" id="cphContent_cphContent_txtCompleteDate1" size="15" data-pattern="date" data-date-disabled="sat,sun" data-date-min="0" onkeydown="return CFN_CheckMaxLength(this, '10')" class="ime_calender_mode" onfocus="CFN_RemoveDateFromat('dash')" onblur="CFN_ConvertDate('dash')" onkeypress="CFN_CheckIsDateNum('dash')" onkeyup="CFN_OnKeyUpIsDate(this)" onclick="CFN_CalenderPopup(this,'', '', '');" dateformat="dash" displayday="false" style="vertical-align:middle;text-align:center;"> <img src="/Images/Images/Controls/TextBox/ico_cal.gif" alt="Cal" onclick="CFN_ImgCalendarBtnClick('cphContent_cphContent_txtCompleteDate1')"></span> ~
                                        <span><input name="ctl00$ctl00$cphContent$cphContent$txtCompleteDate2" type="text" maxlength="10" id="cphContent_cphContent_txtCompleteDate2" size="15" data-pattern="date" data-date-disabled="sat,sun" data-date-min="0" onkeydown="return CFN_CheckMaxLength(this, '10')" class="ime_calender_mode" onfocus="CFN_RemoveDateFromat('dash')" onblur="CFN_ConvertDate('dash')" onkeypress="CFN_CheckIsDateNum('dash')" onkeyup="CFN_OnKeyUpIsDate(this)" onclick="CFN_CalenderPopup(this,'', '', '');" dateformat="dash" displayday="false" style="vertical-align:middle;text-align:center;"> <img src="/Images/Images/Controls/TextBox/ico_cal.gif" alt="Cal" onclick="CFN_ImgCalendarBtnClick('cphContent_cphContent_txtCompleteDate2')"></span>
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                   <td style="background-color:#eee; text-align:center">분석담당자</td>
                                    <td style="background-color:#fff">
                                        <input name="ctl00$ctl00$cphContent$cphContent$txtManagerName" type="text" id="cphContent_cphContent_txtManagerName" onkeydown="onKeyCheck()">
                                    </td>
                                    <td style="background-color:#eee; text-align:center"></td>
                                    <td style="background-color:#fff"></td>
                                    <td style="background-color:#eee; text-align:center">분석의뢰일자</td>
                                    <td style="background-color:#fff">
                                        <span><input name="ctl00$ctl00$cphContent$cphContent$txtReqDate1" type="text" maxlength="10" id="cphContent_cphContent_txtReqDate1" size="15" data-pattern="date" data-date-disabled="sat,sun" data-date-min="0" onkeydown="return CFN_CheckMaxLength(this, '10')" class="ime_calender_mode" onfocus="CFN_RemoveDateFromat('dash')" onblur="CFN_ConvertDate('dash')" onkeypress="CFN_CheckIsDateNum('dash')" onkeyup="CFN_OnKeyUpIsDate(this)" onclick="CFN_CalenderPopup(this,'', '', '');" dateformat="dash" displayday="false" style="vertical-align:middle;text-align:center;"> <img src="/Images/Images/Controls/TextBox/ico_cal.gif" alt="Cal" onclick="CFN_ImgCalendarBtnClick('cphContent_cphContent_txtReqDate1')"></span> ~
                                        <span><input name="ctl00$ctl00$cphContent$cphContent$txtReqDate2" type="text" maxlength="10" id="cphContent_cphContent_txtReqDate2" size="15" data-pattern="date" data-date-disabled="sat,sun" data-date-min="0" onkeydown="return CFN_CheckMaxLength(this, '10')" class="ime_calender_mode" onfocus="CFN_RemoveDateFromat('dash')" onblur="CFN_ConvertDate('dash')" onkeypress="CFN_CheckIsDateNum('dash')" onkeyup="CFN_OnKeyUpIsDate(this)" onclick="CFN_CalenderPopup(this,'', '', '');" dateformat="dash" displayday="false" style="vertical-align:middle;text-align:center;"> <img src="/Images/Images/Controls/TextBox/ico_cal.gif" alt="Cal" onclick="CFN_ImgCalendarBtnClick('cphContent_cphContent_txtReqDate2')"></span>
                                    </td>
                                </tr>
                            </tbody></table>
                        </td>
                        <td>
                            <a onclick="return fn_ChkCondition();" id="cphContent_cphContent_lbnSearch" href="javascript:__doPostBack('ctl00$ctl00$cphContent$cphContent$lbnSearch','')">
                                <em class="btn_search_l">
                                    <span class="btn_search_r" id="spnBtnSearch">
                                        <strong class="txt_btn_search"><img src="/Images/images/Board/ico_search.gif" alt="" class="ico_btn">
                                            검색
                                        </strong>
                                    </span>
                                </em>
                            </a>
                            <a href="javascript:;" onclick="openLibrary()"><em class="btn_ws_l"><span class="btn_ws_r" style="width:80px"><strong class="txt_btn_ws">분석Library</strong></span></em></a>
                            <div id="cphContent_cphContent_div_setView" style="display:none;float:left">
                                <span id="span_Del" style="float: right">
                                    <a id="a_viewYN" href="javascript:onclick_Del();"><em class="btn_ws_l"><span class="btn_ws_r"><strong class="txt_btn_ws">삭제</strong></span></em></a>
                                </span>
                            </div>
                        </td>                           
                    </tr>
                </tbody></table>
            </div>    
            <img src="/Images/Images/board/bg_btop1.gif" class="trans tl">
            <img src="/Images/Images/board/bg_btop2.gif" class="trans tr">
            <img src="/Images/Images/board/bg_btop3.gif" class="trans bl">
            <img src="/Images/Images/board/bg_btop4.gif" class="trans br">
        </div>