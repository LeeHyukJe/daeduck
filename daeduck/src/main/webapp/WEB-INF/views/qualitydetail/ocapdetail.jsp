<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div class="board_btop">
            <div class="board_search">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tbody><tr> 
                        
                        <td style="padding-left: 5px;">
                            <div class="jquery-selectbox jquery-custom-selectboxes-replaced" style="width: 118px;"><div class="jquery-selectbox-moreButton"></div><div class="jquery-selectbox-list jquery-custom-selectboxes-replaced-list" style="width: 118px; height: 57px; display: none;"><span class="jquery-selectbox-item value-ALL item-0">검색조건</span><span class="jquery-selectbox-item value-SUBJECT item-1">제목</span><span class="jquery-selectbox-item value-INITIATOR_NAME item-2">기안자</span></div><span class="jquery-selectbox-currentItem">검색조건</span><select name="ctl00$ctl00$cphContent$cphContent$ddlSearchColumn" id="cphContent_cphContent_ddlSearchColumn" class="JquerySelectBox" style="width: 120px; display: none;">
		<option selected="selected" value="ALL">검색조건</option>
		<option value="SUBJECT">제목</option>
		<option value="INITIATOR_NAME">기안자</option>

	</select></div>
                            <input name="ctl00$ctl00$cphContent$cphContent$txtSearchKeyword" type="text" id="cphContent_cphContent_txtSearchKeyword" onkeypress="CapitalEx_EnterSearchText();">
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
                    </tr>
                </tbody></table>
            </div>    
            <img src="/Images/Images/board/bg_btop1.gif" class="trans tl">
            <img src="/Images/Images/board/bg_btop2.gif" class="trans tr">
            <img src="/Images/Images/board/bg_btop3.gif" class="trans bl">
            <img src="/Images/Images/board/bg_btop4.gif" class="trans br">
        </div>

