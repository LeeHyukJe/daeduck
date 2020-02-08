<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div class="board_btop" style="height:130px; margin-left:170px;">
    <div class="board_search" style="height:90px">
        <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <td style="padding-left: 5px;width:850px">
                        <table border="0" cellpadding="1" cellspacing="1" style="background-color:#ddd;width:99%">
                            <colgroup>
                                <col style="width: 13%">
                                <col style="width: 37%">
                                <col style="width: 13%">
                                <col style="width: 37%">
                            </colgroup>
                            <tbody>
                                <tr style="height:28px">
                                    <th style="background-color:#eee;">제조사</th>
                                    <td style="background-color:#fff;">
                                        <input name="manufacturer" type="text" id="cphContent_cphContent_Manufacturer"
                                            style="width: 80%" onkeydown="fn_Enter();">
                                    </td>
                                    <th style="background-color:#eee;">자재명</th>
                                    <td style="background-color:#fff;">
                                        <input name="materialsname" type="text" id="materialsname" style="width: 80%"
                                            onkeydown="fn_Enter();">
                                    </td>
                                </tr>
                                <tr style="height:28px">

                                    <th style="background-color:#eee;">자재유형</th>
                                    <td style="background-color:#fff;">
                                        <input name="materialstype" type="text" id="materialstype" style="width: 80%"
                                            onkeydown="fn_Enter();">
                                    </td>
                                    <th style="background-color:#eee;">기안자</th>
                                    <td style="background-color:#fff;">
                                        <input name="displayName" type="text"
                                            id="displayName" style="width: 70%">
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                    <th style="background-color:#eee;">제목</th>
                                    <td style="background-color:#fff;" colspan="3">
                                        <input name="subject" type="text"
                                            id="subject" style="width: 80%"
                                            onkeydown="fn_Enter();">
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