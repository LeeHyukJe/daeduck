package com.wisenut.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.java.Log;

@Setter
@Getter
@ToString
@Log
public class QualityMrbDTO {
	private String biz_place;
	private String factory_gubun;
	private String role_out;
	private String col_time_start;
	private String col_time_end;
	
	public QualityMrbDTO() {
		this.biz_place = "";
		this.factory_gubun = "";
		this.role_out = "";
		this.col_time_start = "";
		this.col_time_end = "";
	}
}
