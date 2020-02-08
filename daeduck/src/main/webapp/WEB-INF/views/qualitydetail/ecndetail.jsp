<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div class="board_btop" style="height:215px; margin-left:150px">
    <div class="board_search" style="height:175px">
        <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
            <tbody>
                <tr>
                    <td style="padding-left: 5px;width:1080px">

                        <table border="0" cellpadding="1" cellspacing="1" style="background-color:#ddd">
                            <tbody>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; width:100px; text-align:center">계획서</td>
                                    <td style="background-color:#fff; width:380px">
                                        <input name="step1_startDate" type="text" id="step1_startDate"
                                            style="width: 120px" readonly="">
                                        ~ <input name="step1_endDate" type="text" id="step1_endDate"
                                            style="width: 120px" readonly="">
                                    </td>
                                    <td style="background-color:#eee; width:100px; text-align:center">표준변경서</td>
                                    <td style="background-color:#fff; width:180px" colspan="3">
                                        <input name="step6_startDate" type="text" id="step6_startDate"
                                            style="width: 120px" readonly="">
                                        ~ <input name="step6_endDate" type="text" id="step6_endDate"
                                            style="width: 120px" readonly="">
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; width:100px; text-align:center">유효성결과</td>
                                    <td style="background-color:#fff; width:380px" colspan="5">
                                        <input name="step7_startDate" type="text" id="step7_startDate"
                                            style="width: 120px" readonly="">
                                        ~ <input name="step7_endDate" type="text" id="step7_endDate"
                                            style="width: 120px" readonly="">
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; width:100px; text-align:center">공장별</td>
                                    <td style="background-color:#fff; width:380px">
                                        <input id="factory_id1" type="checkbox" name="factory_id" value="PKG"><label
                                            for="cphContent_cphContent_chkFactory1">PKG</label>
                                        <input id="factory_id2" type="checkbox" name="factory_id" value="MLB"><label
                                            for="cphContent_cphContent_chkFactory2">MLB</label>
                                    </td>
                                    <td style="background-color:#eee; width:100px; text-align:center">자체/외주</td>
                                    <td style="background-color:#fff; width:180px">
                                        <input id="own_outsourced1" type="checkbox" name="own_outsourced"
                                            value="자체"><label for="cphContent_cphContent_chkOwn1">자체</label>
                                        <input id="own_outsourced2" type="checkbox" name="own_outsourced"
                                            value="외주"><label for="cphContent_cphContent_chkOwn2">외주</label>
                                    </td>
                                    <td style="background-color:#eee; width:100px; text-align:center">문서번호</td>
                                    <td style="background-color:#fff; width:180px">
                                        <input name="doc_no" type="text" id="cphContent_cphContent_txtDocNo"
                                            onkeydown="onKeyCheck()">
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; text-align:center">Grade Class</td>
                                    <td style="background-color: #fff">
                                        <input id="grade_class1" type="checkbox" name="grade_class"
                                            value="Material"><label
                                            for="cphContent_cphContent_chkGClass1">Material</label>
                                        <input id="grade_class2" type="checkbox" name="grade_class"
                                            value="Method"><label for="cphContent_cphContent_chkGClass2">Method</label>
                                        <input id="grade_class3" type="checkbox" name="grade_class"
                                            value="Process"><label
                                            for="cphContent_cphContent_chkGClass3">Process</label>
                                        <input id="grade_class4" type="checkbox" name="grade_class"
                                            value="New Subcontractor"><label for="cphContent_cphContent_chkGClass4">New
                                            Subcontractor</label>
                                    </td>
                                    <td style="background-color:#eee; text-align:center">등급별</td>
                                    <td style="background-color:#fff" colspan="3">
                                        <input id="grade1" type="checkbox" name="grade" value="A"><label
                                            for="cphContent_cphContent_chkGrade1">A</label>
                                        <input id="grade2" type="checkbox" name="grade" value="B"><label
                                            for="cphContent_cphContent_chkGrade2">B</label>
                                        <input id="grade3" type="checkbox" name="grade" value="C"><label
                                            for="cphContent_cphContent_chkGrade3">C</label>
                                        <input id="grade4" type="checkbox" name="grade" value="D"><label
                                            for="cphContent_cphContent_chkGrade4">D</label>
                                        <input id="grade5" type="checkbox" name="grade" value="E"><label
                                            for="cphContent_cphContent_chkGrade5">E</label>
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; width:100px; text-align:center">공정명</td>
                                    <td style="background-color:#fff; width:380px" colspan="5">

                                        <input name="route_name" type="hidden" id="cphContent_cphContent_hdnOperName">
                                        <div id="divOperName"
                                            style="float:left;margin-top:3px;margin-left:5px;margin-right:5px;"></div>
                                        <div style="float:left"><input type="button" value="선택" onclick="findRoute()">
                                        </div>
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <td style="background-color:#eee; text-align:center">기안자</td>
                                    <td style="background-color:#fff">

                                        <input name="initiator_name" type="hidden"
                                            id="cphContent_cphContent_initiatorid" onkeydown="onKeyCheck()">
                                        <a onclick="OpenWinEmployee('cphContent_cphContent_initiatorname')">
                                            <img alt="search" style="vertical-align: middle; cursor:pointer;"
                                                src="/Images/Images/Common/Btn/btn_org.gif" width="21" height="18">
                                        </a>
                                    </td>
                                    <td style="background-color:#eee; text-align:center">제목</td>
                                    <td style="background-color:#fff" colspan="3">
                                        <input name="subject" type="text" id="cphContent_cphContent_txtSubject"
                                            onkeydown="onKeyCheck()">
                                    </td>
                                    <td>
                                        <button type="button"
                                            onClick="doSetting('${value.colflag}','${value.collection}')">설정</button>
                                    </td>
                                </tr>

                            </tbody>

                        </table>
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

    if($('#step7_startDate').val() !='' || $('#step7_endDate').val() !=''){
        if($('#step7_startDate').val() == ''){
		     alert('시작 날짜를 입력하세요');
		     return;
	      }
	     if($('#step7_endDate').val() == ''){
		     alert('마지막 날짜를 입력하세요');
		     return;
         }
         
         if(!compareStringNum($("#step7_startDate").val(), $("#step7_endDate").val(), ".")) {
		     alert("기간이 올바르지 않습니다. 시작일이 종료일보다 작거나 같도록 하세요.");
		     $("#step7_startDate").focus();
		     return;
         }
    }
   doQualitySearch(colflag, collection);

}
</script>