<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div class="board_btop" style="height: 295px; margin-left:165px;">
    <div class="board_search" style="height:255px">
        <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <td style="padding-left: 5px;width:880px">
                        <table border="0" cellpadding="1" cellspacing="1" style="background-color:#ddd;width:99%">
                            <tbody>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; text-align:center;width:100px">시정조치요구일</td>
                                    <td style="background-color:#fff;width:190px">
                                        <input name="step2_startDate" type="text" id="step2_startDate" value=""
                                            style="width: 75px" readonly="">
                                        ~<input name="step2_endDate" type="text" id="step2_endDate" value=""
                                            style="width: 75px" readonly="">
                                    </td>
                                    <td style="background-color:#eee; text-align:center;width:100px">유효성확인일</td>
                                    <td style="background-color:#fff;width:190px">
                                        <input name="step4_startDate" type="text" id="step4_startDate"
                                            style="width: 75px" readonly="">
                                        ~<input name="step4_endDate" type="text" id="step4_endDate" style="width: 75px"
                                            readonly="">
                                    </td>
                                    <td style="background-color:#eee; text-align:center;width:100px">대책완료예정일</td>
                                    <td style="background-color:#fff">
                                        <span><input name="" type="text" maxlength="10"
                                                id="cphContent_cphContent_txtCompleteDate" size="15" data-pattern="date"
                                                data-date-disabled="sat,sun" data-date-min="0" required="Required"
                                                onkeydown="return CFN_CheckMaxLength(this, '10')"
                                                class="ime_calender_mode input_must"
                                                onfocus="CFN_RemoveDateFromat('dash'); CFN_FocusOnOff(this,'On')"
                                                onblur="CFN_ConvertDate('dash'); CFN_FocusOnOff(this,'Off')"
                                                onkeypress="CFN_CheckIsDateNum('dash')"
                                                onkeyup="CFN_OnKeyUpIsDate(this)"
                                                onclick="CFN_CalenderPopup(this,'', '', '');" dateformat="dash"
                                                displayday="false" style="vertical-align:middle;text-align:center;">
                                            <img src="/Images/Images/Controls/TextBox/ico_cal.gif" alt="Cal"
                                                onclick="CFN_ImgCalendarBtnClick('cphContent_cphContent_txtCompleteDate')"></span>
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; text-align:center;width:100px">제목</td>
                                    <td style="background-color:#fff;">
                                        <input name="subject" type="text" id="cphContent_cphContent_txtSubject"
                                            onkeydown="onKeyCheck()">
                                    </td>
                                    <td style="background-color:#eee; text-align:center;width:100px">문서번호</td>
                                    <td style="background-color:#fff">
                                        <input name="" type="text" id="cphContent_cphContent_txtDocNo"
                                            onkeydown="onKeyCheck()" style="width:80px;">
                                    </td>
                                    <td style="background-color:#eee; text-align:center;width:100px">등급</td>
                                    <td style="background-color:#fff">
                                        <input id="cphContent_cphContent_chkGrade1" type="checkbox" name="grade"
                                            value="일시조치"><label for="cphContent_cphContent_chkGrade1">일시조치</label>
                                        <input id="cphContent_cphContent_chkGrade2" type="checkbox" name="grade"
                                            value="시스템조치"><label for="cphContent_cphContent_chkGrade2">시스템조치</label>
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; text-align:center">불량명</td>
                                    <td style="background-color:#fff">
                                        <input name="fault_name" type="text" id="cphContent_cphContent_txtFaultName"
                                            onkeydown="onKeyCheck()">
                                    </td>
                                    <td style="background-color:#eee; text-align:center">사업장</td>
                                    <td style="background-color:#fff" colspan="3">
                                        <input name="biz_place" type="checkbox" id="cphContent_cphContent_chk1"
                                            value="P1"> <label for="cphContent_cphContent_chk1">P1</label>
                                        <input name="biz_place" type="checkbox" id="cphContent_cphContent_chk2"
                                            value="P2-1"> <label for="cphContent_cphContent_chk2">P2-1</label>
                                        <input name="biz_place" type="checkbox" id="cphContent_cphContent_chk3"
                                            value="P2-2"> <label for="cphContent_cphContent_chk3">P2-2</label>
                                        <input name="biz_place" type="checkbox" id="cphContent_cphContent_chk4"
                                            value="P4"> <label for="cphContent_cphContent_chk4">P4</label>
                                        <input name="biz_place" type="checkbox" id="cphContent_cphContent_chk5"
                                            value="PKG A"> <label for="cphContent_cphContent_chk5">PKG A</label>
                                        <input name="biz_place" type="checkbox" id="cphContent_cphContent_chk6"
                                            value="PKG B"> <label for="cphContent_cphContent_chk6">PKG B</label>
                                        <input name="biz_place" type="checkbox" id="cphContent_cphContent_chk7"
                                            value="DPC"> <label for="cphContent_cphContent_chk7">DPC</label>
                                        <input name="biz_place" type="checkbox" id="cphContent_cphContent_chk8"
                                            value="MLB"> <label for="cphContent_cphContent_chk8">MLB</label>
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; width:100px; text-align:center">공정</td>
                                    <td style="background-color:#fff; " colspan="3">
                                        <input name="ctl00$ctl00$cphContent$cphContent$hdnOperID" type="hidden"
                                            id="cphContent_cphContent_hdnOperID">
                                        <input name="ctl00$ctl00$cphContent$cphContent$hdnOperName" type="hidden"
                                            id="cphContent_cphContent_hdnOperName">
                                        <div id="divOperName"
                                            style="float:left;margin-top:3px;margin-left:5px;margin-right:5px;"></div>
                                        <div style="float:left"><input type="button" value="선택" onclick="findRoute()">
                                        </div>
                                    </td>
                                    <td style="background-color:#eee; text-align:center"></td>
                                    <td style="background-color:#fff"></td>
                                </tr>

                                <tr style="height:28px">
                                    <td style="background-color:#eee; text-align:center;width:100px">발의자</td>
                                    <td style="background-color:#fff;">
                                        <input name="initiator_name" type="text" id="cphContent_cphContent_txtInitiator"
                                            style="width: 70%" onkeydown="onKeyCheck()">
                                        <a onclick="OpenWinEmployee('cphContent_cphContent_txtInitiator', 1)">
                                            <img alt="search" style="vertical-align: middle; cursor:pointer;"
                                                src="/Images/Images/Common/Btn/btn_org.gif" width="21" height="18">
                                        </a>
                                    </td>

                                    <td style="background-color:#eee; text-align:center;width:100px">작성자</td>
                                    <td style="background-color:#fff">
                                        <input name="rec_step1_name" type="text" id="cphContent_cphContent_txtStep1Name"
                                            style="width: 70%">
                                        <a onclick="OpenWinEmployee('cphContent_cphContent_txtStep1Name', 2)">
                                            <img alt="search" style="vertical-align: middle; cursor:pointer;"
                                                src="/Images/Images/Common/Btn/btn_org.gif" width="21" height="18">
                                        </a>
                                    </td>
                                    <td style="background-color:#eee; text-align:center;width:100px">유효성담당자</td>
                                    <td style="background-color:#fff">
                                        <input name="cs_quality_name" type="text"
                                            id="cphContent_cphContent_txtQualityName" style="width: 70%"
                                            onkeydown="onKeyCheck()">
                                        <a onclick="OpenWinEmployee('cphContent_cphContent_txtQualityName', 3)">
                                            <img alt="search" style="vertical-align: middle; cursor:pointer;"
                                                src="/Images/Images/Common/Btn/btn_org.gif" width="21" height="18">
                                        </a>
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; width:100px; text-align:center">발행유형</td>
                                    <td style="background-color:#fff; " colspan="5">
                                        <input name="simsa_gubun" type="checkbox" id="cphContent_cphContent_chk11"
                                            value="A"> <label for="cphContent_cphContent_chk11">프로세스심사(QM)</label>
                                        <input name="simsa_gubun" type="checkbox" id="cphContent_cphContent_chk12"
                                            value="B"> <label for="cphContent_cphContent_chk12">공점심사(QC)</label>
                                        <input name="simsa_gubun" type="checkbox" id="cphContent_cphContent_chk13"
                                            value="C"> <label for="cphContent_cphContent_chk13">고객CAR(QA)</label>
                                        <input name="simsa_gubun" type="checkbox" id="cphContent_cphContent_chk14"
                                            value="D"> <label for="cphContent_cphContent_chk14">내부CAR(QM)</label>
                                        <input name="simsa_gubun" type="checkbox" id="cphContent_cphContent_chk15"
                                            value="E"> <label for="cphContent_cphContent_chk15">OCAP(QC)</label>
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; width:100px; text-align:center">대표공정</td>
                                    <td style="background-color:#fff; " colspan="5">
                                        <input name="main_route_name" type="checkbox" id="main_route_name1" value="AOI">
                                        <label for="main_route_name1" style="letter-spacing:-0.8px">AOI</label>
                                        <input name="main_route_name" type="checkbox" id="main_route_name2"
                                            value="DRILL"> <label for="main_route_name2"
                                            style="letter-spacing:-0.8px">DRILL</label>
                                        <input name="main_route_name" type="checkbox" id="main_route_name3" value="FAB">
                                        <label for="main_route_name3" style="letter-spacing:-0.8px">FAB</label>
                                        <input name="main_route_name" type="checkbox" id="main_route_name4" value="IQC">
                                        <label for="main_route_name4" style="letter-spacing:-0.8px">IQC</label>
                                        <input name="main_route_name" type="checkbox" id="main_route_name5"
                                            value="L-DRILL"><label for="main_route_name5"
                                            style="letter-spacing:-0.8px">L-DRILL</label>
                                        <input name="main_route_name" type="checkbox" id="main_route_name6" value="OSP">
                                        <label for="main_route_name6" style="letter-spacing:-0.8px">OSP</label>
                                        <input name="main_route_name" type="checkbox" id="main_route_name7" value="PSR">
                                        <label for="main_route_name7" style="letter-spacing:-0.8px">PSR</label>
                                        <input name="main_route_name" type="checkbox" id="main_route_name8" value="SOP">
                                        <label for="main_route_name8" style="letter-spacing:-0.8px">SOP</label>
                                        <input name="main_route_name" type="checkbox" id="main_route_name9" value="개발">
                                        <label for="main_route_name9" style="letter-spacing:-0.8px">개발</label>
                                        <input name="main_route_name" type="checkbox" id="main_route_name10" value="기타">
                                        <label for="main_route_name10" style="letter-spacing:-0.8px">기타</label>
                                        <input name="main_route_name" type="checkbox" id="main_route_name11"
                                            value="공장불량"> <label for="main_route_name11"
                                            style="letter-spacing:-0.8px">공장불량</label>
                                        <input name="main_route_name" type="checkbox" id="main_route_name12"
                                            value="공정불량"> <label for="main_route_name12"
                                            style="letter-spacing:-0.8px">공정불량</label>
                                        <input name="main_route_name" type="checkbox" id="main_route_name13" value="도금">
                                        <label for="main_route_name13" style="letter-spacing:-0.8px">도금</label><br>
                                        <input name="main_route_name" type="checkbox" id="main_route_name14" value="적층">
                                        <label for="main_route_name14" style="letter-spacing:-0.8px">적층</label>
                                        <input name="main_route_name" type="checkbox" id="main_route_name15"
                                            value="표면처리"> <label for="main_route_name15"
                                            style="letter-spacing:-0.8px">표면처리</label>
                                        <input name="main_route_name" type="checkbox" id="main_route_name16" value="회로">
                                        <label for="main_route_name16" style="letter-spacing:-0.8px">회로</label>
                                        <input name="main_route_name" type="checkbox" id="main_route_name17"
                                            value="후공정"> <label for="main_route_name17"
                                            style="letter-spacing:-0.8px">후공정</label>
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; width:100px; text-align:center">대책서접수여부</td>
                                    <td style="background-color:#fff; ">
                                        <input name="" type="checkbox" id="cphContent_cphContent_chk41" value="Y">
                                        <label for="cphContent_cphContent_chk41">접수</label>
                                        <input name="" type="checkbox" id="cphContent_cphContent_chk42" value="N">
                                        <label for="cphContent_cphContent_chk42">미접수</label>
                                    </td>
                                    <td style="background-color:#eee; width:100px; text-align:center">진행상태</td>
                                    <td style="background-color:#fff; " colspan="3">
                                        <input name="status" type="checkbox" id="cphContent_cphContent_chk51"
                                            value="PROCESS"> <label for="cphContent_cphContent_chk51">진행</label>
                                        <input name="status" type="checkbox" id="cphContent_cphContent_chk52"
                                            value="COMPLETE"> <label for="cphContent_cphContent_chk52">완료</label>
                                        <input name="status" type="checkbox" id="cphContent_cphContent_chk53"
                                            value="DROP"> <label for="cphContent_cphContent_chk53">DROP</label>
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
                    <td>
                        <button type="button" onClick="doSetting('${value.colflag}','${value.collection}')">설정</button>
                    </td>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<script>
    // 품질관리 상세 검색 설정
    function doSetting(colflag, collection) {
        if ($('#step2_startDate').val() != '' || $('#step2_endDate').val() != '') {


            if ($('#step2_startDate').val() == '') {
                alert('시작 날짜를 입력하세요');
                return;
            }
            if ($('#step2_endDate').val() == '') {
                alert('마지막 날짜를 입력하세요');
                return;
            }

            if (!compareStringNum($("#step2_startDate").val(), $("#step2_endDate").val(), ".")) {
                alert("기간이 올바르지 않습니다. 시작일이 종료일보다 작거나 같도록 하세요.");
                $("#step2_startDate").focus();
                return;
            }
        }

        if ($('#step4_startDate').val() != '' || $('#step4_endDate').val() != '') {
            if ($('#step4_startDate').val() == '') {
                alert('시작 날짜를 입력하세요');
                return;
            }
            if ($('#step4_endDate').val() == '') {
                alert('마지막 날짜를 입력하세요');
                return;
            }

            if (!compareStringNum($("#step4_startDate").val(), $("#step4_endDate").val(), ".")) {
                alert("기간이 올바르지 않습니다. 시작일이 종료일보다 작거나 같도록 하세요.");
                $("#step4_startDate").focus();
                return;
            }
        }
        doQualitySearch(colflag, collection);

    }
</script>