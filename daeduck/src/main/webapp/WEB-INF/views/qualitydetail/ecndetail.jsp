<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div class="board_btop" style="height:215px; margin-left:150px">
            <div class="board_search" style="height:175px">
                <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
                    <tbody><tr>
                        <td style="padding-left: 5px;width:1080px">
                            
                            <table border="0" cellpadding="1" cellspacing="1" style="background-color:#ddd">
                                <tbody><tr style="height:28px">
                                    <td style="background-color:#eee; width:100px; text-align:center">계획서</td>
                                    <td style="background-color:#fff; width:380px">
                                        <input name="ctl00$ctl00$cphContent$cphContent$reqdate1" type="text" id="cphContent_cphContent_reqdate1" style="width: 120px" readonly="" onclick="CFN_CalenderPopup(this, '', '', '', 'id'); $('#LaryeCalenderPop').css('top', '66px');" dateformat="dash">
                                        ~ <input name="ctl00$ctl00$cphContent$cphContent$reqdate2" type="text" id="cphContent_cphContent_reqdate2" style="width: 120px" readonly="" onclick="CFN_CalenderPopup(this, '', '', '', 'id'); $('#LaryeCalenderPop').css('top', '66px');" dateformat="dash">
                                    </td>
                                    <td style="background-color:#eee; width:100px; text-align:center">표준변경서</td>
                                    <td style="background-color:#fff; width:180px" colspan="3">
                                        <input name="ctl00$ctl00$cphContent$cphContent$reqdate3" type="text" id="cphContent_cphContent_reqdate3" style="width: 120px" readonly="" onclick="CFN_CalenderPopup(this, '', '', '', 'id'); $('#LaryeCalenderPop').css('top', '66px');" dateformat="dash">
                                        ~ <input name="ctl00$ctl00$cphContent$cphContent$reqdate4" type="text" id="cphContent_cphContent_reqdate4" style="width: 120px" readonly="" onclick="CFN_CalenderPopup(this, '', '', '', 'id'); $('#LaryeCalenderPop').css('top', '66px');" dateformat="dash">
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; width:100px; text-align:center">유효성결과</td>
                                    <td style="background-color:#fff; width:380px" colspan="5">
                                        <input name="ctl00$ctl00$cphContent$cphContent$reqdate5" type="text" id="cphContent_cphContent_reqdate5" style="width: 120px" readonly="" onclick="CFN_CalenderPopup(this, '', '', '', 'id'); $('#LaryeCalenderPop').css('top', '66px');" dateformat="dash">
                                        ~ <input name="ctl00$ctl00$cphContent$cphContent$reqdate6" type="text" id="cphContent_cphContent_reqdate6" style="width: 120px" readonly="" onclick="CFN_CalenderPopup(this, '', '', '', 'id'); $('#LaryeCalenderPop').css('top', '66px');" dateformat="dash">
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; width:100px; text-align:center">공장별</td>
                                    <td style="background-color:#fff; width:380px">
                                        <input id="cphContent_cphContent_chkFactory1" type="checkbox" name="ctl00$ctl00$cphContent$cphContent$chkFactory1"><label for="cphContent_cphContent_chkFactory1">PKG</label>
                                        <input id="cphContent_cphContent_chkFactory2" type="checkbox" name="ctl00$ctl00$cphContent$cphContent$chkFactory2"><label for="cphContent_cphContent_chkFactory2">MLB</label>
                                    </td>
                                    <td style="background-color:#eee; width:100px; text-align:center">자체/외주</td>
                                    <td style="background-color:#fff; width:180px">
                                        <input id="cphContent_cphContent_chkOwn1" type="checkbox" name="ctl00$ctl00$cphContent$cphContent$chkOwn1"><label for="cphContent_cphContent_chkOwn1">자체</label>
                                        <input id="cphContent_cphContent_chkOwn2" type="checkbox" name="ctl00$ctl00$cphContent$cphContent$chkOwn2"><label for="cphContent_cphContent_chkOwn2">외주</label>
                                    </td>
                                    <td style="background-color:#eee; width:100px; text-align:center">문서번호</td>
                                    <td style="background-color:#fff; width:180px">
                                        <input name="ctl00$ctl00$cphContent$cphContent$txtDocNo" type="text" id="cphContent_cphContent_txtDocNo" onkeydown="onKeyCheck()">
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; text-align:center">Grade Class</td>
                                    <td style="background-color: #fff">
                                        <input id="cphContent_cphContent_chkGClass1" type="checkbox" name="ctl00$ctl00$cphContent$cphContent$chkGClass1"><label for="cphContent_cphContent_chkGClass1">Material</label>
                                        <input id="cphContent_cphContent_chkGClass2" type="checkbox" name="ctl00$ctl00$cphContent$cphContent$chkGClass2"><label for="cphContent_cphContent_chkGClass2">Method</label>
                                        <input id="cphContent_cphContent_chkGClass3" type="checkbox" name="ctl00$ctl00$cphContent$cphContent$chkGClass3"><label for="cphContent_cphContent_chkGClass3">Process</label>
                                        <input id="cphContent_cphContent_chkGClass4" type="checkbox" name="ctl00$ctl00$cphContent$cphContent$chkGClass4"><label for="cphContent_cphContent_chkGClass4">New Subcontractor</label>
                                    </td>
                                    <td style="background-color:#eee; text-align:center">등급별</td>
                                    <td style="background-color:#fff" colspan="3">
                                        <input id="cphContent_cphContent_chkGrade1" type="checkbox" name="ctl00$ctl00$cphContent$cphContent$chkGrade1"><label for="cphContent_cphContent_chkGrade1">A</label>
                                        <input id="cphContent_cphContent_chkGrade2" type="checkbox" name="ctl00$ctl00$cphContent$cphContent$chkGrade2"><label for="cphContent_cphContent_chkGrade2">B</label>
                                        <input id="cphContent_cphContent_chkGrade3" type="checkbox" name="ctl00$ctl00$cphContent$cphContent$chkGrade3"><label for="cphContent_cphContent_chkGrade3">C</label>
                                        <input id="cphContent_cphContent_chkGrade4" type="checkbox" name="ctl00$ctl00$cphContent$cphContent$chkGrade4"><label for="cphContent_cphContent_chkGrade4">D</label>
                                        <input id="cphContent_cphContent_chkGrade5" type="checkbox" name="ctl00$ctl00$cphContent$cphContent$chkGrade5"><label for="cphContent_cphContent_chkGrade5">E</label>
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; width:100px; text-align:center">공정명</td>
                                    <td style="background-color:#fff; width:380px" colspan="5">
                                        <input name="ctl00$ctl00$cphContent$cphContent$hdnOperID" type="hidden" id="cphContent_cphContent_hdnOperID">
                                        <input name="ctl00$ctl00$cphContent$cphContent$hdnOperName" type="hidden" id="cphContent_cphContent_hdnOperName">
                                        <div id="divOperName" style="float:left;margin-top:3px;margin-left:5px;margin-right:5px;"></div>
                                        <div style="float:left"><input type="button" value="선택" onclick="findRoute()"></div>
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; text-align:center">기안자</td>
                                    <td style="background-color:#fff">
                                        
                                        <input name="ctl00$ctl00$cphContent$cphContent$initiatorname" type="text" id="cphContent_cphContent_initiatorname" style="width: 100px">
                                        <input name="ctl00$ctl00$cphContent$cphContent$initiatorid" type="hidden" id="cphContent_cphContent_initiatorid" onkeydown="onKeyCheck()">
                                        <a onclick="OpenWinEmployee('cphContent_cphContent_initiatorname')">
                                            <img alt="search" style="vertical-align: middle; cursor:pointer;" src="/Images/Images/Common/Btn/btn_org.gif" width="21" height="18">
                                        </a>
                                    </td>
                                    <td style="background-color:#eee; text-align:center">제목</td>
                                    <td style="background-color:#fff" colspan="3">
                                        <input name="ctl00$ctl00$cphContent$cphContent$txtSubject" type="text" id="cphContent_cphContent_txtSubject" onkeydown="onKeyCheck()">
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
                            <div id="div_setView" style="display:none">
                                <!-- 모두표시 -->
                                <span id="span_viewAll" style="float: right">
                                    <a id="a_viewAll" href="javascript:onclick_View('ALL');"><em class="btn_ws_l">
                                        <span class="btn_ws_r"><strong class="txt_btn_ws">
                                            모두표시</strong></span></em></a>
                                </span>
                                <!-- 표시여부적용 -->
                                <span id="span_viewYN" style="float: right">
                                    <a id="a_viewYN" href="javascript:onclick_View('YN');"><em class="btn_ws_l">
                                        <span class="btn_ws_r"><strong class="txt_btn_ws">
                                            표시여부적용</strong></span></em></a>
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

