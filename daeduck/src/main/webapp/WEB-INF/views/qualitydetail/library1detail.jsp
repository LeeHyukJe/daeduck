<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div class="board_btop" style="height:305px; margin-left:170px;">
            <div class="board_search" style="height:265px;">
                <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
                    <tbody><tr>
                        <td style="padding-left: 5px; width:70%">
                            <table border="0" cellpadding="1" cellspacing="1" style="background-color:#ddd;width:100%">
                                <tbody><tr style="height:28px">
                                    <td style="background-color:#eee; text-align:center;width:40%;">Plant</td>
                                    <td style="background-color:#fff;width:60%;">
                                        <select name="plant" id="plant" style="width:85px;margin-left:5px;">
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
                                        <select name="processName" id="processName" style="width:85px;margin-left:5px;">
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
                                        <input name="ftir_result" type="text" id="ftir_result" style="width:95%;">
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                   <td style="background-color:#eee; text-align:center">EDS 분석 결과</td>
                                    <td style="background-color:#fff">
                                        <table class="table_10">
                                            <tbody><tr>
                                                <td><input type="checkbox" id="chk_H"   name="eds" value="H"> H</td>
                                                <td><input type="checkbox" id="chk_HE"  name="eds" value="HE"> HE</td>
                                                <td><input type="checkbox" id="chk_Li"  name="eds" value="Li"> Li</td>
                                                <td><input type="checkbox" id="chk_Be"  name="eds" value="Be"> Be</td>
                                                <td><input type="checkbox" id="chk_B"   name="eds" value="B"> B</td>
                                                <td><input type="checkbox" id="chk_C"   name="eds" value="C"> C</td>
                                                <td><input type="checkbox" id="chk_N"   name="eds" value="N"> N</td>
                                                <td><input type="checkbox" id="chk_O"   name="eds" value="O"> O</td>
                                                <td><input type="checkbox" id="chk_F"   name="eds" value="F"> F</td>
                                                <td><input type="checkbox" id="chk_Ne"  name="eds" value="Ne"> Ne</td>
                                                <td><input type="checkbox" id="chk_Na"  name="eds" value="Na"> Na</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" id="chk_Mg" name="eds" value="Mg"> Mg</td>
                                                <td><input type="checkbox" id="chk_Al" name="eds" value="Al"> Al</td>
                                                <td><input type="checkbox" id="chk_Si" name="eds" value="Si"> Si</td>
                                                <td><input type="checkbox" id="chk_P"  name="eds" value="P"> P</td>
                                                <td><input type="checkbox" id="chk_S"  name="eds" value="S"> S</td>
                                                <td><input type="checkbox" id="chk_Cl" name="eds" value="Cl"> Cl</td>
                                                <td><input type="checkbox" id="chk_Ar" name="eds" value="Ar"> Ar</td>
                                                <td><input type="checkbox" id="chk_K"  name="eds" value="K"> K</td>
                                                <td><input type="checkbox" id="chk_Ca" name="eds" value="Ca"> Ca</td>
                                                <td><input type="checkbox" id="chk_Ti" name="eds" value="Ti"> Ti</td>
                                                <td><input type="checkbox" id="chk_Cr" name="eds" value="Cr"> Cr</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" id="chk_Mn" name="eds" value="Mn"> Mn</td>
                                                <td><input type="checkbox" id="chk_Fe" name="eds" value="Fe"> Fe</td>
                                                <td><input type="checkbox" id="chk_Co" name="eds" value="Co"> Co</td>
                                                <td><input type="checkbox" id="chk_Ni" name="eds" value="Ni"> Ni</td>
                                                <td><input type="checkbox" id="chk_Cu" name="eds" value="Cu"> Cu</td>
                                                <td><input type="checkbox" id="chk_Zn" name="eds" value="Zn"> Zn</td>
                                                <td><input type="checkbox" id="chk_Ga" name="eds" value="Ga"> Ga</td>
                                                <td><input type="checkbox" id="chk_Ge" name="eds" value="Ge"> Ge</td>
                                                <td><input type="checkbox" id="chk_As" name="eds" value="As"> As</td>
                                                <td><input type="checkbox" id="chk_Se" name="eds" value="Se"> Se</td>
                                                <td><input type="checkbox" id="chk_Br" name="eds" value="Br"> Br</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" id="chk_Pd" name="eds" value="Pd"> Pd</td>
                                                <td><input type="checkbox" id="chk_Ag" name="eds" value="Ag"> Ag</td>
                                                <td><input type="checkbox" id="chk_Cd" name="eds" value="Cd"> Cd</td>
                                                <td><input type="checkbox" id="chk_In" name="eds" value="In"> In</td>
                                                <td><input type="checkbox" id="chk_Sn" name="eds" value="Sn"> Sn</td>
                                                <td><input type="checkbox" id="chk_I"  name="eds"  value="I">  I</td>
                                                <td><input type="checkbox" id="chk_Ba" name="eds" value="Ba"> Ba</td>
                                                <td><input type="checkbox" id="chk_W"  name="eds"  value="W">  W</td>
                                                <td><input type="checkbox" id="chk_Pt" name="eds" value="Pt"> Pt</td>
                                                <td><input type="checkbox" id="chk_Au" name="eds" value="Au"> Au</td>
                                                <td><input type="checkbox" id="chk_Pb" name="eds" value="Pb"> Pb</td>
                                            </tr>
                                        </tbody></table>
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                   <td style="background-color:#eee; text-align:center">Entry No.</td>
                                    <td style="background-color:#fff">
                                        <input name="entry_no" type="text" id="entry_no" style="width:95%;">
                                    </td>
                                </tr>
                                <tr style="height:28px">
                                   <td style="background-color:#eee; text-align:center">이물 색상</td>
                                    <td style="background-color:#fff">
                                        <input name="foreigncolor" type="text" id="foreigncolor" style="width:95%;">
                                    </td>
                                </tr>
                            </tbody></table>
                        </td>                          
                    </tr>
                </tbody>
                </table>
            </div>    
        </div>
