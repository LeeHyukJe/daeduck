<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="optionArea" style="display:none;">
	<dl class="align">
		<dt>정렬</dt>
		<dd>
			<input type="radio" id="new" checked />
			<label for="new">최신순</label>
		</dd>
		<dd>
			<input type="radio" id="exact" />
			<label for="exact">정확도</label>
		</dd>
	</dl>
	<dl class="sch_area">
		<dt>범위</dt>
		<dd>
			<a href="#" class="on m0">전체</a>
			<a href="#">제목</a>
			<a href="#" class="m0">내용</a>
			<a href="#">작성자</a>
		</dd>
	</dl>
	<dl class="terms">
		<dt>기간</dt>
		<dd>
            <a href="#" class="m0" onClick="javascript:setDate('A');">전체</a>
			<a href="#" onClick="javascript:setDate('D');">오늘</a>
			<a href="#" class="m0" onClick="javascript:setDate('W');">1주</a>
			<a href="#" onClick="javascript:setDate('M');">1개월</a>
		</dd>
	</dl>
	<dl class="calender">
		<dd>
			<label for="s1">시작</label>
			><input name="startDate" id="startDate" type="text" value="" readonly="true" />
			<a href="#" class="btn_calender"><img src="img/calender.gif"></a>
		</dd>
		<dd>
			<label for="e1">종료</label>
			<input name="endDate" id="endDate" type="text" value="" readonly="true" />
			<a href="#" class="btn_calender"><img src="img/calender.gif"></a>
		</dd>
	</dl>
	<a href="#none" onClick="javascript:doRange();">적용</a>
    <input type="hidden" name="range" id="range" value="${value.range}">
</div>