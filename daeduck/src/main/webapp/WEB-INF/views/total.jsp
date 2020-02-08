<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta content="IE=Edge" http-equiv="X-UA-Compatible" />
	<meta name="viewport"
		content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<title>대덕전자 통합검색</title>


	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
	<script src="/resources/js/beta.fix.js"></script>
	<%-- <script src="/resources/js/ark.js"></script> --%>
	<script src="/resources/js/autocomplete.js"></script>
	<script src="/resources/js/category.js"></script>
	<script src="/resources/js/popular.js"></script>
	<script src="/resources/js/search.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.2/handlebars.js"></script>
	<script src="/resources/js/popular.js"></script>
	<script src="/resources/js/recommend.js"></script>

	<link rel="stylesheet" type="text/css" href="/resources/css/search_sty.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/default.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/popular.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/mykeyword.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui.css" />
</head>

<body>
	<div class="wrapper">
		<div class="wrap">

			<div class="header_wrap">
				<!--header -->
				<%@ include file="./searchbox/searchbox.jsp"%>
			</div>
		</div>
		<!-- //header_wrap-->

		<!-- container_wrap -->
		<div class="container_wrap">
			<!-- container -->
			<div class="container">
				<!-- leftArea -->
				<div class="leftArea">
					<%@ include file="./sidenav/sidenav.jsp"%>
				</div>
				<!--//leftArea-->


				<!-- contents -->
				<div class="contents">
					<div class="result_top">
						검색어 <strong>${value.query}</strong>에 대한 통합검색 결과 입니다.
					</div>
					<!-- 전자결재 -->
					<div class="sectit01">
						<h2>
							<span>전자결재</span><span>${APPcount}</span>
						</h2>
						<c:forEach var="entry" items="${total.APP }">
							<dl class="resultsty">
								<dt>
									<a class="tit" href="#"
										onClick="javascript:popupOpen('https://gw.portal.daeduck.com/Website/Approval/Forms/Form.aspx?mode=COMPLETE&piid=${entry.DOCID }','전자결재','width=950','')">
										${entry.SUBJECT }
									</a>
									<dl class="sort">
										<dt>기안자 :</dt>
										<dd>${entry.INITIATOR_NAME }</dd>
										<dt>기안일 :</dt>
										<dd>${entry.INITIATED_DATE }</dd>
										<dt>분류 :</dt>
										<dd>${entry.FOLDER_NAME}</dd>
									</dl>
								</dt>
								<dd class="cont">
									${entry.BODY}
								</dd>
								<dd class="info">
									${entry.TYPE}
								</dd>
								<dd>
									<ul class="attch_file">
										<li class="file_xls">
											<a href="#" class="doc_type">
												${entry.ATTACHNAME}
											</a>
											<div class="preview">
												첨부파일 미리보기...
											</div>
										</li>
									</ul>
								</dd>
							</dl>
						</c:forEach>
						<a href="#" onClick="javascript:doCollection('app')" class="btn_more">결과 더보기</a>
					</div>

					<!-- 통합게시판 -->
					<div class="sectit01">
						<h2>
							<span>통합게시판</span><span>${BBScount}</span>
						</h2>
						<c:forEach var="entry" items="${total.BBS }">
							<dl class="resultsty">
								<dt>
									<a class="tit" href="#"
										onClick="javascript:popupOpen('https://gw.portal.daeduck.com/Website/Approval/Forms/Form.aspx?mode=COMPLETE&piid=${entry.DOCID }','전자결재','width=950','')">
										${entry.SUBJECT }</a>
									<dl class="sort">
										<dt>기안자 :</dt>
										<dd>${entry.INITIATOR_NAME }</dd>
										<dt>기안일 :</dt>
										<dd>${entry.INITIATED_DATE }</dd>
										<dt>분류 :</dt>
										<dd>${entry.FOLDER_NAME}</dd>
									</dl>
								</dt>
								<dd class="cont">
									${entry.BODY}
								</dd>
								<dd class="info">
									${entry.FolderName}
								</dd>
								<dd>
									<ul class="attch_file">
										<li class="file_xls">
											<a href="#" class="doc_type">
												${entry.ATTACHNAME}
											</a>
											<div class="preview">
												첨부파일 미리보기...
											</div>
										</li>
									</ul>
								</dd>
							</dl>
						</c:forEach>
						<a href="#" class="btn_more">결과 더보기</a>
					</div>

					<!-- 표준문서 -->
					<div class="sectit01">
						<h2>
							<span>표준문서</span><span>${STANDARDcount}</span>
						</h2>
						<c:forEach var="entry" items="${total.STANDARD }">
							<dl class="resultsty">
								<dt>
									<a href="#"
										onClick="javascript:popupOpen('https://gw.portal.daeduck.com/Website/Approval/Forms/Form.aspx?mode=COMPLETE&piid=${entry.DOCID }','전자결재','width=950','')">
										${entry.SUBJECT }
									</a>
									<dl class="sort">
										<dt>기안자 :</dt>
										<dd>${entry.CreatorName }</dd>
										<dt>기안일 :</dt>
										<dd>${entry.DATE }</dd>
										<dt>분류 :</dt>
										<dd>${entry.FOLDER_NAME}</dd>
									</dl>

								</dt>
								<dd class="cont">
									${entry.BODY}
								</dd>
								<dd>
									<ul class="attch_file">
										<li class="file_xls">
											<a href="#" class="doc_type">
												${entry.ATTACHNAME}
											</a>
											<div class="preview">
												첨부파일 미리보기...
											</div>
										</li>
									</ul>
								</dd>
							</dl>
						</c:forEach>
					</div>

					<!-- 기술문서 -->

					<div class="sectit01">
						<h2>
							<span>기술문서</span><span>${TECHNOLOGYcount}</span>
						</h2>
						<c:forEach var="entry" items="${total.TECHNOLOGY }">
							<dl class="resultsty">
								<dt>
									<a class="tit" href="#"
										onClick="javascript:popupOpen('https://gw.portal.daeduck.com/Website/Approval/Forms/Form.aspx?mode=COMPLETE&piid=${entry.DOCID }','전자결재','width=950','')">
										${entry.SUBJECT }
									</a>
									<dl class="sort">
										<dt>기안자 :</dt>
										<dd>${entry.INITIATOR_NAME }</dd>
										<dt>기안일 :</dt>
										<dd>${entry.INITIATED_DATE }</dd>
										<dt>분류 :</dt>
										<dd>${entry.FOLDER_NAME}</dd>
									</dl>
								</dt>
								<dd class="cont">
									${entry.BODY}
								</dd>
								<dd class="info">
									${entry.TYPE}
								</dd>
								<dd>
									<ul class="attch_file">
										<li class="file_xls">
											<a href="#" class="doc_type">
												${entry.ATTACHNAME}
											</a>
											<div class="preview">
												첨부파일 미리보기...
											</div>
										</li>
									</ul>
								</dd>
							</dl>
						</c:forEach>
						<a href="#" class="btn_more">결과 더보기</a>
					</div>

					<!-- 품질관리 -->
					<div class="sectit01">
						<h2>
							<span>전자결재</span><span>${totalCount}</span>
						</h2>
						<c:forEach var="entry" items="${total.APP }">
							<dl class="resultsty">
								<dt>
									<a href="#"
										onClick="javascript:popupOpen('https://gw.portal.daeduck.com/Website/Approval/Forms/Form.aspx?mode=COMPLETE&piid=${entry.DOCID }','전자결재','width=950','')">
										${entry.SUBJECT }
									</a>

								<dt>기안자 :</dt>
								<dl>${entry.INITIATOR_NAME }</dl>
								<dt>기안일 :</dt>
								<dl>${entry.INITIATED_DATE }</dl>
								<dt>분류 :</dt>
								<dl>${entry.FOLDER_NAME}</dl>
								</dt>
								<dd class="cont">
									${entry.BODY}
								</dd>
								<dd class="info">
									${entry.TYPE}
								</dd>
								<dd>
									<ul class="attch_file">
										<li class="file_xls">
											<a href="#" class="doc_type">
												${entry.ATTACHNAME}
											</a>
											<div class="preview">
												첨부파일 미리보기...
											</div>
										</li>
									</ul>
								</dd>
							</dl>
						</c:forEach>
					</div>
				</div>
				<!-- //contenst -->

				<!-- rightArea -->
				<div class="rightArea">
					<dl class="rank">
						<%@ include file="./popular/popular.jsp"%>
					</dl>
					<dl class="keyword">
						<dt>내가 찾은 검색어</dt>
						<dd>
							<ul id="mykeyword">
								
							</ul>
						</dd>
					</dl>
					<dl class="recommend">
						<dt>개인화 문서 추천</dt>
						<dd>
							<ul id="recommend">
								<%-- <li>
									<a href="#">2018년도 업무용 자동차(건설기계)보험 가입.zip</a>
								</li>
								<li>
									<a href="#">2018년도 업무용 자동차(건설기계)보험 가입.zip</a>
								</li>
								<li>
									<a href="#">2018년도 업무용 자동차(건설기계)보험 가입.zip</a>
								</li>
								<li>
									<a href="#">2018년도 업무용 자동차(건설기계)보험 가입.zip</a>
								</li>
								<li>
									<a href="#">2018년도 업무용 자동차(건설기계)보험 가입.zip</a>
								</li> --%>
							</ul>
						</dd>
					</dl>
				</div>
				<!-- //rightArea -->

			</div>
		</div>
		<!-- container_wrap-->

		
	</div>
	<!-- //wrap -->





	<%-- <ul class="mykeyword" id="mykeyword"> --%>


</body>

<script>
	getMyKeyword('${value.query}', '${totalCount}');
</script>

</html>