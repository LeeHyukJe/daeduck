<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div class="board_btop" style="height:130px">
            <div class="board_search" style="height:90px">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tbody><tr>
                        <td style="padding-left: 5px;width:850px">
                            <table border="0" cellpadding="1" cellspacing="1" style="background-color:#ddd;width:99%">
                                <colgroup>
                                    <col style="width: 13%">
                                    <col style="width: 37%">
                                    <col style="width: 13%">
                                    <col style="width: 37%">
                                </colgroup>
                                <tbody><tr style="height:28px">
                                    <th style="background-color:#eee;">제조사</th>
                                    <td style="background-color:#fff;">
                                        <input name="ctl00$ctl00$cphContent$cphContent$Manufacturer" type="text" id="cphContent_cphContent_Manufacturer" style="width: 80%" onkeydown="fn_Enter();">
                                    </td>
                                    <th style="background-color:#eee;">자재명</th>
                                    <td style="background-color:#fff;">
                                        <input name="ctl00$ctl00$cphContent$cphContent$MaterialsName" type="text" id="cphContent_cphContent_MaterialsName" style="width: 80%" onkeydown="fn_Enter();">
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    
                                    <th style="background-color:#eee;">자재유형</th>
                                    <td style="background-color:#fff;">
                                        <input name="ctl00$ctl00$cphContent$cphContent$MaterialsType" type="text" id="cphContent_cphContent_MaterialsType" style="width: 80%" onkeydown="fn_Enter();">
                                    </td>
                                    <th style="background-color:#eee;">기안자</th>
                                    <td style="background-color:#fff;">
                                        <input name="ctl00$ctl00$cphContent$cphContent$Initiatorname" type="text" id="cphContent_cphContent_Initiatorname" style="width: 70%">
                                        <input name="ctl00$ctl00$cphContent$cphContent$initiatorid" type="hidden" id="cphContent_cphContent_initiatorid">
                                        <a onclick="OpenWinEmployee('cphContent_cphContent_Initiatorname')">
                                            <img alt="search" style="vertical-align: middle; cursor:pointer;" src="/Images/Images/Common/Btn/btn_org.gif" width="21" height="18">
                                        </a>
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <th style="background-color:#eee;">제목</th>
                                    <td style="background-color:#fff;" colspan="3">
                                        <input name="ctl00$ctl00$cphContent$cphContent$Subject" type="text" id="cphContent_cphContent_Subject" style="width: 80%" onkeydown="fn_Enter();">
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