package com.wisenut.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SrchParamVO {
	private int startCount;
	private String mode;
	private String sort;
	private String collection;
	private String range;
	private String startDate;
	private String endDate;
	private String searchField;
	private String reQuery;
	private String realQuery;
	private String printView;
	private String exquery;
	private String query;
	private String paging;
	private int listCount;
	private String colflag;
	
	// 전자결재 권한 체크 파라미터
	private String authority; // 사번
	private String authorityapdept; // 결재 권한 부서코드
	
	// 전자 결재를 제외한 권한 체크 파라미터
	private String authorityex; // 사번
	private String authoritydept; // 부서코드
	
	private int totalViewCnt;
	private String tech;
	private String cateQuery;
	

	public SrchParamVO() {
		this.startCount = 0;
		this.mode = "basic";
		this.sort = "RANK";
		this.collection = "ALL";
		this.range = "";
		this.startDate = "";
		this.endDate = "";
		this.searchField = "";
		this.reQuery = "2";
		this.realQuery = "";
		this.printView = "";
		this.exquery = "";
		this.query = "";
		this.paging = "";
		this.listCount = 10;
		this.authority = "";
		this.totalViewCnt = 3;
		this.tech="";
		this.cateQuery="";
		this.authorityapdept="";
		this.authorityex = "";
		this.authoritydept = "";
		this.colflag = "";
	}
	
	public String getCurrentDate() {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
		format.format(date);
		return format.toString();
	}

}
