<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div class="board_btop" style="height: 295px;">
            <div class="board_search" style="height:255px">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tbody><tr>
                        <td style="padding-left: 5px;width:880px">
                            <table border="0" cellpadding="1" cellspacing="1" style="background-color:#ddd;width:99%">
                                <tbody><tr style="height:28px">
                                    <td style="background-color:#eee; text-align:center;width:100px">시정조치요구일</td>
                                    <td style="background-color:#fff;width:190px">
                                        <input name="ctl00$ctl00$cphContent$cphContent$reqdate1" type="text" id="cphContent_cphContent_reqdate1" style="width: 75px" readonly="" onclick="CFN_CalenderPopup(this, '', '', '', 'id'); $('#LaryeCalenderPop').css('top', '66px');" dateformat="dash">
                                        ~<input name="ctl00$ctl00$cphContent$cphContent$reqdate2" type="text" id="cphContent_cphContent_reqdate2" style="width: 75px" readonly="" onclick="CFN_CalenderPopup(this, '', '', '', 'id'); $('#LaryeCalenderPop').css('top', '66px');" dateformat="dash">
                                    </td>
                                    <td style="background-color:#eee; text-align:center;width:100px">유효성확인일</td>
                                    <td style="background-color:#fff;width:190px" "="">
                                        <input name="ctl00$ctl00$cphContent$cphContent$reqdate3" type="text" id="cphContent_cphContent_reqdate3" style="width: 75px" readonly="" onclick="CFN_CalenderPopup(this, '', '', '', 'id'); $('#LaryeCalenderPop').css('top', '66px');" dateformat="dash">
                                        ~<input name="ctl00$ctl00$cphContent$cphContent$reqdate4" type="text" id="cphContent_cphContent_reqdate4" style="width: 75px" readonly="" onclick="CFN_CalenderPopup(this, '', '', '', 'id'); $('#LaryeCalenderPop').css('top', '66px');" dateformat="dash">
                                    </td>
                                    <td style="background-color:#eee; text-align:center;width:100px">대책완료예정일</td>
                                    <td style="background-color:#fff">
                                        <span><input name="ctl00$ctl00$cphContent$cphContent$txtCompleteDate" type="text" maxlength="10" id="cphContent_cphContent_txtCompleteDate" size="15" data-pattern="date" data-date-disabled="sat,sun" data-date-min="0" required="Required" onkeydown="return CFN_CheckMaxLength(this, '10')" class="ime_calender_mode input_must" onfocus="CFN_RemoveDateFromat('dash'); CFN_FocusOnOff(this,'On')" onblur="CFN_ConvertDate('dash'); CFN_FocusOnOff(this,'Off')" onkeypress="CFN_CheckIsDateNum('dash')" onkeyup="CFN_OnKeyUpIsDate(this)" onclick="CFN_CalenderPopup(this,'', '', '');" dateformat="dash" displayday="false" style="vertical-align:middle;text-align:center;"> <img src="/Images/Images/Controls/TextBox/ico_cal.gif" alt="Cal" onclick="CFN_ImgCalendarBtnClick('cphContent_cphContent_txtCompleteDate')"></span>
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; text-align:center;width:100px">제목</td>
                                    <td style="background-color:#fff;">
                                        <input name="ctl00$ctl00$cphContent$cphContent$txtSubject" type="text" id="cphContent_cphContent_txtSubject" onkeydown="onKeyCheck()">
                                    </td>
                                    <td style="background-color:#eee; text-align:center;width:100px">문서번호</td>
                                    <td style="background-color:#fff">
                                        <input name="ctl00$ctl00$cphContent$cphContent$txtDocNo" type="text" id="cphContent_cphContent_txtDocNo" onkeydown="onKeyCheck()" style="width:80px;">
                                    </td>
                                    <td style="background-color:#eee; text-align:center;width:100px">등급</td>
                                    <td style="background-color:#fff">
                                        <input id="cphContent_cphContent_chkGrade1" type="checkbox" name="ctl00$ctl00$cphContent$cphContent$chkGrade1"><label for="cphContent_cphContent_chkGrade1">일시조치</label>
                                        <input id="cphContent_cphContent_chkGrade2" type="checkbox" name="ctl00$ctl00$cphContent$cphContent$chkGrade2"><label for="cphContent_cphContent_chkGrade2">시스템조치</label>
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; text-align:center">불량명</td>
                                    <td style="background-color:#fff">
                                        <input name="ctl00$ctl00$cphContent$cphContent$txtFaultName" type="text" id="cphContent_cphContent_txtFaultName" onkeydown="onKeyCheck()">
                                    </td>
                                    <td style="background-color:#eee; text-align:center">사업장</td>
                                    <td style="background-color:#fff" colspan="3">
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk1" type="checkbox" id="cphContent_cphContent_chk1" value="P1"> <label for="cphContent_cphContent_chk1">P1</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk2" type="checkbox" id="cphContent_cphContent_chk2" value="P2-1"> <label for="cphContent_cphContent_chk2">P2-1</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk3" type="checkbox" id="cphContent_cphContent_chk3" value="P2-2"> <label for="cphContent_cphContent_chk3">P2-2</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk4" type="checkbox" id="cphContent_cphContent_chk4" value="P4"> <label for="cphContent_cphContent_chk4">P4</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk5" type="checkbox" id="cphContent_cphContent_chk5" value="PKG A"> <label for="cphContent_cphContent_chk5">PKG A</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk6" type="checkbox" id="cphContent_cphContent_chk6" value="PKG B"> <label for="cphContent_cphContent_chk6">PKG B</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk7" type="checkbox" id="cphContent_cphContent_chk7" value="DPC"> <label for="cphContent_cphContent_chk7">DPC</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk8" type="checkbox" id="cphContent_cphContent_chk8" value="MLB"> <label for="cphContent_cphContent_chk8">MLB</label>
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; width:100px; text-align:center">공정</td>
                                    <td style="background-color:#fff; " colspan="3">
                                        <input name="ctl00$ctl00$cphContent$cphContent$hdnOperID" type="hidden" id="cphContent_cphContent_hdnOperID">
                                        <input name="ctl00$ctl00$cphContent$cphContent$hdnOperName" type="hidden" id="cphContent_cphContent_hdnOperName">
                                        <div id="divOperName" style="float:left;margin-top:3px;margin-left:5px;margin-right:5px;"></div>
                                        <div style="float:left"><input type="button" value="선택" onclick="findRoute()"></div>
                                    </td>
                                    <td style="background-color:#eee; text-align:center"></td>
                                    <td style="background-color:#fff"></td>
                                </tr>

                                <tr style="height:28px">
                                    <td style="background-color:#eee; text-align:center;width:100px">발의자</td>
                                    <td style="background-color:#fff;">
                                        <input name="ctl00$ctl00$cphContent$cphContent$txtInitiator" type="text" id="cphContent_cphContent_txtInitiator" style="width: 70%" onkeydown="onKeyCheck()">
                                        <a onclick="OpenWinEmployee('cphContent_cphContent_txtInitiator', 1)">
                                            <img alt="search" style="vertical-align: middle; cursor:pointer;" src="/Images/Images/Common/Btn/btn_org.gif" width="21" height="18">
                                        </a>
                                    </td>

                                    <td style="background-color:#eee; text-align:center;width:100px">작성자</td>
                                    <td style="background-color:#fff">
                                        <input name="ctl00$ctl00$cphContent$cphContent$txtStep1Name" type="text" id="cphContent_cphContent_txtStep1Name" style="width: 70%">
                                        <a onclick="OpenWinEmployee('cphContent_cphContent_txtStep1Name', 2)">
                                            <img alt="search" style="vertical-align: middle; cursor:pointer;" src="/Images/Images/Common/Btn/btn_org.gif" width="21" height="18">
                                        </a>
                                    </td>
                                    <td style="background-color:#eee; text-align:center;width:100px">유효성담당자</td>
                                    <td style="background-color:#fff">
                                        <input name="ctl00$ctl00$cphContent$cphContent$txtQualityName" type="text" id="cphContent_cphContent_txtQualityName" style="width: 70%" onkeydown="onKeyCheck()">
                                        <a onclick="OpenWinEmployee('cphContent_cphContent_txtQualityName', 3)">
                                            <img alt="search" style="vertical-align: middle; cursor:pointer;" src="/Images/Images/Common/Btn/btn_org.gif" width="21" height="18">
                                        </a>
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; width:100px; text-align:center">발행유형</td>
                                    <td style="background-color:#fff; " colspan="5">
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk11" type="checkbox" id="cphContent_cphContent_chk11" value="A"> <label for="cphContent_cphContent_chk11">프로세스심사(QM)</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk12" type="checkbox" id="cphContent_cphContent_chk12" value="B"> <label for="cphContent_cphContent_chk12">공점심사(QC)</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk13" type="checkbox" id="cphContent_cphContent_chk13" value="C"> <label for="cphContent_cphContent_chk13">고객CAR(QA)</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk14" type="checkbox" id="cphContent_cphContent_chk14" value="D"> <label for="cphContent_cphContent_chk14">내부CAR(QM)</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk15" type="checkbox" id="cphContent_cphContent_chk15" value="E"> <label for="cphContent_cphContent_chk15">OCAP(QC)</label>
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; width:100px; text-align:center">대표공정</td>
                                    <td style="background-color:#fff; " colspan="5">
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk21" type="checkbox" id="cphContent_cphContent_chk21" value="AOI"> <label for="cphContent_cphContent_chk21" style="letter-spacing:-0.8px">AOI</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk22" type="checkbox" id="cphContent_cphContent_chk22" value="DRILL"> <label for="cphContent_cphContent_chk22" style="letter-spacing:-0.8px">DRILL</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk23" type="checkbox" id="cphContent_cphContent_chk23" value="FAB"> <label for="cphContent_cphContent_chk23" style="letter-spacing:-0.8px">FAB</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk24" type="checkbox" id="cphContent_cphContent_chk24" value="IQC"> <label for="cphContent_cphContent_chk24" style="letter-spacing:-0.8px">IQC</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk25" type="checkbox" id="cphContent_cphContent_chk25" value="L-DRILL"> <label for="cphContent_cphContent_chk25" style="letter-spacing:-0.8px">L-DRILL</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk26" type="checkbox" id="cphContent_cphContent_chk26" value="OSP"> <label for="cphContent_cphContent_chk26" style="letter-spacing:-0.8px">OSP</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk27" type="checkbox" id="cphContent_cphContent_chk27" value="PSR"> <label for="cphContent_cphContent_chk27" style="letter-spacing:-0.8px">PSR</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk28" type="checkbox" id="cphContent_cphContent_chk28" value="SOP"> <label for="cphContent_cphContent_chk28" style="letter-spacing:-0.8px">SOP</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk29" type="checkbox" id="cphContent_cphContent_chk29" value="개발"> <label for="cphContent_cphContent_chk29" style="letter-spacing:-0.8px">개발</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk30" type="checkbox" id="cphContent_cphContent_chk30" value="기타"> <label for="cphContent_cphContent_chk30" style="letter-spacing:-0.8px">기타</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk31" type="checkbox" id="cphContent_cphContent_chk31" value="공장불량"> <label for="cphContent_cphContent_chk31" style="letter-spacing:-0.8px">공장불량</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk32" type="checkbox" id="cphContent_cphContent_chk32" value="공정불량"> <label for="cphContent_cphContent_chk32" style="letter-spacing:-0.8px">공정불량</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk33" type="checkbox" id="cphContent_cphContent_chk33" value="도금"> <label for="cphContent_cphContent_chk33" style="letter-spacing:-0.8px">도금</label><br>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk34" type="checkbox" id="cphContent_cphContent_chk34" value="적층"> <label for="cphContent_cphContent_chk34" style="letter-spacing:-0.8px">적층</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk35" type="checkbox" id="cphContent_cphContent_chk35" value="표면처리"> <label for="cphContent_cphContent_chk35" style="letter-spacing:-0.8px">표면처리</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk36" type="checkbox" id="cphContent_cphContent_chk36" value="회로"> <label for="cphContent_cphContent_chk36" style="letter-spacing:-0.8px">회로</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk37" type="checkbox" id="cphContent_cphContent_chk37" value="후공정"> <label for="cphContent_cphContent_chk37" style="letter-spacing:-0.8px">후공정</label>
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; width:100px; text-align:center">대책서접수여부</td>
                                    <td style="background-color:#fff; ">
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk41" type="checkbox" id="cphContent_cphContent_chk41" value="Y"> <label for="cphContent_cphContent_chk41">접수</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk42" type="checkbox" id="cphContent_cphContent_chk42" value="N"> <label for="cphContent_cphContent_chk42">미접수</label>
                                    </td>
                                    <td style="background-color:#eee; width:100px; text-align:center">진행상태</td>
                                    <td style="background-color:#fff; " colspan="3">
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk51" type="checkbox" id="cphContent_cphContent_chk51" value="PROCESS"> <label for="cphContent_cphContent_chk51">진행</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk52" type="checkbox" id="cphContent_cphContent_chk52" value="COMPLETE"> <label for="cphContent_cphContent_chk52">완료</label>
                                        <input name="ctl00$ctl00$cphContent$cphContent$chk53" type="checkbox" id="cphContent_cphContent_chk53" value="DROP"> <label for="cphContent_cphContent_chk53">DROP</label>
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
                </tbody></table>
            </div>    
            <img src="/Images/Images/board/bg_btop1.gif" class="trans tl">
            <img src="/Images/Images/board/bg_btop2.gif" class="trans tr">
            <img src="/Images/Images/board/bg_btop3.gif" class="trans bl">
            <img src="/Images/Images/board/bg_btop4.gif" class="trans br">
        </div>
