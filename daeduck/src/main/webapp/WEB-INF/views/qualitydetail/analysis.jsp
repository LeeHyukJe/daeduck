<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div class="board_btop" style="height:130px; margin-left:170px;">
            <div class="board_search" style="height:90px">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tbody><tr>
                        <td style="padding-left: 5px;width:960px">
                            <table border="0" cellpadding="1" cellspacing="1" style="background-color:#ddd;width:95%">
                                <tbody><tr style="height:28px">
                                    <td style="background-color:#eee; text-align:center;width:100px">의뢰제목</td>
                                    <td style="background-color:#fff;width:160px">
                                        <input name="subject" type="text" id="SUBJECT">
                                    </td>
                                    <td style="background-color:#eee; text-align:center;width:100px">의뢰자</td>
                                    <td style="background-color:#fff">
                                        <input name="initiator_name" type="text" id="initiator_name" onkeydown="onKeyCheck()">
                                    </td>
                                    <td style="background-color:#eee; width:100px; text-align:center">완료요청일자</td>
                                    <td style="background-color:#fff; width:280px">
                                        <span><input name="recompl_startDate" type="text" maxlength="10" id="recompl_startDate" size="15" data-pattern="date" data-date-disabled="sat,sun" data-date-min="0" onkeydown="return CFN_CheckMaxLength(this, '10')" class="ime_calender_mode" onfocus="CFN_RemoveDateFromat('dash')" onblur="CFN_ConvertDate('dash')" onkeypress="CFN_CheckIsDateNum('dash')" onkeyup="CFN_OnKeyUpIsDate(this)"></span> ~
                                        <span><input name="recompl_endDate" type="text" maxlength="10" id="recompl_endDate" size="15" data-pattern="date" data-date-disabled="sat,sun" data-date-min="0" onkeydown="return CFN_CheckMaxLength(this, '10')" class="ime_calender_mode" onfocus="CFN_RemoveDateFromat('dash')" onblur="CFN_ConvertDate('dash')" onkeypress="CFN_CheckIsDateNum('dash')" onkeyup="CFN_OnKeyUpIsDate(this)" ></span>
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                   <td style="background-color:#eee; text-align:center">분석담당자</td>
                                    <td style="background-color:#fff">
                                        <input name="manager_name" type="text" id="manager_name" onkeydown="onKeyCheck()">
                                    </td>
                                    <td style="background-color:#eee; text-align:center"></td>
                                    <td style="background-color:#fff"></td>
                                    <td style="background-color:#eee; text-align:center">분석의뢰일자</td>
                                    <td style="background-color:#fff">
                                        <span><input name="step1_startDate" type="text" maxlength="10" id="step1_startDate" size="15" data-pattern="date" data-date-disabled="sat,sun" data-date-min="0" onkeydown="return CFN_CheckMaxLength(this, '10')" class="ime_calender_mode" onfocus="CFN_RemoveDateFromat('dash')" onblur="CFN_ConvertDate('dash')" onkeypress="CFN_CheckIsDateNum('dash')" onkeyup="CFN_OnKeyUpIsDate(this)"></span> ~
                                        <span><input name="step1_endDate" type="text" maxlength="10" id="step1_endDate" size="15" data-pattern="date" data-date-disabled="sat,sun" data-date-min="0" onkeydown="return CFN_CheckMaxLength(this, '10')" class="ime_calender_mode" onfocus="CFN_RemoveDateFromat('dash')" onblur="CFN_ConvertDate('dash')" onkeypress="CFN_CheckIsDateNum('dash')" onkeyup="CFN_OnKeyUpIsDate(this)"></span>
                                    </td>
                                </tr>
                            </tbody>
                            </table>
                        </td>
                        <td>
                        <button type="button" onClick="doSetting('${value.colflag}','${value.collection}')">설정</button>
                        </td>                          
                    </tr>
                </tbody></table>
            </div>    
        </div>

        <script>
    // 품질관리 상세 검색 설정
    function doSetting(colflag, collection) {
        if ($('#recompl_startDate').val() != '' || $('#recompl_endDate').val() != '') {


            if ($('#recompl_startDate').val() == '') {
                alert('시작 날짜를 입력하세요');
                return;
            }
            if ($('#recompl_endDate').val() == '') {
                alert('마지막 날짜를 입력하세요');
                return;
            }

            if (!compareStringNum($("#recompl_startDate").val(), $("#recompl_endDate").val(), ".")) {
                alert("기간이 올바르지 않습니다. 시작일이 종료일보다 작거나 같도록 하세요.");
                $("#recompl_startDate").focus();
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