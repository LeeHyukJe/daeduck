<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div class="board_btop" style="height:305px">
            <div class="board_search" style="height:265px;">
                <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
                    <tbody><tr>
                        <td style="padding-left: 5px; width:70%">
                            <table border="0" cellpadding="1" cellspacing="1" style="background-color:#ddd;width:100%">
                                <tbody><tr style="height:28px">
                                    <td style="background-color:#eee; text-align:center;width:40%;">Plant</td>
                                    <td style="background-color:#fff;width:60%;">
                                        <select name="ctl00$ctl00$cphContent$cphContent$ddlPlant" id="cphContent_cphContent_ddlPlant" style="width:85px;margin-left:5px;">
		<option selected="selected" value="">선택하세요</option>
		<option value="PKG_A">PKG_A</option>
		<option value="PKG_B">PKG_B</option>
		<option value="DPC">DPC</option>
		<option value="MLB">MLB</option>
		<option value="모바일">모바일</option>
		<option value="외주협력사">외주협력사</option>

	</select>
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                   <td style="background-color:#eee; text-align:center">공정명</td>
                                    <td style="background-color:#fff">
                                        <select name="ctl00$ctl00$cphContent$cphContent$ddlProcessName" id="cphContent_cphContent_ddlProcessName" style="width:85px;margin-left:5px;">
		<option selected="selected" value="">선택하세요</option>
		<option value="동도금 공정">동도금 공정</option>
		<option value="이미지 공정">이미지 공정</option>
		<option value="PSR 공정">PSR 공정</option>
		<option value="검사 공정(AOI)">검사 공정(AOI)</option>
		<option value="검사 공정(최종검사 Issue)">검사 공정(최종검사 Issue)</option>
		<option value="적층 공정">적층 공정</option>
		<option value="Drill 공정">Drill 공정</option>
		<option value="표면처리공정">표면처리공정</option>
		<option value="FAB 공정">FAB 공정</option>
		<option value="협력업체(외주)">협력업체(외주)</option>

	</select>
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                   <td style="background-color:#eee; text-align:center">물성(FT-IR 측정 결과)</td>
                                    <td style="background-color:#fff">
                                        <input name="ctl00$ctl00$cphContent$cphContent$txtFTIR_Result" type="text" id="cphContent_cphContent_txtFTIR_Result" style="width:95%;">
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                   <td style="background-color:#eee; text-align:center">EDS 분석 결과</td>
                                    <td style="background-color:#fff">
                                        <table class="table_10">
                                            <tbody><tr>
                                                <td><input type="checkbox" id="chk_H" name="chk_H"> H</td>
                                                <td><input type="checkbox" id="chk_HE" name="chk_HE"> HE</td>
                                                <td><input type="checkbox" id="chk_Li" name="chk_Li"> Li</td>
                                                <td><input type="checkbox" id="chk_Be" name="chk_Be"> Be</td>
                                                <td><input type="checkbox" id="chk_B" name="chk_B"> B</td>
                                                <td><input type="checkbox" id="chk_C" name="chk_C"> C</td>
                                                <td><input type="checkbox" id="chk_N" name="chk_N"> N</td>
                                                <td><input type="checkbox" id="chk_O" name="chk_O"> O</td>
                                                <td><input type="checkbox" id="chk_F" name="chk_F"> F</td>
                                                <td><input type="checkbox" id="chk_Ne" name="chk_Ne"> Ne</td>
                                                <td><input type="checkbox" id="chk_Na" name="chk_Na"> Na</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" id="chk_Mg" name="chk_Mg"> Mg</td>
                                                <td><input type="checkbox" id="chk_Al" name="chk_Al"> Al</td>
                                                <td><input type="checkbox" id="chk_Si" name="chk_Si"> Si</td>
                                                <td><input type="checkbox" id="chk_P" name="chk_P"> P</td>
                                                <td><input type="checkbox" id="chk_S" name="chk_S"> S</td>
                                                <td><input type="checkbox" id="chk_Cl" name="chk_Cl"> Cl</td>
                                                <td><input type="checkbox" id="chk_Ar" name="chk_Ar"> Ar</td>
                                                <td><input type="checkbox" id="chk_K" name="chk_K"> K</td>
                                                <td><input type="checkbox" id="chk_Ca" name="chk_Ca"> Ca</td>
                                                <td><input type="checkbox" id="chk_Ti" name="chk_Ti"> Ti</td>
                                                <td><input type="checkbox" id="chk_Cr" name="chk_Cr"> Cr</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" id="chk_Mn" name="chk_Mn"> Mn</td>
                                                <td><input type="checkbox" id="chk_Fe" name="chk_Fe"> Fe</td>
                                                <td><input type="checkbox" id="chk_Co" name="chk_Co"> Co</td>
                                                <td><input type="checkbox" id="chk_Ni" name="chk_Ni"> Ni</td>
                                                <td><input type="checkbox" id="chk_Cu" name="chk_Cu"> Cu</td>
                                                <td><input type="checkbox" id="chk_Zn" name="chk_Zn"> Zn</td>
                                                <td><input type="checkbox" id="chk_Ga" name="chk_Ga"> Ga</td>
                                                <td><input type="checkbox" id="chk_Ge" name="chk_Ge"> Ge</td>
                                                <td><input type="checkbox" id="chk_As" name="chk_As"> As</td>
                                                <td><input type="checkbox" id="chk_Se" name="chk_Se"> Se</td>
                                                <td><input type="checkbox" id="chk_Br" name="chk_Br"> Br</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" id="chk_Pd" name="chk_Pd"> Pd</td>
                                                <td><input type="checkbox" id="chk_Ag" name="chk_Ag"> Ag</td>
                                                <td><input type="checkbox" id="chk_Cd" name="chk_Cd"> Cd</td>
                                                <td><input type="checkbox" id="chk_In" name="chk_In"> In</td>
                                                <td><input type="checkbox" id="chk_Sn" name="chk_Sn"> Sn</td>
                                                <td><input type="checkbox" id="chk_I" name="chk_I"> I</td>
                                                <td><input type="checkbox" id="chk_Ba" name="chk_Ba"> Ba</td>
                                                <td><input type="checkbox" id="chk_W" name="chk_W"> W</td>
                                                <td><input type="checkbox" id="chk_Pt" name="chk_Pt"> Pt</td>
                                                <td><input type="checkbox" id="chk_Au" name="chk_Au"> Au</td>
                                                <td><input type="checkbox" id="chk_Pb" name="chk_Pb"> Pb</td>
                                            </tr>
                                        </tbody></table>
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                   <td style="background-color:#eee; text-align:center">Entry No.</td>
                                    <td style="background-color:#fff">
                                        <input name="ctl00$ctl00$cphContent$cphContent$txtEntryNo" type="text" id="cphContent_cphContent_txtEntryNo" style="width:95%;">
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                   <td style="background-color:#eee; text-align:center">이물 색상</td>
                                    <td style="background-color:#fff">
                                        <input name="ctl00$ctl00$cphContent$cphContent$ForeignColor" type="text" id="cphContent_cphContent_ForeignColor" style="width:95%;">
                                    </td>
                                </tr>
                            </tbody></table>
                        </td>
                        <td style="width:30%">
                            <a onclick="return fn_GoSavePage();" id="cphContent_cphContent_LinkButton1" href="javascript:__doPostBack('ctl00$ctl00$cphContent$cphContent$LinkButton1','')">
                                <em class="btn_search_l" style="margin-left:20px;">
                                    <span class="btn_search_r" id="spnBtnSave">
                                        <strong class="txt_btn_search"><img src="/Images/images/Board/ico_search.gif" alt="" class="ico_btn">
                                            등록
                                        </strong>
                                    </span>
                                </em>
                            </a>
                            <a onclick="return fn_ChkCondition();" id="cphContent_cphContent_lbnSearch" href="javascript:__doPostBack('ctl00$ctl00$cphContent$cphContent$lbnSearch','')">
                                <em class="btn_search_l" style="margin-left:10px;">
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

